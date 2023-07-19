import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";
import {
  RetrieveDisciplinaPath,
  SearchDisciplinaQuery,
} from "../schemas/disciplina";
import { mountSearchSet } from "../utils";

const search: RequestHandler = async (req, res, next) => {
  let { nome, unidade, _offset, _size } = SearchDisciplinaQuery.parse(
    req.query
  );

  const disciplinas: {
    _total: number;
    id: string;
    nome: string;
    modalidade: string;
  }[] = await prisma.$queryRaw`
    select
      count(dis."ID") over() as _total,
      dis."ID",
      dis."NOME",
      dis."MODALIDADE"
    from "SIGAA_DISCIPLINA" dis
    where (unaccent(dis."NOME") ilike '%'||unaccent(${nome})||'%' or ${
    nome ?? null
  } is null) and
	        (unaccent(dis."UNIDADE") ilike '%'||unaccent(${unidade})||'%' or ${
    unidade ?? null
  } is null)
    order by dis."NOME"
    offset ${_offset}
    limit ${_size};`;

  const _total = Number(disciplinas[0]?._total);

  return res.json(
    mountSearchSet(
      disciplinas.map((item) => ({ ...item, _total: undefined })),
      _offset,
      _total
    )
  );
};

const retrieve: RequestHandler = async (req, res, next) => {
  const { id } = RetrieveDisciplinaPath.parse(req.params);

  const disciplina: any = await prisma.$queryRaw`
    select  
      dis."ID",
      dis."NOME",
      dis."CARGA_HORARIA_TEORICA",
      dis."CARGA_HORARIA_PRATICA",
      und."ID" as "UNIDADE_CODIGO",
      und."NOME" as "UNIDADE_NOME"
    from "SIGAA_DISCIPLINA" dis
    left join "SIGAA_UNIDADE" und ON dis."UNIDADE" = und."ID" 
    where dis."ID" = ${id};`;

  const preRequisitos: any = await prisma.$queryRaw`
  select
    dis."ID",
    dis."NOME",
    dis."MODALIDADE",
    dis."CARGA_HORARIA_TEORICA",
    dis."CARGA_HORARIA_PRATICA",
    dis."UNIDADE" as "UNIDADE_CODIGO"
  from "SIGAA_PREREQ" pre
  left join "SIGAA_DISCIPLINA" dis on pre."DISCIPLINA_REQUERIDO" = dis."ID"
  where pre."DISCIPLINA_REQUER" = ${id}`;

  if(!disciplina[0]){
    throw new HttpError.NotFound(`Disciplina ${id} não encontrada!`);
  }

  return res.json({...disciplina[0], preRequisitos});
};

export default {
  search,
  retrieve,
};

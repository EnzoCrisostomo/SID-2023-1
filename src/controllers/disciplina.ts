import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";
import {
  DetailDisciplinaParams,
  DetailDisciplinaPreRequisitosQueryResult,
  DetailDisciplinaQueryResult,
  SearchDisciplinaQuery,
  SearchDisciplinaQueryResult,
} from "../schemas/disciplina";
import { mountSearchSet } from "../utils";

const search: RequestHandler = async (req, res, next) => {
  let { nome, unidade, _offset, _size } = SearchDisciplinaQuery.parse(
    req.query
  );

  const disciplinas = SearchDisciplinaQueryResult.parse(
    await prisma.$queryRaw`
      select
        count(dis."ID") over() as _total,
        dis."ID" as id,
        dis."ID" as codigo,
        dis."NOME" as nome,
        dis."MODALIDADE" as modalidade
      from "SIGAA_DISCIPLINA" dis
      where (unaccent(dis."NOME") ilike '%'||unaccent(${nome})||'%' or ${
      nome ?? null
    } is null) and
            (unaccent(dis."UNIDADE") ilike '%'||unaccent(${unidade})||'%' or ${
      unidade ?? null
    } is null)
      order by dis."NOME"
      offset ${_offset}
      limit ${_size};`
  );

  const _total = Number(disciplinas[0]?._total ?? 0);

  const disciplinasTransformed = disciplinas.map((item) => ({
    id: item.id,
    codigo: item.codigo,
    nome: item.nome,
    modalidade: item.modalidade,
  }));

  return res.json(mountSearchSet(disciplinasTransformed, _offset, _total));
};

const retrieve: RequestHandler = async (req, res, next) => {
  const { id } = DetailDisciplinaParams.parse(req.params);

  const disciplina = DetailDisciplinaQueryResult.parse(
    await prisma.$queryRaw`
      select  
        dis."ID",
        dis."NOME",
        dis."MODALIDADE",
        dis."CARGA_HORARIA_TEORICA",
        dis."CARGA_HORARIA_PRATICA",
        und."ID" as "UNIDADE_CODIGO",
        und."NOME" as "UNIDADE_NOME"
      from "SIGAA_DISCIPLINA" dis
      left join "SIGAA_UNIDADE" und ON dis."UNIDADE" = und."ID" 
      where dis."ID" = ${id}`
  );

  if (!disciplina[0]) {
    throw new HttpError.NotFound(`Disciplina [${id}] não encontrada!`);
  }

  const preRequisitos = DetailDisciplinaPreRequisitosQueryResult.parse(
    await prisma.$queryRaw`
      select
        dis."ID" as id,
        dis."ID" as codigo,
        dis."NOME" as nome,
        dis."MODALIDADE" as modalidade
      from "SIGAA_PREREQ" pre
      left join "SIGAA_DISCIPLINA" dis on pre."DISCIPLINA_REQUERIDO" = dis."ID"
      where pre."DISCIPLINA_REQUER" = ${id}`
  );

  const disciplinaTransformed = {
    id: disciplina[0].ID,
    codigo: disciplina[0].ID,
    nome: disciplina[0].NOME,
    modalidade: disciplina[0].MODALIDADE,
    cargaHoraria: {
      teorica: disciplina[0].CARGA_HORARIA_TEORICA,
      pratica: disciplina[0].CARGA_HORARIA_PRATICA,
    },
    unidade: {
      codigo: disciplina[0].UNIDADE_CODIGO,
      nome: disciplina[0].UNIDADE_NOME,
    },
    preRequisitos,
  };

  return res.json(disciplinaTransformed);
};

export default {
  search,
  retrieve,
};

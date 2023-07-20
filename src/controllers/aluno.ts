import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";
import {
  DetailAlunoParams,
  DetailAlunoQueryResult,
  SearchAlunoQuery,
  SearchAlunoQueryResult,
} from "../schemas/aluno";
import { mountSearchSet } from "../utils";

const search: RequestHandler = async (req, res, next) => {
  const { nome, curso, curriculo, periodoIngresso, _offset, _size } =
    SearchAlunoQuery.parse(req.query);

  const alunos = SearchAlunoQueryResult.parse(
    await prisma.$queryRaw`
        select
          count(alu."MATRICULA") over() as _total,
          alu."MATRICULA" as id,
          alu."MATRICULA" as matricula,
	        alu."NOME" as nome
        from "SIGAA_ALUNO" alu
        inner join "SIGAA_RL_ALUNO_CURSO" ac ON alu."MATRICULA" = ac."ALUNO" 
        where (unaccent(alu."NOME") ilike '%'||unaccent(${nome}::text)||'%' or ${nome}::text is null) and
              (unaccent(ac."CURSO") ilike '%'||unaccent(${curso}::text)||'%' or ${curso}::text is null) and
              (unaccent(ac."CURRICULO") ilike '%'||unaccent(${curriculo}::text)||'%' or ${curriculo}::text is null) and
              (substring(ac."PERIODO_LETIVO_REGISTRO" from 1 for 4) = ${
                periodoIngresso?.split("/")[0]
              }::text or ${periodoIngresso}::text is null) and
              (substring(ac."PERIODO_LETIVO_REGISTRO" from 5) = ${
                periodoIngresso?.split("/")[1]
              }::text or ${periodoIngresso}::text is null)
        order by alu."NOME" 
        offset ${_offset}::integer
        limit ${_size}::integer`
  );

  const _total = Number(alunos[0]?._total ?? 0);

  const alunosTransformed = alunos.map((item) => ({
    id: item.id,
    matricula: item.matricula,
    nome: item.nome,
  }));

  return res.json(mountSearchSet(alunosTransformed, _offset, _total));
};

const detail: RequestHandler = async (req, res, next) => {
  const { matricula } = DetailAlunoParams.parse(req.params);

  const aluno = DetailAlunoQueryResult.parse(
    await prisma.$queryRaw`
    select
      alu."MATRICULA" as id,
      alu."MATRICULA" as matricula,
      alu."NOME" as nome,
      ac."CURSO" as cod_curso,
      cur."NOME" as "nome_curso",
      ac."CURRICULO" as curriculo,
      ac."IRA" as ira,
      substring(ac."PERIODO_LETIVO_REGISTRO" from 1 for 4) as "ano_ingresso",
      substring(ac."PERIODO_LETIVO_REGISTRO" from 5) as "numero_ingresso"
    from "SIGAA_ALUNO" alu
    inner join "SIGAA_RL_ALUNO_CURSO" ac ON alu."MATRICULA" = ac."ALUNO" 
    left join "SIGAA_CURSO" cur on ac."CURSO" = cur."ID"
    where alu."MATRICULA" = ${matricula}::text`
  );

  if (!aluno[0]) {
    throw new HttpError.NotFound(`Aluno [${matricula}] não encontrado!`);
  }

  const alunoTransformed = {
    id: aluno[0].id,
    matricula: aluno[0].matricula,
    nome: aluno[0].nome,
    email: aluno[0].nome.replace(" ", ".").toLocaleLowerCase() + "@aluno.unb.br",
    ira: Number(aluno[0].ira.toPrecision(3)),
    curriculo: aluno[0].curriculo,
    status: true,
    periodoIngresso: {
      ano: aluno[0].ano_ingresso,
      numero: aluno[0].numero_ingresso
    },
    curso: {
      id: aluno[0].cod_curso,
      codigo: aluno[0].cod_curso,
      nome: aluno[0].nome_curso
    }
  }

  return res.json(alunoTransformed);
};

export default {
  search,
  detail,
};

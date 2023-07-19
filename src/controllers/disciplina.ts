import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";
import {
  RetrieveDisciplinaPath,
  SearchDisciplinaQuery,
} from "../schemas/disciplina";
import { mountSearchSet } from "../utils";

const search: RequestHandler = async (req, res, next) => {
  const { nome, unidade, _offset, _size } = SearchDisciplinaQuery.parse(
    req.query
  );

  const _total = await prisma.sIGAA_DISCIPLINA.count({
    where: {
      NOME: {
        contains: nome,
        mode: "insensitive",
      },
      UNIDADE: {
        contains: unidade,
        mode: "insensitive",
      },
    },
  });

  const disciplinas = await prisma.sIGAA_DISCIPLINA.findMany({
    where: {
      NOME: {
        contains: nome,
        mode: "insensitive",
      },
      UNIDADE: {
        contains: unidade,
        mode: "insensitive",
      },
    },
    orderBy: { ID: "asc" },
    skip: _offset,
    take: _size,
  });

  return res.json(mountSearchSet(disciplinas, _offset, _total));
};

const retrieve: RequestHandler = async (req, res, next) => {
  const { id } = RetrieveDisciplinaPath.parse(req.params);

  const disciplina = await prisma.sIGAA_DISCIPLINA.findUnique({
    where: { ID: id },
    include:{
      SIGAA_PREREQ_SIGAA_PREREQ_DISCIPLINA_REQUERToSIGAA_DISCIPLINA: true,
      SIGAA_UNIDADE: true,
      SIGAA_RL_ALUNO_CURSO_DISCIPLINA: true,
      SIGAA_RL_CURRICULO_DISCIPLINA: true,
      SIGAA_TURMA: true,
    }
  });

  return res.json(disciplina);
};

export default {
  search,
  retrieve
};

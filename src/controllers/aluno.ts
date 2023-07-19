import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";
import { RetrieveAlunoParams, SearchAlunoQuery } from "../schemas/aluno";
import { mountSearchSet } from "../utils";

const search: RequestHandler = async (req, res, next) => {
  const { nome, curso, curriculo, periodoIngresso, status, _offset, _size } =
    SearchAlunoQuery.parse(req.query);

  const _total = await prisma.sIGAA_ALUNO.count({
    where: {
      NOME: {
        contains: nome,
        mode: "insensitive",
      },
    },
  });

  const alunos = await prisma.sIGAA_ALUNO.findMany({
    where: {
      NOME: {
        contains: nome,
        mode: "insensitive",
      },
    },
    orderBy: { MATRICULA: "asc" },
    skip: _offset,
    take: _size,
  });

  return res.json(mountSearchSet(alunos, _offset, _total));
};

const retrieve: RequestHandler = async (req, res, next) => {
  const { matricula } = RetrieveAlunoParams.parse(req.params);

  const aluno = await prisma.sIGAA_ALUNO.findUnique({
    where: { MATRICULA: matricula },
    include: {
      SIGAA_RL_ALUNO_CURSO: true,
    },
  });

  return res.json(aluno);
};

export default {
  search,
  retrieve,
};

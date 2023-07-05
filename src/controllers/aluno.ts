import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";

const search: RequestHandler = async (req, res, next) => {
  const alunos = await prisma.sIGAA_ALUNO.findMany({});

  return res.json(alunos);
};

export default {
  list: search,
};

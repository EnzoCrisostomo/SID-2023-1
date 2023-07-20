import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";

const search: RequestHandler = async (req, res, next) => {
  const matriculas = await prisma.sIGAA_MATRICULA_HISTORICO.findMany({});

  return res.json(matriculas);
};

export default {
  search,
};

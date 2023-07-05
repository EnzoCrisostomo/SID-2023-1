import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";

const list: RequestHandler = async (req, res, next) => {
  const matriculas = await prisma.sIGAA_MATRICULA.findMany({});

  return res.json(matriculas);
};

export default {
  list,
};

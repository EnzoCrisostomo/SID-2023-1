import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";

const search: RequestHandler = async (req, res, next) => {
  const cursos = await prisma.sIGAA_CURSO.findMany({});

  return res.json(cursos);
};

export default {
  search,
};

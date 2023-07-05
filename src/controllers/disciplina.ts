import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";

const search: RequestHandler = async (req, res, next) => {

  const { nome, unidade, _offset, _size } = req.query;

  /* if (typeof nome != 'string' || typeof unidade != 'string' || typeof _offset != 'string' || typeof _size != 'string')
    throw new HttpError.BadRequest("Wrong Type"); */


  const disciplinas = await prisma.sIGAA_DISCIPLINA.findMany({
    where: {
      NOME: {
        contains: nome as any,
        mode: "insensitive"
      },
      UNIDADE: {
        contains: unidade as any,
        mode: "insensitive"
      }
    },
    orderBy: { ID: "asc" },
    skip: _offset ? parseInt(_offset as any, 10) : undefined,
    take: _size ? parseInt(_size as any, 10) : undefined
  });

  return res.json(disciplinas);
};

export default {
  list: search,
};

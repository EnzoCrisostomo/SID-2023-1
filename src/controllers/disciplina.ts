import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";
import { SearchDisciplinaRequest } from "../schemas/disciplina";

function mountSearchSet<ItemType>(_items: ItemType[], _offset?: number, _total?: number){
  return {
    _timestamp: Date.now(),
    _total,
    _size: _items.length,
    _offset,
    _next: "string",
    _previous: "string",
    _items,
  }
}

const search: RequestHandler = async (req, res, next) => {
  const { nome, unidade, _offset, _size } = SearchDisciplinaRequest.parse(
    req.query
  );

  const _total = await prisma.sIGAA_DISCIPLINA.count();

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

export default {
  list: search,
};

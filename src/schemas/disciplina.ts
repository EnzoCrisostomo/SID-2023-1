import { bigint, z } from "zod";

export const SearchDisciplinaQuery = z.object({
  nome: z.string().optional(),
  unidade: z.string().optional(),
  _offset: z.coerce.number().min(0, '_offset não pode ser menor que 0.').optional(),
  _size: z.coerce.number().min(1, '_size não pode ser menor que 1.').optional(),
});

export const SearchDisciplinaQueryResult = z.array(z.object({
  _total: z.bigint().min(BigInt(0)),
  id: z.string(),
  codigo: z.string(),
  nome: z.string(),
  modalidade: z.enum(["Presencial", "EAD"])
}));

export const DetailDisciplinaQueryResult = z.array(z.object({
  ID: z.string(),
  NOME: z.string(),
  MODALIDADE: z.enum(["Presencial", "EAD"]),
  CARGA_HORARIA_TEORICA: z.coerce.number(),
  CARGA_HORARIA_PRATICA: z.coerce.number(),
  UNIDADE_CODIGO: z.string(),
  UNIDADE_NOME: z.string()
}));

export const DetailDisciplinaPreRequisitosQueryResult = z.array(z.object({
  id: z.string(),
  codigo: z.string(),
  nome: z.string(),
  modalidade: z.enum(["Presencial", "EAD"])
}));

export const DetailDisciplinaParams = z.object({
  id: z.coerce.string(),
});

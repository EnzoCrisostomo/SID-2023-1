import { z } from "zod";

export const SearchAlunoQuery = z.object({
  nome: z.string().optional(),
  curso: z.string().optional(),
  curriculo: z.string().optional(),
  periodoIngresso: z
    .string()
    .regex(
      RegExp("[0-9]{0,4}/[0-9]?"),
      "Padrão: [ano]/[periodo] Ex: '2019/2'\n"
    )
    .optional(),
  _offset: z.coerce
    .number()
    .min(0, "_offset não pode ser menor que 0.")
    .optional(),
  _size: z.coerce.number().min(1, "_size não pode ser menor que 1.").optional(),
});

export const SearchAlunoQueryResult = z.array(
  z.object({
    _total: z.bigint().min(BigInt(0)),
    id: z.string(),
    matricula: z.string(),
    nome: z.string(),
  })
);

export const DetailAlunoParams = z.object({
  matricula: z.coerce.string(),
});

export const DetailAlunoQueryResult = z.array(
  z.object({
    id: z.string(),
    matricula: z.string(),
    nome: z.string(),
    cod_curso: z.string(),
    nome_curso: z.string(),
    curriculo: z.string(),
    ira: z.number(),
    ano_ingresso: z.coerce.number(),
    numero_ingresso: z.coerce.number(),
  })
);

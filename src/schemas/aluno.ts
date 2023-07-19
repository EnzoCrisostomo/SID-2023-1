import { z } from "zod";

export const SearchAlunoQuery = z.object({
  nome: z.string().optional(),
  curso: z.string().optional(),
  curriculo: z.string().optional(),
  periodoIngresso: z.string().optional(),
  status: z.boolean().optional(),
  _offset: z.coerce.number().min(0).optional(),
  _size: z.coerce.number().min(1).optional(),
});

export const RetrieveAlunoParams = z.object({
  matricula: z.coerce.string(),
});

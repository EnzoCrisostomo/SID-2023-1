import { z } from "zod";

export const SearchDisciplinaRequest = z.object({
  nome: z.string().optional(),
  unidade: z.string().optional(),
  _offset: z.coerce.number().min(0).optional(),
  _size: z.coerce.number().min(1).optional(),
});

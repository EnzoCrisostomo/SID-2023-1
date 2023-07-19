import { z } from "zod";

export const SearchDisciplinaQuery = z.object({
  nome: z.string().optional(),
  unidade: z.string().optional(),
  _offset: z.coerce.number().min(0).optional(),
  _size: z.coerce.number().min(1).optional(),
});

export const RetrieveDisciplinaPath = z.object({
  id: z.coerce.string(),
});

import { z } from 'zod';

export const SearchCursoQuery = z.object({
  nome: z.string().optional(),
  grauAcademico: z.string().optional(),
  modalidade: z.string().optional(),
  turno: z.string().optional(),
  coordenador: z.string().optional(),
  _offset: z.coerce
    .number()
    .min(0, "_offset não pode ser menor que 0.")
    .optional(),
  _size: z.coerce.number().min(1, "_size não pode ser menor que 1.").optional(),
});

export const SearchCursoQueryResult = z.array(
  z.object({
    _total: z.bigint().min(BigInt(0)),
    ID: z.string(),
    CODIGO: z.string(),
    NOME: z.string(),
  }),
);

export const DetailCursoParams = z.object({
  id: z.string(),
});

export const DetailCursoQueryResult = z.array(
  z.object({
    ID: z.string(),
    NOME: z.string(),
    GRAU_ACADEMICO: z.string(),
    TURNO: z.string(),
    MODALIDADE: z.string(),
    COORDENADOR: z.string(),
  })
);

export const DetailCursoUnidadeQueryResult = z.array(
  z.object({
    ID: z.string(),
    NOME: z.string()
  })
);

export const cursoPathParams = z.object({
  id: z.string()
});

export const searchEstruturaQuery = z.object({
  status: z.enum(["ativo", "inativo", "Ativo", "Inativo"]).optional(),
  _offset: z.coerce
    .number()
    .min(0, "_offset não pode ser menor que 0.")
    .optional(),
  _size: z.coerce.number().min(1, "_size não pode ser menor que 1.").optional(),
});

export const searchEstruturaCurricularQueryResult = z.array(
  z.object({
    _total: z.bigint().min(BigInt(0)),
    ID: z.string(),
    CODIGO: z.string(),
    STATUS: z.string(),
    PERIODO_LETIVO_VIGOR_ANO: z.string(),
    PERIODO_LETIVO_VIGOR_NUMERO: z.string(),
  })
);

export const curriculoPathParams = z.object({
  id: z.string(),
  curriculo: z.string()
});

export const curriculoQueryResult = z.array(
  z.object({
    ID: z.string(),
    STATUS: z.string(),
    PERIODO_LETIVO_VIGOR_ANO: z.string().regex(/^\d+$/).transform(Number),
    PERIODO_LETIVO_VIGOR_NUMERO: z.string().regex(/^\d+$/).transform(Number),
    CARGA_HORARIA_MINIMA_TOTAL: z.number(),
    CARGA_HORARIA_MINIMA_OPT: z.number(),
    CARGA_HORARIA_OBR: z.number(),
    CARGA_HORARIA_ELETIVA_MAX: z.number(),
    CARGA_HORARIA_MAX_PERIODO: z.number(),
    NUM_PERIODOS: z.number(),
    MIN_PERIODOS: z.number(),
    MAX_PERIODOS: z.number()
  })
);

export const disciplinaQueryResult = z.array(
  z.object({
    periodo: z.number().nullable(),
    tipo: z.enum(["Obrigatoria", "Optativa", "obrigatoria", "optativa"]),
    id: z.string(),
    codigo: z.string(),
    nome: z.string(),
    modalidade: z.enum(["Presencial", "EAD"])
  })
);

export const searchDisciplinaQueryParams = z.object({
  tipo: z.string().optional(),
  nivel: z.coerce.number().min(1).max(10).optional(),
  nome: z.string().optional(),
  unidade: z.string().optional(),
  _offset: z.coerce
    .number()
    .min(0, "_offset não pode ser menor que 0.")
    .optional(),
  _size: z.coerce.number().min(1, "_size não pode ser menor que 1.").optional(),
});

export const searchDisciplinaQueryResult = z.array(
  z.object({
    _total: z.bigint().min(BigInt(0)),
    PERIODO: z.number().nullable(),
    TIPO: z.string(),
    CODIGO: z.string(),
    NOME: z.string(),
    MODALIDADE: z.string(),
    UNIDADE: z.string()
  })
);
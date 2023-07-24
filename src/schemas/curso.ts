import {z} from 'zod';

export const SearchCursoQuery = z.object({
    codigo:z.string().optional(),
    nome: z.string().optional(),
    grauAcademico: z.string().optional(),
    modalidade: z.string().optional(),
    coordenador: z.string().optional(),
    _offset: z.coerce
        .number()
        .min(0, "_offset não pode ser menor que 0.")
        .optional(),
  });
  
  export const SearchCursoQueryResult = z.array(
    z.object({
      _total:z.bigint().min(BigInt(0)),
      ID: z.string(),
      CODIGO:z.string(),
      NOME: z.string(),
      _offset: z.coerce
        .number()
        .min(0, "_offset não pode ser menor que 0.")
        .optional(),
    })
  );

  export const DetailCursoParams = z.object({
    id: z.string(),
  });
  
  export const DetailCursoQueryResult = z.array(
    z.object({
      ID:z.string().optional(),
      NOME: z.string().optional(),
      GRAU_ACADEMICO: z.string().optional(),
      TURNO: z.string().optional(),
      MODALIDADE: z.string().optional(),
      COORDENADOR: z.string().optional(),
    })
  );
  
  export const searchEstruturaQuery = z.object({
      id:z.string(),
      status: z.string().optional(),
      _offset: z.coerce
        .number()
        .min(0, "_offset não pode ser menor que 0.")
        .optional(),
    });

  export const searchEstruturaCurricularQueryResult = z.array(
    z.object({
      _total:z.bigint().min(BigInt(0)),
      _offset: z.coerce
        .number()
        .min(0, "_offset não pode ser menor que 0.")
        .optional(),
      ID:z.string(),
      CODIGO:z.string(),
      STATUS:z.string(),
      PERIODO_LETIVO_VIGOR_ANO:z.string(),
      PERIODO_LETIVO_VIGOR_NUMERO:z.string(),
    })
  );

  export const curriculoQueryResult = z.array(
    z.object({
      ID:z.string(), 
      STATUS:z.string(), 
      PERIODO_LETIVO_VIGOR_ANO:z.string().regex(/^\d+$/).transform(Number),
      PERIODO_LETIVO_VIGOR_NUMERO:z.string().regex(/^\d+$/).transform(Number), 
      CARGA_HORARIA_MINIMA_TOTAL:z.number(), 
      CARGA_HORARIA_MINIMA_OPT:z.number(), 
      CARGA_HORARIA_OBR:z.number(), 
      CARGA_HORARIA_ELETIVA_MAX:z.number(), 
      CARGA_HORARIA_MAX_PERIODO:z.number(), 
      NUM_PERIODOS:z.number(), 
      MIN_PERIODOS:z.number(), 
      MAX_PERIODOS:z.number()
    })
  );

  export const disciplinaQueryResult = z.array(
    z.object({
      PERIODO:z.number().optional().nullable(),
      TIPO:z.string(),
      ID:z.string(),
      NOME:z.string(),
      CARGA_HORARIA_TEORICA:z.number(),
      CARGA_HORARIA_PRATICA:z.number(),
      UNIDADE:z.string()
    })
  );
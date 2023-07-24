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
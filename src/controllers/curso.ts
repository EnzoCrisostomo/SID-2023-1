import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";
import { DetailCursoParams, DetailCursoQueryResult, SearchCursoQuery, SearchCursoQueryResult, curriculoQueryResult, disciplinaQueryResult, searchEstruturaCurricularQueryResult, searchEstruturaQuery } from "../schemas/curso";
import { mapStatus, mountSearchSet } from "../utils";

const search: RequestHandler = async (req, res, next) => {
  const { codigo, nome, grauAcademico, modalidade, coordenador,_offset} =
    SearchCursoQuery.parse(req.query);
  
  const searchCurso = SearchCursoQueryResult.parse(
    await prisma.$queryRaw`
    select  
      count(cur."ID") over() as _total,
      cur."ID",
      cur."ID" as "CODIGO",
      cur."NOME"
    from "SIGAA_CURSO" cur
    where (unaccent(cur."NOME") ilike '%'||unaccent(${nome}::text)||'%' or ${nome}::text is null) and
      (unaccent(cur."ID") ilike '%'||unaccent(${codigo}::text)||'%' or ${codigo}::text is null) and
      (unaccent(cur."GRAU_ACADEMICO") ilike '%'|| unaccent(${grauAcademico}::text) || '%' or ${grauAcademico}::text is null) and
      (unaccent(cur."MODALIDADE") ilike '%'|| unaccent(${modalidade}::text) || '%' or ${modalidade}::text is null) and
      (unaccent(cur."COORDENADOR") ilike '%'|| unaccent(${coordenador}::text) || '%' or ${coordenador}::text is null)
      offset ${_offset}::integer`
  );
  const _total = Number(searchCurso[0]?._total ?? 0);

  const cursoTransformed = searchCurso.map((item)=>({
    "id": item.ID,
    "codigo": item.CODIGO,
    "nome":item.NOME
  }));

  return res.json(mountSearchSet(cursoTransformed, _offset,_total));
};

const detail: RequestHandler = async (req, res, next) => {
  const {id}= DetailCursoParams.parse(req.params);
  
  const curso = DetailCursoQueryResult.parse(
    await prisma.$queryRaw`
    select  
      cur."ID",
      cur."NOME",
      cur."GRAU_ACADEMICO",
      cur."TURNO",
      cur."MODALIDADE",
      cur."COORDENADOR"
    from "SIGAA_CURSO" cur
    where cur."ID" = ${id}::text`);
  
  return res.json(curso);
};
const searchEstruturaCurricular: RequestHandler = async (req, res, next) => {
  let {id: codigo , status, _offset} = searchEstruturaQuery.parse(req.params, req.query);
  
  if(status="ativo") {
    status = "A"
  }else{
    status = "I"
  };

  const estruturaCurricular =  searchEstruturaCurricularQueryResult.parse(
    await prisma.$queryRaw`  
    select 
      count(ec."ID") over() as _total,
      substring(ec."ID" from 6) as "ID",
      substring(ec."ID" from 1 for 4) as "CODIGO", 
      ec."STATUS", 
      substring(ec."PERIODO_LETIVO_VIGOR" from 1 for 4) as "PERIODO_LETIVO_VIGOR_ANO",
      substring(ec."PERIODO_LETIVO_VIGOR" from 5) as "PERIODO_LETIVO_VIGOR_NUMERO"
    FROM public."SIGAA_CURRICULO" ec
    inner join "SIGAA_RL_CURRICULO_CURSO" srcc ON ec."ID" = srcc."CURRICULO" 
    where srcc."CURSO" = ${codigo} and ec."STATUS" = ${status}
    offset ${_offset}::integer`
  );

  const _total = Number(estruturaCurricular[0]?._total ?? 0);

  const estruturaTransformed = estruturaCurricular.map((item)=>({
    "id": item.ID,
    "codigo": item.CODIGO,
    "status":mapStatus(item.STATUS),
    "periodoLetivoEntradaVigor":{
      "ano":item.PERIODO_LETIVO_VIGOR_ANO,
      "numero":item.PERIODO_LETIVO_VIGOR_NUMERO
    }
  }));

  return res.json(mountSearchSet(estruturaTransformed,_offset,_total));
};

const detailEstruturaCurricular: RequestHandler = async (req, res, next) => {
  const {id, curriculo} = req.params;
  
  const detailEstruturaCurricular = curriculoQueryResult.parse(
    await prisma.$queryRaw`
    select   
      ec."ID", 
      ec."STATUS", 
      substring(ec."PERIODO_LETIVO_VIGOR" from 1 for 4) as "PERIODO_LETIVO_VIGOR_ANO",
      substring(ec."PERIODO_LETIVO_VIGOR" from 4) as "PERIODO_LETIVO_VIGOR_NUMERO", 
      CAST(ec."CARGA_HORARIA_MINIMA_TOTAL" as integer), 
      CAST(ec."CARGA_HORARIA_MAX_PERIODO" as integer), 
      CAST(ec."CARGA_HORARIA_MINIMA_OPT" as integer), 
      CAST(ec."CARGA_HORARIA_OBR" as integer), 
      CAST(ec."CARGA_HORARIA_ELETIVA_MAX" as integer), 
      CAST(ec."NUM_PERIODOS" as integer), 
      CAST(ec."MIN_PERIODOS" as integer), 
      CAST(ec."MAX_PERIODOS" as integer)
    FROM public."SIGAA_CURRICULO" ec
    where ec."ID" = ${id}||'/'||${curriculo};
    `); 

  const disciplinas = disciplinaQueryResult.parse(
    await prisma.$queryRaw`
    select 
      CAST(srcd."PERIODO" as integer),
      case 
        when srcd."TIPO" = 'OBR' then 'Obrigatória'
        when srcd."TIPO" = 'OPT' then 'Optativa'
      end as "TIPO",
      dis."ID",
      dis."NOME",
      CAST(dis."CARGA_HORARIA_TEORICA" as integer),
      CAST(dis."CARGA_HORARIA_PRATICA" as integer),
      dis."UNIDADE" 
    from "SIGAA_RL_CURRICULO_DISCIPLINA" srcd 
    left join "SIGAA_DISCIPLINA" dis ON srcd."DISCIPLINA" = dis."ID" 
    where srcd."CURRICULO" = ${id}||'/'||${curriculo}
    `);

  const joinedQueries={
    periodoLetivoEntradavigor:{
      ano:detailEstruturaCurricular[0].PERIODO_LETIVO_VIGOR_ANO,
      numero:detailEstruturaCurricular[0].PERIODO_LETIVO_VIGOR_NUMERO
    },
    disciplinas,
    cargaHoraria:{
      totalMinima: detailEstruturaCurricular[0].CARGA_HORARIA_MINIMA_TOTAL,
      totalObrigatoria: detailEstruturaCurricular[0].CARGA_HORARIA_OBR,
      optativaMinima: detailEstruturaCurricular[0].CARGA_HORARIA_MINIMA_OPT,
      eletivaMaxima: detailEstruturaCurricular[0].CARGA_HORARIA_ELETIVA_MAX,
      maximaPorPeriodo: detailEstruturaCurricular[0].CARGA_HORARIA_MAX_PERIODO,
    },
    prazoConclusao: {
      minimo: detailEstruturaCurricular[0].MIN_PERIODOS,
      medio: detailEstruturaCurricular[0].NUM_PERIODOS,
      maximo: detailEstruturaCurricular[0].MAX_PERIODOS
    },
    periodoEntradaVigor: {
      ano: detailEstruturaCurricular[0].PERIODO_LETIVO_VIGOR_ANO,
      numero: detailEstruturaCurricular[0].PERIODO_LETIVO_VIGOR_NUMERO
    }
  }
  
  return res.json(joinedQueries);
};

const searchDisciplinasEstruturaCurricular: RequestHandler = async (
  req,
  res,
  next
) => {
  return res.json({});
};

export default {
  search,
  detail,
  searchEstruturaCurricular,
  detailEstruturaCurricular,
  searchDisciplinasEstruturaCurricular,
};

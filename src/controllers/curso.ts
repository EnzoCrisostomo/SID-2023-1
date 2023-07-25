import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";
import {
  DetailCursoParams,
  DetailCursoQueryResult,
  DetailCursoUnidadeQueryResult,
  SearchCursoQuery,
  SearchCursoQueryResult,
  curriculoPathParams,
  curriculoQueryResult,
  cursoPathParams,
  disciplinaQueryResult,
  searchDisciplinaQueryParams,
  searchDisciplinaQueryResult,
  searchEstruturaCurricularQueryResult,
  searchEstruturaQuery
} from "../schemas/curso";
import { mapStatus, mountSearchSet } from "../utils";

const search: RequestHandler = async (req, res, next) => {
  const { nome, grauAcademico, modalidade, coordenador, turno, _offset, _size } =
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
      (unaccent(cur."GRAU_ACADEMICO") ilike '%'|| unaccent(${grauAcademico}::text) || '%' or ${grauAcademico}::text is null) and
      (unaccent(cur."MODALIDADE") ilike '%'|| unaccent(${modalidade}::text) || '%' or ${modalidade}::text is null) and
      (unaccent(cur."TURNO") ilike '%'|| unaccent(${turno}::text) || '%' or ${turno}::text is null) and
      (unaccent(cur."COORDENADOR") ilike '%'|| unaccent(${coordenador}::text) || '%' or ${coordenador}::text is null)
      offset ${_offset}::integer
      limit ${_size}::integer`
  );
  const _total = Number(searchCurso[0]?._total ?? 0);

  const cursoTransformed = searchCurso.map((item) => ({
    id: item.ID,
    codigo: item.CODIGO,
    nome: item.NOME
  }));

  return res.json(mountSearchSet(cursoTransformed, _offset, _total));
};

const detail: RequestHandler = async (req, res, next) => {
  const { id } = DetailCursoParams.parse(req.params);

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

  const unidade = DetailCursoUnidadeQueryResult.parse(
    await prisma.$queryRaw`
    select
	    und."ID",
	    und."NOME" 
    from "SIGAA_RL_CURSO_UNIDADE" rcu
    left join "SIGAA_UNIDADE" und ON rcu."UNIDADE" = und."ID"
    where rcu."CURSO" = ${id}::text`);

  if (!curso[0]) {
    throw new HttpError.NotFound(`Curso [${id}] não encontrado!`);
  }

  if (!unidade[0]) {
    throw new HttpError.NotFound(`Unidade do curso [${id}] não encontrada!`);
  }

  const nomesCoordenador = curso[0].COORDENADOR.toLocaleLowerCase().split(" ");
  const finalEmail = `${unidade[0].ID.toLocaleLowerCase()}.unb.br`;
  const emailCoordenador = nomesCoordenador.at(1) ? `${nomesCoordenador.at(0)}.${nomesCoordenador.at(1)}@${finalEmail}` : `coordenacao@${finalEmail}`;

  const cursoTransformed = {
    id: curso[0].ID,
    codigo: curso[0].ID,
    nome: curso[0].NOME,
    grau: curso[0].GRAU_ACADEMICO,
    modalidade: curso[0].MODALIDADE,
    turno: curso[0].TURNO,
    coordenador: {
      nome: curso[0].COORDENADOR,
      telefone: "(61) 9 9999-9999",
      email: emailCoordenador
    },
    unidade: {
      codigo: unidade[0].ID,
      nome: unidade[0].NOME
    }
  }

  return res.json(cursoTransformed);
};
const searchEstruturaCurricular: RequestHandler = async (req, res, next) => {
  const { id } = cursoPathParams.parse(req.params);
  const { status, _size, _offset } = searchEstruturaQuery.parse(req.query);

  let statusChar: string | undefined = undefined;

  if (status?.toLocaleLowerCase() === "ativo") {
    statusChar = "A"
  }
  else if (status?.toLocaleLowerCase() === "inativo") {
    statusChar = "I"
  };

  const estruturaCurricular = searchEstruturaCurricularQueryResult.parse(
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
    where 
      srcc."CURSO" = ${id}::text and
      (ec."STATUS" = ${statusChar}::text or ${statusChar}::text is null)
    offset ${_offset}::integer
    limit ${_size}::integer`
  );

  const _total = Number(estruturaCurricular[0]?._total ?? 0);

  const estruturaTransformed = estruturaCurricular.map((item) => ({
    id: item.ID,
    codigo: item.CODIGO,
    status: mapStatus(item.STATUS),
    periodoLetivoEntradaVigor: {
      ano: item.PERIODO_LETIVO_VIGOR_ANO,
      numero: item.PERIODO_LETIVO_VIGOR_NUMERO
    }
  }));

  return res.json(mountSearchSet(estruturaTransformed, _offset, _total));
};

const detailEstruturaCurricular: RequestHandler = async (req, res, next) => {
  const { id, curriculo } = curriculoPathParams.parse(req.params);

  const detailCurriculo = curriculoQueryResult.parse(
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
    where ec."ID" = ${id}::text||'/'||${curriculo}::text;
    `);

  if (!detailCurriculo[0]) {
    throw new HttpError.NotFound(`Currículo [${id}/${curriculo}] não encontrado!`);
  }

  const disciplinasRaw = disciplinaQueryResult.parse(
    await prisma.$queryRaw`
    select 
      CAST(srcd."PERIODO" as integer) as periodo,
        case 
          when srcd."TIPO" = 'OBR' then 'Obrigatória'
          when srcd."TIPO" = 'OPT' then 'Optativa'
        end as "tipo",
      dis."ID" as id,
      dis."ID" as codigo,
      dis."NOME" as nome,
      dis."MODALIDADE" as modalidade
    from "SIGAA_RL_CURRICULO_DISCIPLINA" srcd 
    left join "SIGAA_DISCIPLINA" dis ON srcd."DISCIPLINA" = dis."ID" 
    where srcd."CURRICULO" = ${id}::text||'/'||${curriculo}::text
    `);

  const disciplinasTransformed = disciplinasRaw.map((item) => ({
    tipo: item.tipo,
    nivel: item.periodo,
    disciplina: {
      id: item.id,
      codigo: item.codigo,
      nome: item.nome,
      modalidade: item.modalidade,
    }
  }));

  const estruturaCurricular = {
    periodoLetivoEntradavigor: {
      ano: detailCurriculo[0].PERIODO_LETIVO_VIGOR_ANO,
      numero: detailCurriculo[0].PERIODO_LETIVO_VIGOR_NUMERO
    },
    disciplina: disciplinasTransformed,
    cargaHoraria: {
      totalMinima: detailCurriculo[0].CARGA_HORARIA_MINIMA_TOTAL,
      totalObrigatoria: detailCurriculo[0].CARGA_HORARIA_OBR,
      optativaMinima: detailCurriculo[0].CARGA_HORARIA_MINIMA_OPT,
      eletivaMaxima: detailCurriculo[0].CARGA_HORARIA_ELETIVA_MAX,
      maximaPorPeriodo: detailCurriculo[0].CARGA_HORARIA_MAX_PERIODO,
    },
    prazoConclusao: {
      minimo: detailCurriculo[0].MIN_PERIODOS,
      medio: detailCurriculo[0].NUM_PERIODOS,
      maximo: detailCurriculo[0].MAX_PERIODOS
    },
    periodoEntradaVigor: {
      ano: detailCurriculo[0].PERIODO_LETIVO_VIGOR_ANO,
      numero: detailCurriculo[0].PERIODO_LETIVO_VIGOR_NUMERO
    }
  }

  return res.json(estruturaCurricular);
};

const searchDisciplinasEstruturaCurricular: RequestHandler = async (req, res, next) => {
  const { id, curriculo } = curriculoPathParams.parse(req.params);
  const { tipo, nivel, nome, unidade, _offset, _size } = searchDisciplinaQueryParams.parse(req.query);

  const disciplinas = searchDisciplinaQueryResult.parse(
    await prisma.$queryRaw`
      select 
        count(dis."ID") over() as _total,
        CAST(srcd."PERIODO" as integer),
        case 
          when srcd."TIPO" = 'OBR' then 'Obrigatória'
          when srcd."TIPO" = 'OPT' then 'Optativa'
        end as "TIPO",
        dis."ID" as "CODIGO",
        dis."NOME",
        dis."MODALIDADE",
        dis."UNIDADE" 
      from "SIGAA_RL_CURRICULO_DISCIPLINA" srcd 
      left join "SIGAA_DISCIPLINA" dis ON srcd."DISCIPLINA" = dis."ID" 
      where srcd."CURRICULO" = ${id}::text||'/'||${curriculo}::text
        and (srcd."PERIODO" = ${nivel}::integer or ${nivel}::integer is null)
        and (unaccent(dis."NOME") ilike '%'||unaccent(${nome}::text)||'%' or ${nome}::text is null)
        and (unaccent(dis."UNIDADE") ilike '%'||unaccent(${unidade}::text)||'%' or ${unidade}::text is null)
        and ((srcd."TIPO" = 
          (case 
            when lower(unaccent(${tipo}::text)) = 'obrigatoria' then 'OBR' 
            when lower(unaccent(${tipo}::text)) = 'optativa' then 'OPT' 
          end)
          ) or ${tipo}::text is null)
      order by srcd."PERIODO"
      offset ${_offset}::integer
      limit ${_size}::integer`
  );

  const _total = Number(disciplinas[0]?._total ?? 0);

  const disciplinasTransformed = disciplinas.map(item => ({
    tipo: item.TIPO,
    nivel: item.PERIODO,
    disciplina: {
      id: item.CODIGO,
      codigo: item.CODIGO,
      nome: item.NOME,
      modalidade: item.MODALIDADE
    }
  }));

  return res.json(mountSearchSet(disciplinasTransformed, _offset, _total));
};

export default {
  search,
  detail,
  searchEstruturaCurricular,
  detailEstruturaCurricular,
  searchDisciplinasEstruturaCurricular,
};

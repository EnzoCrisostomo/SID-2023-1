-------------
-- Disciplina
-------------
select  
  dis."ID",
  dis."NOME",
  dis."CARGA_HORARIA_TEORICA",
  dis."CARGA_HORARIA_PRATICA",
  und."ID" as "UNIDADE_CODIGO",
  und."NOME" as "UNIDADE_NOME"
from "SIGAA_DISCIPLINA" dis
left join "SIGAA_UNIDADE" und ON dis."UNIDADE" = und."ID" 
where dis."ID" = :codigo;


select
--	pre."DISCIPLINA_REQUERIDO" 
  dis."ID",
  dis."NOME",
  dis."CARGA_HORARIA_TEORICA",
  dis."CARGA_HORARIA_PRATICA",
  dis."UNIDADE" as "UNIDADE_CODIGO"
from "SIGAA_PREREQ" pre
left join "SIGAA_DISCIPLINA" dis on pre."DISCIPLINA_REQUERIDO" = dis."ID"
where pre."DISCIPLINA_REQUER" = :codigo


select
  count(dis."ID") over() as _total,
  dis."ID",
  dis."NOME",
  dis."MODALIDADE"
from "SIGAA_DISCIPLINA" dis
where (unaccent(dis."NOME") ilike '%'||unaccent(:nome)||'%' or :nome is null) and
	  (dis."UNIDADE" = :unidade or :unidade is null)
order by dis."NOME" 
offset :_pageOffset 
limit :_pageSize


--------
-- Curso
--------
select  
  cur."ID",
  cur."NOME",
  cur."GRAU_ACADEMICO",
  cur."TURNO",
  cur."MODALIDADE",
  cur."COORDENADOR"
from "SIGAA_CURSO" cur
where cur."ID" = :id

select
	und."ID",
	und."NOME" 
from "SIGAA_RL_CURSO_UNIDADE" rcu
left join "SIGAA_UNIDADE" und ON rcu."UNIDADE" = und."ID"
where rcu."CURSO" = :id

select  
  count(cur."ID") over() as _total,
  cur."ID",
  cur."NOME"
from "SIGAA_CURSO" cur
inner join "SIGAA_RL_CURSO_UNIDADE" rcu on cur."ID" = rcu."CURSO" 
where (unaccent(cur."NOME") ilike '%'||unaccent(:nome)||'%' or :nome is null) and
	  (rcu."UNIDADE" = :unidade or :unidade is null)
order by cur."NOME" 
offset :_pageOffset 
limit :_pageSize
	  
select 
	substring(ec."ID" from 6) as ID, 
	ec."STATUS", 
	substring(ec."PERIODO_LETIVO_VIGOR" from 1 for 4) as "PERIODO_LETIVO_VIGOR_ANO",
	substring(ec."PERIODO_LETIVO_VIGOR" from 5) as "PERIODO_LETIVO_VIGOR_NUMERO"
FROM public."SIGAA_CURRICULO" ec
inner join "SIGAA_RL_CURRICULO_CURSO" srcc ON ec."ID" = srcc."CURRICULO" 
where srcc."CURSO" = :id;

select 
	ec."ID", 
	ec."STATUS", 
	ec."PERIODO_LETIVO_VIGOR", 
	ec."CARGA_HORARIA_MINIMA_TOTAL", 
	ec."CARGA_HORARIA_MINIMA_OPT", 
	ec."CARGA_HORARIA_OBR", 
	ec."CARGA_HORARIA_ELETIVA_MAX", 
	ec."CARGA_HORARIA_MAX_PERIODO", 
	ec."NUM_PERIODOS", 
	ec."MIN_PERIODOS", 
	ec."MAX_PERIODOS"
FROM public."SIGAA_CURRICULO" ec
where ec."ID" = :id||'/'||:curriculo;

select 
	srcd."PERIODO",
	case 
		when srcd."TIPO" = 'OBR' then 'Obrigatória'
		when srcd."TIPO" = 'OPT' then 'Optativa'
	end as "TIPO",
	dis."ID",
	dis."NOME",
	dis."CARGA_HORARIA_TEORICA",
	dis."CARGA_HORARIA_PRATICA",
	dis."UNIDADE" 
from "SIGAA_RL_CURRICULO_DISCIPLINA" srcd 
left join "SIGAA_DISCIPLINA" dis ON srcd."DISCIPLINA" = dis."ID" 
where srcd."CURRICULO" = :id||'/'||:curriculo
and (srcd."PERIODO" = :nivel or :nivel is null)
and ((srcd."TIPO" = 
	(case 
		when :tipo = 'Obrigatória' then 'OBR' 
		when :tipo = 'Optativa' then 'OPT' 
	end)
	) or :tipo is null)
order by srcd."PERIODO"

select 
	srcd."PERIODO",
	srcd."TIPO",
	dis."ID",
	dis."NOME",
	dis."CARGA_HORARIA_TEORICA",
	dis."CARGA_HORARIA_PRATICA",
	dis."UNIDADE" 
from "SIGAA_RL_CURRICULO_DISCIPLINA" srcd 
left join "SIGAA_DISCIPLINA" dis ON srcd."DISCIPLINA" = dis."ID" 
where srcd."CURRICULO" = :curriculo
  and srcd."DISCIPLINA" = :disciplina 


--------
-- Aluno
--------
select
	alu."MATRICULA",
	alu."NOME",
	ac."CURSO",
	cur."NOME" as "CURSO_NOME",
	ac."CURRICULO",
	ac."IRA",
	substring(ac."PERIODO_LETIVO_REGISTRO" from 1 for 4) as "PERIODO_INGRESSO_ANO",
	substring(ac."PERIODO_LETIVO_REGISTRO" from 5) as "PERIODO_INGRESSO_NUMERO"
from "SIGAA_ALUNO" alu
inner join "SIGAA_RL_ALUNO_CURSO" ac ON alu."MATRICULA" = ac."ALUNO" 
left join "SIGAA_CURSO" cur on ac."CURSO" = cur."ID"
where alu."MATRICULA" = :id

select
    count(alu."MATRICULA") over() as _total,
	alu."MATRICULA",
	alu."NOME"
from "SIGAA_ALUNO" alu
inner join "SIGAA_RL_ALUNO_CURSO" ac ON alu."MATRICULA" = ac."ALUNO" 
where (unaccent(alu."NOME") ilike '%'||unaccent(:nome)||'%' or :nome is null) and
      (ac."CURSO" = :curso or :curso is null) and
      ((ac."PERIODO_LETIVO_REGISTRO" = substring(:periodoIngresso from 1 for 4)||substring(:periodoIngresso from 6)) or :periodoIngresso is null)
order by alu."NOME" 
offset :_pageOffset 
limit :_pageSize


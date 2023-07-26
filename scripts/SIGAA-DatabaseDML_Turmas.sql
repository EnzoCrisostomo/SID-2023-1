--------------------------------------------------------
--  File created - november-04-2020   
--------------------------------------------------------
----------------------------------------------------------
--  DML for Table SIGAA_TURMA e SIGAA_RL_TURMA_HORARIOAULA
----------------------------------------------------------
---------------------------------------------------------------------------------
-- REDES 1o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|IFD0173/A	|IFD0171/B	|			|IFD0171/B	|ENE0026/A	|			|
---------------------------------------------------------------------------------
-- 10-12|MAT0025/A  |MAT0025/A  |ENE0334/B	|MAT0025/A	|ENE0334/B	|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|MAT0031/A	|			|MAT0031/A	|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 1o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|ENE0155/A	|IFD0171/B	|IFD0173/C	|IFD0171/B	|			|			|
---------------------------------------------------------------------------------
-- 10-12|ENE0334/A	|IQD0125/D	|ENE0334/A	|IQD0125/D	|IQD0125/G	|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|MAT0025/J	|			|MAT0025/J	|			|MAT0025/J	|			|
---------------------------------------------------------------------------------
-- 16-18|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- MAT0025,CÁLCULO 1
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','MAT0025',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('J','20202','MAT0025',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24'),
			('44'),
			('64')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('O','20202','MAT0025',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('51'),
			('61')
) H(HORARIOAULA) join TUR ON true;

-- MAT0031,INTRODUCAO A ALGEBRA LINEAR
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','MAT0031',66) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('G','20202','MAT0031',66) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('38'),
			('58')
) H(HORARIOAULA) join TUR ON true;

-- IFD0171,FÍSICA 1
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','IFD0171',30) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('32')
) H(HORARIOAULA) join TUR ON true;

with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('G','20202','IFD0171',30) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41')
) H(HORARIOAULA) join TUR ON true;

-- IFD0173,FÍSICA 1 EXPERIMENTAL
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','IFD0173',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','IFD0173',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('41')
) H(HORARIOAULA) join TUR ON true;

-- ENE0026,INTRODUÇÃO A ENGENHARIA DE REDES DE COMUNICACÃO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0026',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('64')
) H(HORARIOAULA) join TUR ON true;

-- ENE0334,COMPUTACAO PARA ENGENHARIA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0334',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('42')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0334',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('42'),
			('62')
) H(HORARIOAULA) join TUR ON true;

-- ENE0155,INTRODUÇÃO A ENGENHARIA ELÉTRICA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0155',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21')
) H(HORARIOAULA) join TUR ON true;

-- IQD0125,QUIMICA GERAL TEORICA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','IQD0125',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('F','20202','IQD0125',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('44')
) H(HORARIOAULA) join TUR ON true;

-- IQD0125,QUIMICA GERAL EXPERIMENTAL
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('G','20202','IQD0125',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('62')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('H','20202','IQD0125',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22')
) H(HORARIOAULA) join TUR ON true;


---------------------------------------------------------------------------------
-- REDES 2o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|EST0023/C	|IFD0175/B	|EST0023/C	|IFD0175/B	|			|			|
---------------------------------------------------------------------------------
-- 10-12|			|MAT0026/F	|ENE0040/A	|MAT0026/F	|MAT0026/F	|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|ENE0013/A	|			|ENE0013/A	|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0039/A	|			|ENE0039/A	|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 2o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|ENE0039/B	|IFD0175/B	|ENE0039/B	|IFD0175/B	|ENE0040/B	|			|
---------------------------------------------------------------------------------
-- 10-12|IFD0177/B	|MAT0026/F	|			|MAT0026/F	|MAT0026/F	|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|MAT0031/A	|			|MAT0031/A	|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- ENE0013,ALGORITMOS E ESTRUTURA DE DADOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0013',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24'),
			('44')
) H(HORARIOAULA) join TUR ON true;

-- EST0023,PROBABILIDADE E ESTATÍSTICA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','EST0023',60) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('F','20202','EST0023',60) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('44'),
			('64')
) H(HORARIOAULA) join TUR ON true;

-- IFD0175,FISICA 2
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','IFD0175',30) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('51')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('E','20202','IFD0175',30) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('42')
) H(HORARIOAULA) join TUR ON true;

-- MAT0026,CÁLCULO 2
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('F','20202','MAT0026',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52'),
			('62')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('G','20202','MAT0026',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('42'),
			('62')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('H','20202','MAT0026',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45'),
			('65')
) H(HORARIOAULA) join TUR ON true;

-- ENE0039,SISTEMAS DIGITAIS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0039',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0039',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41')
) H(HORARIOAULA) join TUR ON true;

-- ENE0040,LABORATÓRIO DE SISTEMAS DIGITAIS 
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0040',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('42')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0040',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('61')
) H(HORARIOAULA) join TUR ON true;

-- IFD0177,FISICA 2 EXPERIMENTAL
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','IFD0177',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('K','20202','IFD0177',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('42')
) H(HORARIOAULA) join TUR ON true;

---------------------------------------------------------------------------------
-- REDES 3o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|MAT0027/B	|			|MAT0027/B	|			|MAT0027/B	|			|
---------------------------------------------------------------------------------
-- 10-12|			|ENE0067/B	|IFD0177/K	|ENE0067/B	|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|ENE0274/A	|ENE0056/B	|ENE0274/A	|ENE0056/B	|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0022/A	|			|ENE0022/A	|ENE0058/C	|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 3o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|MAT0027/B	|ENE0056/A	|MAT0027/B	|ENE0056/A	|MAT0027/B	|			|
---------------------------------------------------------------------------------
-- 10-12|ENE0067/A	|MAT0053/J	|ENE0067/A	|MAT0053/J	|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|ENE0058/A	|			|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENC0035/C	|ENE0066/D	|ENC0035/C	|ENE0066/D	|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- ENE0022,PROJETO TRANSVERSAL EM REDES DE COMUNICAÇÃO 1
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0022',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;

-- ENE0274,FUNDAMENTOS DE REDES
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0274',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24'),
			('44')
) H(HORARIOAULA) join TUR ON true;

-- MAT0027,CÁLCULO 3
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','MAT0027',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45'),
			('65')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','MAT0027',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41'),
			('61')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','MAT0027',90) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55'),
			('65')
) H(HORARIOAULA) join TUR ON true;


-- ENE0056,SISTEMAS MICROPROCESSADOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0056',20) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('51')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0056',20) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('34'),
			('54')
) H(HORARIOAULA) join TUR ON true;

-- ENE0058,LABORATÓRIO DE SISTEMAS MICROPROCESSADOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0058',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('34')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0058',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0058',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('55')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENE0058',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('61')
) H(HORARIOAULA) join TUR ON true;

-- ENE0067,SINAIS E SISTEMAS EM TEMPO CONTÍNUO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0067',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('42')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0067',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;

-- MAT0053,CÁLCULO NUMÉRICO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('J','20202','MAT0053',60) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;

-- ENC0035,INTRODUÇÃO À MECÂNICA DOS SÓLIDOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENC0035',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENC0035',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55')
) H(HORARIOAULA) join TUR ON true;

-- ENE0066,INTRODUÇÃO AOS CIRCUITOS ELÉTRICOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0066',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('34'),
			('54')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENE0066',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55')
) H(HORARIOAULA) join TUR ON true;


---------------------------------------------------------------------------------
-- REDES 4o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|ENE0015/A	|ENE0177/C	|ENE0015/A	|ENE0177/C	|			|			|
---------------------------------------------------------------------------------
-- 10-12|IQD0125/F	|MAT0080/B	|IQD0125/F	|MAT0080/B	|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|ENE0066/D	|			|ENE0066/D	|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0068/A	|ENE0091/A	|ENE0068/A	|ENE0091/A	|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 4o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|ENM0080/B	|			|ENM0080/B	|ENM0080/B	|ECL0014/A	|			|
---------------------------------------------------------------------------------
-- 10-12|ENE0304/B	|ENE0177/D	|ENE0304/B	|ENE0177/D	|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|ENE0282/A	|			|EST0023/F	|			|EST0023/F	|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0068/A	|			|ENE0068/A	|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- ENE0015,FUNDAMENTOS DE REDES 2
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0015',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41')
) H(HORARIOAULA) join TUR ON true;

-- ENE0068,SINAIS E SISTEMAS EM TEMPO DISCRETO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0068',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;

-- ENE0091,SISTEMAS OPERACIONAIS DE REDES
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0091',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55')
) H(HORARIOAULA) join TUR ON true;

-- ENE0177,ELETROMAGNETISMO 1 
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0177',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('51')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENE0177',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;

-- MAT0080,INTRODUCAO A TEORIA DOS GRAFOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','MAT0080',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;

-- ECL0014,CIENCIAS DO AMBIENTE 
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ECL0014',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('61')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ECL0014',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('62')
) H(HORARIOAULA) join TUR ON true;

-- ENM0080,FENOMENOS DE TRANSPORTE
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENM0080',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41'),
			('51')
) H(HORARIOAULA) join TUR ON true;

-- ENE0282,LABORATÓRIO DE CIRCUITOS ELÉTRICOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0282',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0282',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0282',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('61')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENE0282',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('62')
) H(HORARIOAULA) join TUR ON true;


-- ENE0304,CIRCUITOS ELÉTRICOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0304',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0304',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('42')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0304',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('34'),
			('54')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENE0304',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55')
) H(HORARIOAULA) join TUR ON true;


---------------------------------------------------------------------------------
-- REDES 5o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|			|			|			|ENE0282/C	|			|
---------------------------------------------------------------------------------
-- 10-12|			|			|			|			|IQD0126/G	|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|ENE0011/A	|ENE0304/C	|			|ENE0304/C	|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0276/A	|ENE0025/A	|ENE0276/A	|ENE0025/A	|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 5o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|ENE0053/A	|ENE0049/A	|ENE0053/A	|ENE0049/A	|ENE0050/A	|			|
---------------------------------------------------------------------------------
-- 10-12|ENE0295/A	|ECO0019/B	|			|ECO0019/B	|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|ENE0054/A	|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|			|ENE0306/B	|			|ENE0306/B	|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|ENE0289/A	|			|ENE0289/A	|			|			|
---------------------------------------------------------------------------------

-- ENE0011,LABORATÓRIO DE REDES
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0011',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0011',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('44')
) H(HORARIOAULA) join TUR ON true;

-- ENE0025,PROTOCOLOS DE TRANSPORTE E ROTEAMENTO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0025',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55')
) H(HORARIOAULA) join TUR ON true;


-- ENE0276,METODOLOGIA E DESENVOLVIMENTO DE SOFTWARE
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0276',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;

-- ECO0019,INTRODUÇÃO À ECONOMIA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ECO0019',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ECO0019',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('34'),
			('54')
) H(HORARIOAULA) join TUR ON true;

-- ENE0289,CIRCUITOS POLIFÁSICOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0289',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('36'),
			('56')
) H(HORARIOAULA) join TUR ON true;

-- ENE0049,MATERIAIS ELÉTRICOS E MAGNÉTICOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0049',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('51')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0049',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;

-- ENE0050,LABORATÓRIO DE MATERIAIS ELÉTRICOS E MAGNÉTICOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0050',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0050',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('62')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0050',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('64')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENE0050',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('65')
) H(HORARIOAULA) join TUR ON true;


-- ENE0053,ELETROMAGNETISMO 2
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0053',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0053',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('42')
) H(HORARIOAULA) join TUR ON true;

-- ENE0054,LABORATÓRIO DE ELETROMAGNETISMO 2
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0054',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0054',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25')
) H(HORARIOAULA) join TUR ON true;

-- ENE0295,LABORATÓRIO DE PRINCÍPIOS DE COMUNICAÇÃO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0295',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0295',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0295',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('42')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENE0295',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('52')
) H(HORARIOAULA) join TUR ON true;

-- ENE0306,PRINCÍPIOS DE COMUNICAÇÃO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0306',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('34'),
			('54')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0306',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55')
) H(HORARIOAULA) join TUR ON true;

---------------------------------------------------------------------------------
-- REDES 6o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 10-12|ENE0295/A	|ENE0045/B	|SOL0042/F	|ENE0045/B	|SOL0042/F	|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|ENE0046/C	|ENE0306/A	|			|ENE0306/A	|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0024/A	|ENE0089/A	|ENE0024/A	|ENE0089/A	|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 6o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|ENE0046/A	|ENE0045/A	|			|ENE0045/A	|			|			|
---------------------------------------------------------------------------------
-- 10-12|			|ENE0071/A	|			|ENE0071/A	|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|ENE0077/A	|			|ENE0077/A	|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0186/A	|			|ENE0186/A	|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- ENE0024,PROJETO TRANSVERSAL EM REDES DE COMUNICAÇÃO 2
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0024',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;

-- ENE0045,ELETRÔNICA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0045',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('51')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0045',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;

-- ENE0046,LABORATÓRIO DE ELETRÔNICA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0046',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0046',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0046',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('D','20202','ENE0046',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25')
) H(HORARIOAULA) join TUR ON true;

-- ENE0089,CABEAMENTO ESTRUTURADO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0089',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55')
) H(HORARIOAULA) join TUR ON true;

-- SOL0042,INTRODUÇÃO À SOCIOLOGIA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','SOL0042',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('41'),
			('61')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('F','20202','SOL0042',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('42'),
			('62')
) H(HORARIOAULA) join TUR ON true;

-- ENE0186,CONVERSÃO DE ENERGIA E MÁQUINAS ELÉTRICAS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0186',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;

-- ENE0071,INSTALAÇÕES ELÉTRICAS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0071',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;


-- ENE0077,CONTROLE DE SISTEMAS DINÂMICOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0077',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24'),
			('44')
) H(HORARIOAULA) join TUR ON true;

---------------------------------------------------------------------------------
-- REDES 7o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|ENE0262/A	|ENE0211/A	|ENE0262/A	|ENE0211/A	|			|			|
---------------------------------------------------------------------------------
-- 10-12|			|ENE0329/A	|			|ENE0329/A	|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|ENE0352/A	|ECO0019/C	|ENE0352/A	|ECO0019/C	|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0017/A	|			|ENE0017/A	|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 7o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|ENE0072/A	|			|ENE0073/A	|ENE0078/A	|			|
---------------------------------------------------------------------------------
-- 10-12|FDD0155/C	|			|FDD0155/C	|			|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- ENE0017,AVALIAÇÃO DE DESEMPENHO DE REDES E SISTEMAS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0017',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;

-- ENE0352,REDES LOCAIS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0352',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24'),
			('44')
) H(HORARIOAULA) join TUR ON true;

-- ENE0211,TEORIA DA INFORMACAO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0211',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('51')
) H(HORARIOAULA) join TUR ON true;

-- ENE0262,COMUNICACOES DIGITAIS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0262',60) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('21'),
			('41')
) H(HORARIOAULA) join TUR ON true;

-- ENE0329,COMUNICACOES OPTICAS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0329',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;

-- FDD0155,NOÇÕES DE DIREITO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','FDD0155',80) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22'),
			('42')
) H(HORARIOAULA) join TUR ON true;

-- ENE0072,LABORATÓRIO DE INSTALAÇÕES ELÉTRICAS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0072',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0072',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32')
) H(HORARIOAULA) join TUR ON true;

-- ENE0073,LABORATÓRIO DE SISTEMAS ELÉTRICOS DE POTÊNCIA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0073',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('51')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0073',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('52')
) H(HORARIOAULA) join TUR ON true;

-- ENE0078,LABORATÓRIO DE CONTROLE DE SISTEMAS DINÂMICOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0078',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('61')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0078',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('62')
) H(HORARIOAULA) join TUR ON true;


---------------------------------------------------------------------------------
-- REDES 8o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|ENE0344/A	|			|ENE0344/A	|			|			|
---------------------------------------------------------------------------------
-- 10-12|FDD0155/C	|ENE0064/A	|FDD0155/C	|ENE0064/A	|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|ENE0007/A	|			|ENE0007/A	|			|			|
---------------------------------------------------------------------------------
-- 16-18|ENE0016/A	|ENE0090/A	|ENE0016/A	|ENE0090/A	|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 8o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|			|SOL0042/C	|ENE0074/A	|SOL0042/C	|			|
---------------------------------------------------------------------------------
-- 10-12|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|EPR0068/B	|			|EPR0068/B	|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- ENE0016,GERÊNCIA DE REDES E SISTEMAS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0016',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('25'),
			('45')
) H(HORARIOAULA) join TUR ON true;

-- ENE0090,SEGURANÇA DE REDES
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0090',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('35'),
			('55')
) H(HORARIOAULA) join TUR ON true;

-- ENE0007,REDES DE TELECOMUNICAÇÕES
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0007',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('34'),
			('54')
) H(HORARIOAULA) join TUR ON true;

-- ENE0064,REDES SEM FIO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0064',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('32'),
			('52')
) H(HORARIOAULA) join TUR ON true;

-- ENE0344,COMUNICAÇÕES MÓVEIS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0344',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('31'),
			('51')
) H(HORARIOAULA) join TUR ON true;

-- EPR0068,ORGANIZAÇÃO INDUSTRIAL
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','EPR0068',80) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('24'),
			('44')
) H(HORARIOAULA) join TUR ON true;

-- ENE0074,LABORATÓRIO DE CONVERSÃO DE ENERGIA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0074',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('51')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0074',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('52')
) H(HORARIOAULA) join TUR ON true;

---------------------------------------------------------------------------------
-- REDES 9o PERIODO																|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|			|			|			|FTD0007/A	|			|
---------------------------------------------------------------------------------
-- 10-12|			|			|			|			|FTD0007/A	|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|EPR0068/B	|			|EPR0068/B	|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|ENE0088/A	|			|ENE0088/A	|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 9o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 10-12|EPR0059/A	|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- ENE0062,ESTÁGIO SUPERVISIONADO EM ENGENHARIA DE REDES DE COMUNICAÇÃO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0062',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('66'),
			('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0062',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('66'),
			('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0062',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('66'),
			('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;

-- ENE0342,PROJETO FINAL DE GRADUAÇÃO 1
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0342',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('23')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0342',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('43')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0342',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('63')
) H(HORARIOAULA) join TUR ON true;

-- ENE0088,SISTEMAS DE INFORMAÇÃO DISTRIBUÍDOS
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0088',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('26'),
			('46')
) H(HORARIOAULA) join TUR ON true;

-- FTD0007,INTRODUCAO A ATIVIDADE EMPRESARIAL
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','FTD0007',40) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('61'),
			('62')
) H(HORARIOAULA) join TUR ON true;

-- ENE0069 - ESTÁGIO SUPERVISIONADO EM ENGENHARIA ELÉTRICA
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0069',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('66'),
			('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0069',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('66'),
			('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0069',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('66'),
			('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;

-- ENE0309 - TRABALHO DE CONCLUSÃO DE CURSO 1
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0309',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('23')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0309',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('43')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0309',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('63')
) H(HORARIOAULA) join TUR ON true;

-- EPR0059,HIGIENE E SEGURANÇA DO TRABALHO
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','EPR0059',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('22')
) H(HORARIOAULA) join TUR ON true;

---------------------------------------------------------------------------------
-- REDES 10o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 10-12|EPR0059/A	|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- ELÉTRCIA 10o PERIODO															|
---------------------------------------------------------------------------------
--		|SEG		| TER		| QUA		| QUI		| SEX		| SAB		|
---------------------------------------------------------------------------------
-- 08-10|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 10-12|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 12-14|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 14-16|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 16-18|			|			|			|			|			|			|
---------------------------------------------------------------------------------
-- 18-20|			|			|			|			|			|			|
---------------------------------------------------------------------------------

-- ENE0343,PROJETO FINAL DE GRADUAÇÃO 2
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0343',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('71'),
			('72'),
			('73'),
			('74'),
			('75')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0343',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('71'),
			('72'),
			('73'),
			('74'),
			('75')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0343',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('71'),
			('72'),
			('73'),
			('74'),
			('75')
) H(HORARIOAULA) join TUR ON true;

-- ENE0299,TRABALHO DE CONCLUSÃO DE CURSO 2
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('A','20202','ENE0299',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('B','20202','ENE0299',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;
with TUR as (
  INSERT INTO "SIGAA_TURMA" ("CODIGO","PERIODO_LETIVO","DISCIPLINA","VAGAS")
  values ('C','20202','ENE0299',10) RETURNING "ID"
) 
INSERT INTO "SIGAA_RL_TURMA_HORARIOAULA" ("TURMA", "HORARIOAULA")
SELECT TUR."ID", H.HORARIOAULA FROM (
	VALUES 	('67'),
			('71'),
			('72'),
			('73'),
			('74'),
			('75'),
			('76'),
			('77')
) H(HORARIOAULA) join TUR ON true;

-- Run as postgres
drop database "SIGAA";

CREATE EXTENSION unaccent;
CREATE ROLE "SIGAA" WITH PASSWORD 'SIGAA';
ALTER ROLE "SIGAA" LOGIN;
GRANT "SIGAA" TO POSTGRES;
CREATE DATABASE "SIGAA" WITH encoding 'UTF-8' OWNER "SIGAA";

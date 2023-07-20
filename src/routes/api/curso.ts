import { Router } from "express";
import CursoController from "../../controllers/curso";

const cursoRouter = Router();

cursoRouter.get("/", CursoController.search);
cursoRouter.get("/:id", CursoController.detail);
cursoRouter.get("/:id/EstruturaCurricular", CursoController.searchEstruturaCurricular);
cursoRouter.get("/:id/EstruturaCurricular/:curriculo", CursoController.detailEstruturaCurricular);
cursoRouter.get("/:id/EstruturaCurricular/:curriculo/disciplina", CursoController.searchDisciplinasEstruturaCurricular);

export default cursoRouter;
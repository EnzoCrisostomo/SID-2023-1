import { Router } from "express";
import CursoController from "../../controllers/curso";

const cursoRouter = Router();

cursoRouter.get("/", CursoController.list);

export default cursoRouter;
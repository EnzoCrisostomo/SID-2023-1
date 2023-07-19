import { Router } from "express";
import CursoController from "../../controllers/curso";

const cursoRouter = Router();

cursoRouter.get("/", CursoController.search);

export default cursoRouter;
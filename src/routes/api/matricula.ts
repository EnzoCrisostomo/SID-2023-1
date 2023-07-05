import { Router } from "express";
import MatriculaController from "../../controllers/matricula";

const matriculaRouter = Router();

matriculaRouter.get("/", MatriculaController.list);

export default matriculaRouter;
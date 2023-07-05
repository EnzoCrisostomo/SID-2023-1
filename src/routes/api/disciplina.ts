import { Router } from "express";
import DisciplinaController from "../../controllers/disciplina";

const disciplinaRouter = Router();

disciplinaRouter.get("/", DisciplinaController.list);

export default disciplinaRouter;
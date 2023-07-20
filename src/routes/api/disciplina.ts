import { Router } from "express";
import DisciplinaController from "../../controllers/disciplina";

const disciplinaRouter = Router();

disciplinaRouter.get("/", DisciplinaController.search);
disciplinaRouter.get("/:id", DisciplinaController.detail);

export default disciplinaRouter;
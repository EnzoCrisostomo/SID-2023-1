import { Router } from "express";
import Turma from "../../controllers/turma";

const turmaRouter = Router();

turmaRouter.get("/", Turma.search);

export default turmaRouter;
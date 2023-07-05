import { Router } from "express";
import AlunoController from "../../controllers/aluno";

const alunoRouter = Router();

alunoRouter.get("/", AlunoController.list);

export default alunoRouter;
import { Router } from "express";
import AlunoController from "../../controllers/aluno";

const alunoRouter = Router();

alunoRouter.get("/", AlunoController.search);

export default alunoRouter;
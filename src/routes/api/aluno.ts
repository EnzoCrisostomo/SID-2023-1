import { Router } from "express";
import AlunoController from "../../controllers/aluno";

const alunoRouter = Router();

alunoRouter.get("/", AlunoController.search);
alunoRouter.get("/:matricula", AlunoController.retrieve);

export default alunoRouter;
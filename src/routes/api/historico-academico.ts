import { Router } from "express";
import HistoricoAcademico from "../../controllers/historico-academico";

const historicoAcademicoRouter = Router();

historicoAcademicoRouter.get("/", HistoricoAcademico.search);

export default historicoAcademicoRouter;
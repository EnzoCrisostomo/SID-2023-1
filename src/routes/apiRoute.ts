import { Router } from "express";
import matriculaRouter from "./api/matricula";
import swaggerUi from 'swagger-ui-express';
import swaggerJson from '../openapi/sigaa-enzo-julia-heitor-2023.1.json'
import alunoRouter from "./api/aluno";
import cursoRouter from "./api/curso";
import disciplinaRouter from "./api/disciplina";


const apiRouter = Router();

apiRouter.use(
    '/Docs',
    swaggerUi.serve,
    swaggerUi.setup(swaggerJson)
);
apiRouter.use("/Matricula", matriculaRouter);

apiRouter.use("/Aluno", alunoRouter);

apiRouter.use("/Curso", cursoRouter);

apiRouter.use("/Disciplina", disciplinaRouter);

export default apiRouter;

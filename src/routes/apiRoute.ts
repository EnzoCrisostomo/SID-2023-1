import { Router } from "express";
import matriculaRouter from "./api/matricula";
import swaggerUi from 'swagger-ui-express';
import swaggerJson from '../openapi/sigaa-enzo-julia-heitor-2023.1.json'
import alunoRouter from "./api/aluno";
import cursoRouter from "./api/curso";
import disciplinaRouter from "./api/disciplina";


const apiRouter = Router();

apiRouter.use(
    '/api-docs',
    swaggerUi.serve,
    swaggerUi.setup(swaggerJson)
);
apiRouter.use("/matricula", matriculaRouter);

apiRouter.use("/aluno", alunoRouter);

apiRouter.use("/curso", cursoRouter);

apiRouter.use("/disciplina", disciplinaRouter);

export default apiRouter;

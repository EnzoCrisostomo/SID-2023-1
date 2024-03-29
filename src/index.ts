import express from "express";
import "express-async-errors";
import morgan from "morgan";
import helmet from "helmet";
import cors from "cors";
import apiRouter from "./routes/apiRoute";
import prisma from "./prisma";
import handlePrismaError from "./middlewares/handlePrismaError";
import handleCommonError from "./middlewares/handleCommonError";
import handleZodError from "./middlewares/handleZodError";
import path from "path";
import dotenv from "dotenv-safe";

const PROJECT_ROOT = path.resolve(__dirname, "..");

dotenv.config({
  example: path.resolve(PROJECT_ROOT, ".example.env"),
  path: path.resolve(PROJECT_ROOT, ".env"),
});

const BACKEND_PORT = process.env.BACKEND_PORT as string;

const app = express();

app.use(morgan("dev"));
app.use(helmet());
app.use(express.json());
app.use(cors());

app.use("/SIGAA/api/matriculasigaa", apiRouter);

app.use(handleZodError);
app.use(handlePrismaError);
app.use(handleCommonError);

app.listen(BACKEND_PORT, async () => {
  await prisma.$connect();
  console.log(`Server is running in http://localhost:${BACKEND_PORT}`);
});

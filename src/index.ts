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

const app = express();

app.use(morgan("dev"));
app.use(helmet());
app.use(express.json());
app.use(cors());

app.use("/api", apiRouter);

app.use(handleZodError);
app.use(handlePrismaError);
app.use(handleCommonError);

app.listen(3333, async () => {
    await prisma.$connect();
    console.log("Server is running in http://localhost:3333");
});


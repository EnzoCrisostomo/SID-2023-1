import express from "express";
import morgan from "morgan";
import helmet from "helmet";
import cors from "cors";
import cookieParser from "cookie-parser";
import { PrismaClient } from "@prisma/client";
import { createServer } from "http";
import apiRouter from "./routes/apiRoute";

const prisma = new PrismaClient({
    log: ["error"],
    errorFormat: "minimal",
  });  

const app = express();
const httpServer = createServer(app);

app.use(express.json());
app.use(morgan("dev"));
app.use(helmet());
app.use(cors());
app.use(cookieParser());

app.use("/api", apiRouter);

httpServer.listen(3333, async () => {
    await prisma.$connect();
    console.log("Server is running in http://localhost:3333");
});


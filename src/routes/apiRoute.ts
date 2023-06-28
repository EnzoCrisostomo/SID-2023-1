import { Router } from "express";
import matriculaRouter from "./api/matricula";
const apiRouter = Router();

apiRouter.get("/", (req, res) => res.send(`<div style="background-color: #007d35; color: #FFF; text-align: center; border-radius: 8px; padding: 5px;"><h1>Api MW2</h1> <br> <hr style="border-color: #003366;"> <h3>Status: 😎👍</h3></div>`));

// ! Remember that all api routes are private to authenticated users
// ! see: indexRoute.ts
apiRouter.use("/matricula", matriculaRouter);

export default apiRouter;

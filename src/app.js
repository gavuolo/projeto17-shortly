import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import signUpRouter from "./routes/signUpRoutes.js";
import signInRouter from "./routes/signInRoutes.js";
dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());
app.use([signUpRouter, signInRouter])

const PORT = process.env.PORT;
app.listen(PORT, () => console.log(`Server running in port: ${PORT}`));
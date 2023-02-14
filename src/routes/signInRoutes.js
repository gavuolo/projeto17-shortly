import { Router } from "express";
import { postSignIn } from "../controllers/signInController.js";
import { signInValidation } from "../middlewares/signInMiddleware.js";

const signInRouter = Router()

signInRouter.post("/signIn", signInValidation, postSignIn)

export default signInRouter
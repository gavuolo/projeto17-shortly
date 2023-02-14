import { Router } from "express";
import { postSignUp } from "../controllers/signUpController.js";
import { postSignUpValidation } from "../middlewares/signUpMiddleware.js";
const signUpRouter = Router()

signUpRouter.post("/signUp", postSignUpValidation, postSignUp)

export default signUpRouter
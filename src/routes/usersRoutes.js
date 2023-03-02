import { Router } from "express";
import { getUsersMe } from "../controllers/usersMeController.js";
const userRouter = Router()

userRouter.get("/users/me", getUsersMe)

export default userRouter
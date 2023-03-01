import { Router } from "express";
import { getUsersMe } from "../controllers/usersMeController.js";
const urlRouter = Router()

urlRouter.get("/users/me", getUsersMe)

export default urlRouter
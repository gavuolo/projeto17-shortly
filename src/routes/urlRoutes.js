import { Router } from "express";
import { postUrl } from "../controllers/urlController.js";
import { postUrlValidation } from "../middlewares/urlMiddleware.js";

const urlRouter = Router()

urlRouter.post("/url/shorten",postUrlValidation, postUrl)

export default urlRouter
import { Router } from "express";
import { getUrlId } from "../controllers/getUrlIdController.js";
import { postUrl } from "../controllers/urlController.js";
import { postUrlValidation } from "../middlewares/urlMiddleware.js";
const urlRouter = Router()

urlRouter.post("/url/shorten",postUrlValidation, postUrl)
urlRouter.get("/url/:id", getUrlId)

export default urlRouter
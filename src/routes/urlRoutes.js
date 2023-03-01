import { Router } from "express";
import { getOpenShortUrl } from "../controllers/getOpenShortUrl.js";
import { getUrlId } from "../controllers/getUrlIdController.js";
import { postUrl } from "../controllers/urlController.js";
import { postUrlValidation } from "../middlewares/urlMiddleware.js";
const urlRouter = Router()

urlRouter.post("/urls/shorten",postUrlValidation, postUrl)
urlRouter.get("/urls/:id", getUrlId)

urlRouter.get("/urls/open/:shortUrl", getOpenShortUrl)

export default urlRouter
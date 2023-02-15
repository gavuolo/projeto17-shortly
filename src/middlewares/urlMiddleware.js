import { db } from "../database/database.js";
import urlSchema from "../model/urlSchema.js";
export async function postUrlValidation(req, res, next) {
  const url = req.body;

  const { error } = urlSchema.validate(url);
  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(400).send({ errors });
  }
  
  res.locals.url = url;
  next()
}

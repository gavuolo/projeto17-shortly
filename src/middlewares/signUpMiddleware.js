import { db } from "../database/database.js";
import { signUpSchema } from "../model/signUpSchema.js";

export async function postSignUpValidation(req, res, next) {
  const user = req.body;

  const { error } = signUpSchema.validate(user);
  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(400).send({ errors });
  }
  //email existente
  const emailExist = await db.query("SELECT * FROM users WHERE email=$1",
  [user.email]);

  res.locals.signUp = user
  next()
}

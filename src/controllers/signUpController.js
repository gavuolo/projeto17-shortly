import { db } from "../database/database.js";
import bcrypt from "bcrypt";

export async function postSignUp(req, res) {
  const { name, email, password, confirmPassword } = res.locals.signUp;

  try {
    if (confirmPassword != password) {
      return res.sendStatus(422);
    }
    const hashPassword = bcrypt.hashSync(password, 10);
    await db.query(
      `
    INSERT INTO users (name, email, password)
    VALUES ($1, $2, $3)
    `,
      [name, email, hashPassword]
    );

    res.sendStatus(201);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

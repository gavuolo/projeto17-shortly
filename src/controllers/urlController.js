import { db } from "../database/database.js";
import { nanoid } from "nanoid";

export async function postUrl(req, res) {
  const authorization = req.headers.authorization;
  const token = authorization?.replace("Bearer ", "");
  const { url } = res.locals.postUrl;
  try {
    if (!token) {
      res.sendStatus(401);
    }
    const user = await db.query(
      'SELECT "userId" FROM sessions WHERE token = $1',
      [token]
    );
    if(user.rows[0] === undefined){
      return res.status(401).send("Login necessário!")
    }
    const userID = user.rows[0].userId;
    const shortUrl = nanoid(6);
    await db.query(
      `INSERT INTO urls ("userId", url, "shortUrl") VALUES ($1, $2, $3)`,
      [userID, url, shortUrl]
    );
    const shortUrlId = await db.query(`SELECT * FROM urls WHERE "shortUrl" = $1`, [
        shortUrl,
    ]);
     const response = {
       id: shortUrlId.rows[0].id,
       shortUrl: shortUrl
     };
    //seria legal não repetir url (se tiver tempo)
    res.status(201).send(response);
  } catch (err) {
    res.send(err);
  }
}
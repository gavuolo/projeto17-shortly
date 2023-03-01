import { db } from "../database/database.js";
import { nanoid } from "nanoid";

export async function getUsersMe(req, res) {
  const authorization = req.headers.authorization;
  const token = authorization?.replace("Bearer ", "");
  try {
    if (!token) {
      res.sendStatus(401);
    }
    const sessions = await db.query(
      `
    SELECT * FROM sessions
    WHERE token = $1
    `,
      [token]
    );
    if(sessions.rowCount === 0){
        return res.sendStatus(401)
    }
    const userId = sessions.rows[0].userId;
    //usuario
    const user = await db.query(
      `
    SELECT * FROM users
    WHERE id = $1
    `,
      [userId]
    );
    //urls do usuário
    const shortUrlUser = await db.query(
      `
    SELECT * FROM urls
    WHERE "userId" = $1
    `,
      [userId]
    );
    //soma das visitas
    const sumVisitCount = await db.query(
      `
    SELECT sum(urls."visitCount") FROM urls 
    WHERE "userId" = $1
    `,
      [userId]
    );
    const response = {
      id: userId,
      name: user.rows[0].name,
      visitCount: sumVisitCount.rows[0].sum,
      shortenedUrls: shortUrlUser.rows,
    };
    res.status(200).send(response);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

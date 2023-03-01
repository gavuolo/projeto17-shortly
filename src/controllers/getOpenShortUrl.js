import { db } from "../database/database.js";
export async function getOpenShortUrl(req, res) {
  const paramShortUrl = req.params.shortUrl;
  try {
    const shortUrl = await db.query(
      `
   SELECT * FROM urls WHERE "shortUrl" = $1
   `,
      [paramShortUrl]
    );
    if (shortUrl.rows[0] === undefined) {
      return res.sendStatus(404);
    }
    
    const compareShortUrl = shortUrl.rows[0].shortUrl;
    const visitCountUpdate = shortUrl.rows[0].visitCount + 1;
    await db.query(
      `
    UPDATE urls
    SET "visitCount" = $1
    WHERE "shortUrl" = $2
   `,
      [visitCountUpdate, compareShortUrl]
    );
    const redirectUrl = shortUrl.rows[0].url
    res.redirect(redirectUrl)
  } catch (err) {
    res.status(500).send(err.message);
  }
}

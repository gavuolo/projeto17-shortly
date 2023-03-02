import { db } from "../database/database.js";
export async function getRanking(req, res) {
  try {
    const ranking = await db.query(`
	SELECT users.id, users.name, 
	COUNT(urls.url) 
	AS "linksCount", COALESCE(SUM(urls."visitCount"),0)
	AS "visitCount" 
	FROM users 
	LEFT JOIN urls 
	ON users.id = urls."userId" 
	GROUP BY users.id 
	ORDER BY "visitCount"
	DESC LIMIT(10);`);

    res.send(ranking.rows).status(200);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
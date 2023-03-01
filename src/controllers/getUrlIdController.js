import { db } from "../database/database.js";
export async function getUrlId(req, res){
    const id = req.params.id;
    try{
        // id, shortUrl, url
        const urlId = await db.query(
            `SELECT urls.id, urls."shortUrl", urls.url FROM urls WHERE id = $1`,
            [id]
        )
        if(urlId.rowCount === 0){
            res.sendStatus(404)
        }
        const response = urlId.rows[0]
        res.send(response).status(200)
    } catch(err){
        res.status(500).send(err.message);
    }
}
import { db } from "../database/database.js";
import { v4 as uuidV4 } from "uuid";
import bcrypt from "bcrypt";

export async function postSignIn(req, res){
    const {email, password} = res.locals.signIn
    try{
        const user = await db.query(
            `
            SELECT * FROM users WHERE email=$1
            `, [email]
        )
        if(!bcrypt.compareSync(password, user.rows[0].password)){
            return res.status(401).send("Senha incorreta")
        }
        const token = uuidV4()
        console.log(token)
        const userId = user.rows[0].id
        await db.query(
            `
            INSERT INTO sessions (token, "userId")
            VALUES ($1, $2)
            `, [token, userId]
        )
        res.send({token}).status(201)
    }catch(error){
        res.send(error.message).status(400)
    }
}
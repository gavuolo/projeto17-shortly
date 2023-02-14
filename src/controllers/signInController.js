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

        res.send('ok')
    }catch(error){
        res.status(400).send(error.message)
    }
}
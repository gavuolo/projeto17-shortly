import pkg from "pg";
import dotenv from "dotenv";

dotenv.config();

const { Pool } = pkg;

if(process.env.MODE === 'prod'){
  configDatabase.ssl = true;
}

const configDatabase = {
  connectionString: process.env.DATABASE_URL,
  ssl: true,
};
export const db = new Pool(configDatabase)
import { Pool } from 'pg';

const pool = new Pool({
  user: 'admin',
  host: '192.168.33.10',
  database: 'db',
  password: 'root',
  port: 5432
});

export const query = async (text, params) => {
  const client = await pool.connect();
  try {
    const res = await client.query(text, params);
    return res;
  } catch (err) {
    console.error('Database query error:', err);
    throw err;
  } finally {
    client.release();
  }
};

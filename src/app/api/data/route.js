import { query } from "@/app/lib/db";

export async function GET() {

    try {
        const result = await query('SELECT * FROM users', []);
        console.log(result.rows)
        return new Response(JSON.stringify(result.rows), {
            status: 200,
          });
      } catch (error) {
        console.error('Error fetching data:', error);
        return new Response("internal error", {
            status: 500,
        });
    }

  }
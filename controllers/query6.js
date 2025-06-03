const pool = require("../dbConfig");

const addGame = async (req, res) => {
    const { name, description, link, genre } = req.query;
    
    const client = await pool.connect()

    try {
        await client.query("BEGIN");
        await client.query(`ALTER TYPE GENRE_NAME ADD VALUE IF NOT EXISTS '${genre}'`);
        await client.query("COMMIT");
        const matchingGenres = await client.query('SELECT "ID" FROM genre WHERE "Genre"=$1', [genre]);
        if (matchingGenres.rowCount === 0) {
            await client.query('INSERT INTO genre ("Genre") VALUES ($1)', [genre]);
        }
        const result = await client.query('INSERT INTO Game ("Name", "Genre", "Preview", "Description", "Link") VALUES ($1, $2, NULL, $3, $4) RETURNING *', [name, matchingGenres.rows[0].ID, description, link]);
        await client.query("COMMIT");

        res.json(result.rows);
        
    } catch (err) {
        await client.query("ROLLBACK")
        res.status(500).send("Invalid input: either a missing input or invalid game link.");
        throw err
    } finally {
        client.release()
    }
};

module.exports = {
    addGame: addGame,
};

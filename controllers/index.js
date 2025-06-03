const db = require("../dbConfig");

const getAllGames = (req, res) => {
  const query = `SELECT * FROM Game;`;

  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching games:", err);
      res.status(500).json({ error: "Error fetching games list" });
    } else {
      res.json(results.rows); // PostgreSQL returns results.rows, not just results
    }
  });
};

module.exports = {
  getAllGames: getAllGames,
};

const db = require("../dbConfig");

const getAllGames = (req, res) => {
  const query = `SELECT * FROM Game;`;

  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching games:", err);
      res.status(500).json({ error: "Error fetching games list" });
    } else {
      res.json(results.rows);
    }
  });
};

const getUsernames = (req, res) => {
  const gameName = req.query.Name;

  const query = `
    SELECT "U"."Name" AS "Usernames" 
    FROM Users AS "U"
    JOIN Feedback AS "F" ON "F"."User_ID" = "U"."ID"
    JOIN Game AS "G" ON "G"."ID" = "F"."Game_ID"
    WHERE "F"."Rating" = 5 AND "G"."Name" = $1
  `;

  // Execute the query only once
  db.query(query, [gameName], (err, results) => {
    if (err) {
      console.error("Error fetching usernames:", err);
      res.status(500).json({ error: "Error fetching usernames list" });
    } else {
      res.json(results.rows);
    }
  });
};

module.exports = {
  getAllGames: getAllGames,
  getUsernames: getUsernames,
};

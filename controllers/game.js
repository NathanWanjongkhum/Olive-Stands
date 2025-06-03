const db = require("../dbConfig");

const getGame = (req, res) => {
  console.log("Fetching game details...");
  const { ID } = req.query;
  if (!ID) {
    // Validate Input
    return res.status(400).send("ID is required");
  }

  const query = `
    SELECT * 
    FROM Game 
    WHERE Game."ID" = $1;
  `;

  db.query(query, [ID], (err, results) => {
    if (err) {
      console.error("Error fetching games:", err);
      res.status(500).json({ error: "Error fetching games list" });
    } else {
      res.json(results.rows);
    }
  });
};

module.exports = {
  getGame: getGame,
};

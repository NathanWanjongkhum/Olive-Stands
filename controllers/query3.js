const db = require("../dbConfig");

const getGamesByRatingCount = (req, res) => {
  const order = req.query.order === "ASC" ? "ASC" : "DESC";
  const query = `
    SELECT
        "Name",
        COUNT("Rating") AS "Rating_Count"
    FROM feedback
        RIGHT JOIN game ON feedback."Game_ID"=game."ID"
    GROUP BY "Game_ID", "ID", "Name"   
    ORDER BY "Rating_Count" ${order};
  `;

  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching games:", err);
      res.status(500).json({ error: "Error fetching games list" });
    } else {
      res.json(results.rows);
    }
  });
};

module.exports = {
  getGamesByRatingCount: getGamesByRatingCount,
};

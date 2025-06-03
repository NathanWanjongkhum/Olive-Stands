const db = require("../dbConfig");

const getAllGenresAboveThreshold = (req, res) => {
  const threshold = parseFloat(req.query.threshold) || 0;

  if (isNaN(threshold) || threshold < 0 || threshold > 5) {
    res.status(400).json({ error: "Invalid threshold" });
    return;
  }

  const query = `
    SELECT Genre."Genre"
      FROM Genre
      WHERE Genre."ID" IN (
        SELECT Game."Genre"
        FROM Game
        JOIN Feedback ON Game."ID" = Feedback."Game_ID"
        GROUP BY Game."Genre"
        HAVING AVG(CAST(Feedback."Rating" AS DECIMAL)) >= $1
      );
  `;

  db.query(query, [threshold], (err, results) => {
    if (err) {
      console.error("Error fetching genres:", err);
      res.status(500).json({ error: "Error fetching genres list" });
    } else {
      res.json(results.rows);
    }
  });
};

module.exports = {
  getAllGenresAboveThreshold: getAllGenresAboveThreshold,
};

const db = require("../dbConfig");

const getAllGenres = (req, res) => {
  const query = `SELECT Game."Name" FROM Game;`;

  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching genres:", err);
      res.status(500).json({ error: "Error fetching genres list" });
    } else {
      res.json(results.rows);
    }
  });
};

const getHighestRating = (req, res) => {
  const gameName = req.query.Name;

  if (!gameName) {
    res.status(400).json({ error: "Game Name is required" });
    return;
  }

  const query = `
    SELECT 
      Game."Name" AS Game_Name,
      Feedback."Rating" AS Highest_Rating,
      Users."Name" AS User_Name
    FROM Feedback
    JOIN Game ON Game."ID" = Feedback."Game_ID"
    JOIN Users ON Users."ID" = Feedback."User_ID"
    WHERE Game."Name" = $1
    AND Feedback."Rating" = (
      SELECT MAX(CAST(Feedback2."Rating" AS DECIMAL))
      FROM Feedback AS Feedback2
      WHERE Feedback2."Game_ID" = Feedback."Game_ID"
    );
  `;

  db.query(query, [gameName], (err, results) => {
    if (err) {
      console.error("Error fetching games:", err);
      res.status(500).json({ error: "Error fetching games list" });
    } else {
      res.json(results.rows);
    }
  });
};

module.exports = {
  getAllGenres: getAllGenres,
  getHighestRating: getHighestRating,
};

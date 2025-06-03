const db = require("../dbConfig");

const getGameFeedback = (req, res) => {
  const { ID } = req.query;
  if (!ID) {
    // Validate Input
    return res.status(400).send("ID is required");
  }

  // Get requested Game's Feedback by ID
  const query = `
    SELECT 
      Feedback."Rating" AS "Feedback_Rating",
      Feedback."Comment" AS "Feedback_Comment",
      Users."Name" AS "User_Name"
    FROM Feedback 
    LEFT JOIN Users ON Feedback."User_ID" = Users."ID"
    WHERE Feedback."Game_ID" = $1;
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

const getGame = (req, res) => {
  const { ID } = req.query;
  if (!ID) {
    // Validate Input
    return res.status(400).send("ID is required");
  }

  // Get requested Game by ID
  const query = `
    SELECT 
      Game."ID" AS "Game_ID", 
      Game."Name" AS "Game_Name",
      Game."Genre" AS "Game_Genre",
      Game."Description" AS "Game_Description",
      Game."Link" AS "Game_Link"
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
  getGame,
  getGameFeedback,
};

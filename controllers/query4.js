const db = require("../dbConfig");

const getReviewsByReviewer = (req, res) => {
  const reviewerName = req.query.reviewerName;
  const query = `
    SELECT * FROM Feedback as F
    JOIN Game as "G" ON "G"."ID" = F."Game_ID"
    JOIN Developers as "D" ON "D"."Game_ID" = "G"."ID"
    WHERE "D"."Name" LIKE $1;
  `;

  // The '%' wildcard is used to match any characters before or after the reviewer name
  const sanitizedReviewerName = `%${reviewerName}%`;

  db.query(query, [sanitizedReviewerName], (err, results) => {
    if (err) {
      console.error("Error fetching reviews:", err);
      res.status(500).json({ error: "Error fetching reviews" });
    } else {
      res.json(results.rows);
    }
  });
};

module.exports = {
  getReviewsByReviewer: getReviewsByReviewer,
};

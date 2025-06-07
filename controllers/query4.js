const db = require("../dbConfig");

const getReviewsByReviewer = (req, res) => {
  const reviewerName = req.query.reviewerName;
  const query = `
    SELECT 
        Feedback."Game_ID",
        Feedback."User_ID",
        Feedback."Rating",
        Feedback."Comment"
    FROM Feedback
        JOIN Users ON Feedback."User_ID"=Users."ID"
    WHERE Users."Name" = $1;
  `;

  db.query(query, [reviewerName], (err, results) => {
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

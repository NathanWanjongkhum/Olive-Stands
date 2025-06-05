// Import Required Libraries
const express = require("express");
const pool = require("./dbConfig");
const PORT = process.env.PORT || 5000;

const app = express();

// Import Controllers
const indexController = require("./controllers/index");
const gameController = require("./controllers/game");
const query1Controller = require("./controllers/query1");
const query2Controller = require("./controllers/query2");
const query3Controller = require("./controllers/query3");
const query4Controller = require("./controllers/query4");
const query5Controller = require("./controllers/query5");
const query6Controller = require("./controllers/query6");

// Middleware Setup
app.use(express.json());
app.use(express.static("public"));
app.use(express.static("assets"));

app.get("/index", indexController.getAllGames);
app.get("/game", gameController.getGame);
app.get("/game/feedback", gameController.getGameFeedback);
app.get("/query1", query1Controller.getAllGenresAboveThreshold);
app.get("/query2", query2Controller.getAllGenres);
app.get("/query2/details", query2Controller.getHighestRating);
app.get("/query3", query3Controller.getGamesByRatingCount);
app.get("/query4", query4Controller.getAllGames);
app.get("/query5", query5Controller.getAllGames);
app.get("/query6", query6Controller.addGame);

// Start the server and log a message indicating the URL.
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

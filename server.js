// Import Required Libraries
const express = require("express");
const pool = require("./dbConfig");
const PORT = process.env.PORT || 5000;

const app = express();

// Import Controllers
const indexController = require("./controllers/index");
const gameController = require("./controllers/game");

// Middleware Setup
app.use(express.json());
app.use(express.static("public"));
app.use(express.static("assets"));

app.get("/index", indexController.getAllGames);
app.get("/game", gameController.getGame);
app.get("/game/feedback", gameController.getGameFeedback);
app.get("/query1", require("./controllers/query1").getAllGames);
app.get("/query2", require("./controllers/query2").getAllGames);
app.get("/query3", require("./controllers/query3").getAllGames);
app.get("/query4", require("./controllers/query4").getAllGames);
app.get("/query5", require("./controllers/query5").getAllGames);
app.get("/query6", require("./controllers/query6").addGame);

// Start the server and log a message indicating the URL.
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

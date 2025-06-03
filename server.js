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

// Start the server and log a message indicating the URL.
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

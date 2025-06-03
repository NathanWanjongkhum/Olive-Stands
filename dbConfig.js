// Import the mysql2 Library
const { Pool } = require("pg");
require("dotenv").config();

// Create a Database Connection
const pool = new Pool({
  host: process.env.DB_HOST, // Database host
  port: process.env.DB_PORT, // Database port
  user: process.env.DB_USER, // Database username
  password: process.env.DB_PASSWORD, // Database password
  database: process.env.DB_NAME, // Database name to connect to
});

pool.on("error", (err, client) => {
  console.error("Unexpected error on idle client", err);
  process.exit(-1);
});

// Export the Pool
module.exports = pool;

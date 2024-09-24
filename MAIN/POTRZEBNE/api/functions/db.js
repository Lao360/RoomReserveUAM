const mysql = require("mysql2");

const pool = mysql.createPool({
  host: process.env.DBHOST,
  user: process.env.DBUSER,
  password: process.env.DBPASSWORD,
  database: "engineer",
  waitForConnections: true,
  connectionLimit: 99,
  queueLimit: 0,
});
const db = pool.promise();

module.exports = db;

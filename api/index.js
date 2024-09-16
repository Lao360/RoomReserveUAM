require("dotenv").config();
const PORT = process.env.PORT || 5000;
const express = require("express");
const app = express();
const classRoutes = require("./routes/classRoutes");
const mysql = require("mysql2");

app.use(express.json());
app.use("/api/class", classRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

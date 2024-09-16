require("dotenv").config();
const express = require("express");
const router = express.Router();
const db = require("../functions/db");
const { body, param, validationResult } = require("express-validator");

router.get("/",
  async (req, res) => {
    try {
       const sql = "SELECT * FROM class";
         db.query(sql, (err, results) => {
           res.json(results);
         });
    } catch (error) {
      console.error(error);
      res
        .status(500)
        .json({
          error: "An unexpected error occurred on the server. Please try again later.",
        });
    }
  }
);

router.post("/",
  async (req, res) => {
    try {
    const { class_name, describ, room_id, proffesor_id, starts, ends } = req.body;
    const sql = `
      INSERT INTO class (class_name, describ, room_id, proffesor_id, starts, ends)
      VALUES (?, ?, ?, ?, ?, ?)
    `;
      db.query(sql, [class_name, describ, room_id, proffesor_id, starts, ends])
      res.status(201)
    } catch (error) {
      console.error(error);
      res
        .status(500)
        .json({
          error: "An unexpected error occurred on the server. Please try again later.",
        });
    }
  }
);

router.put("/",
  async (req, res) => {
  try {
    const { class_name, describ, room_id, proffesor_id, starts, ends } =
      req.body;
    const { id } = req.body;
    const sql = `
      UPDATE class
      SET class_name = ?, describ = ?, room_id = ?, proffesor_id = ?, starts = ?, ends = ?
      WHERE id = ?
    `;
    const result = await db.query(sql, [
      class_name,
      describ,
      room_id,
      proffesor_id,
      starts,
      ends,
      id,
    ]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Class not found" });
    }

    res.json({ message: "Class updated successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      error: "An unexpected error occurred on the server. Please try again later.",
    });
  }
});

router.delete("/",
  async (req, res) => {
  try {
    const { id } = req.body;
    const sql = "DELETE FROM class WHERE id = ?";
    const result = await db.query(sql, [id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Class not found" });
    }

    res.json({ message: "Class deleted successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      error: "An unexpected error occurred on the server. Please try again later.",
    });
  }
});

module.exports = router;

const feedModel = require("../models/feed_model");
const express = require("express");
const router = express.Router();

// Get all gallery
router.get("/", async (req, res, next) => {
  try {
    const result = await feedModel.get();
    return res.json(result);
  } catch (e) {
    return next(e);
  }
});

module.exports = router;
const functions = require("firebase-functions");
const express = require("express");
const app = express();

const todosRouter = require("./api/controllers/todos_controller");
const userRouter = require("./api/controllers/user_controller");
const feedRouter = require("./api/controllers/feed_controller");
const questRouter = require("./api/controllers/question_controller");
const ansRouter = require("./api/controllers/answer_controller");
const reminderRouter = require("./api/controllers/reminder_controller");
const petRouter = require("./api/controllers/pet_controller");

app.use(express.json());
app.use("/todos", todosRouter);
app.use("/user", userRouter);
app.use("/gallery", feedRouter);
app.use("/question", questRouter);
app.use("/answer", ansRouter);
app.use("/reminder", reminderRouter);
app.use("/hamster", petRouter);

exports.api = functions.https.onRequest(app);

// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
  timeoutSeconds: 300,
});

 exports.setupdb = functions.https.onRequest(require('./setup_database'))
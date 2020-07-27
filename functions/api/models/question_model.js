const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class QuestModel {
  constructor() {
    if (this.instance) return this.instance;
    QuestModel.instance = this;
  }

  get() {
    return database.getList("question");
  }

  getById(id) {
    return database.get("question", id);
  }

  create(q) {
    return database.create("question", q);
  }

  delete(id) {
    return database.delete("question", id);
  }

  update(id, q) {
    return database.set("question", id, q);
  }
}

module.exports = new QuestModel();
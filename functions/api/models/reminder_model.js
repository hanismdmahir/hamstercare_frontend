const database = require("../database");

class ReminderModel {
  constructor() {
    if (this.instance) return this.instance;
    ReminderModel.instance = this;
  }

  get() {
    return database.getList("reminder");
  }

  getById(id) {
    return database.get("reminder", id);
  }

  create(r) {
    return database.create("reminder", r);
  }

  delete(id) {
    return database.delete("reminder", id);
  }

  update(id, r) {
    return database.set("reminder", id, r);
  }
}

module.exports = new ReminderModel();
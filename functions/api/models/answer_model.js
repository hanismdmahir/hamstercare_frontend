const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class AnsModel {
  constructor() {
    if (this.instance) return this.instance;
    AnsModel.instance = this;
  }

  get() {
    return database.getList("answer");
  }

  getById(id) {
    return database.get("answer", id);
  }

  create(a) {
    return database.create("answer", a);
  }

  delete(id) {
    return database.delete("answer", id);
  }

  update(id, a) {
    return database.set("answer", id, a);
  }
}

module.exports = new AnsModel();
const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class PetModel {
  constructor() {
    if (this.instance) return this.instance;
    PetModel.instance = this;
  }

  get() {
    return database.getList("hamster");
  }

  getById(id) {
    return database.get("hamster", id);
  }

  create(a) {
    return database.create("hamster", a);
  }

  delete(id) {
    return database.delete("hamster", id);
  }

  update(id, a) {
    return database.set("hamster", id, a);
  }
}

module.exports = new PetModel();
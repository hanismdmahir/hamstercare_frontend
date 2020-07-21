const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class UserModel {
  constructor() {
    if (this.instance) return this.instance;
    UserModel.instance = this;
  }

  get() {
    return database.getList("user");
  }

  getById(id) {
    return database.get("user", id);
  }

  create(user) {
    return database.create("user", user);
  }

  delete(id) {
    return database.delete("user", id);
  }

  update(id, user) {
    return database.set("user", id, user);
  }
}

module.exports = new UserModel();
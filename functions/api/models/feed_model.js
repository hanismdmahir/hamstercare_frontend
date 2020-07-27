const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class FeedModel {
  constructor() {
    if (this.instance) return this.instance;
    FeedModel.instance = this;
  }

  get() {
    return database.getList("gallery");
  }

  create(gallery) {
    return database.create("gallery", gallery);
  }

  delete(id) {
    return database.delete("gallery", id);
  }
}

module.exports = new FeedModel();
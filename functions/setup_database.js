const db = require("./api/database");

async function setupDatabase(req, res, next) {
  // To delete all the collections
  const collections = ["gallery"];
  collections.forEach(async (collection) => await deleteCollection(collection));

  addDocuments("user", [
    { email: " User@gmail.com" , username: "User 999", password:"123456", bio:"My Lovely Hamster", profilephoto: "ssets/photo4.jpg", post:3,  follower: 15,
    following: 23 },
    { email: " Chen@gmail.com" , username: "Chen Mei", password:"pass", bio:"Like Hamster", profilephoto: "ssets/photo4.jpg",  post: 10, follower: 55,
    following:3  },

  ]);

  addGallery("gallery", [
    {
      userName: 'Nayeon',
      userImage: 'assets/user1.jpg',
      feedTime: '1 mins ago',
      feedText: 'My name is Chiki! ',
      feedImage: 'assets/feed1.jpg',
      like: 10,
      //comment: '400 Comments',
    },
    {
      userName: 'Mina',
      userImage: 'assets/user2.jpg',
      feedTime: '1 hr ago',
      feedText: "Makan makan :3",
      feedImage: 'assets/feed2.jpg',
      like: 2,
      //comment: '50 Comments',
    },
    {
      userName: 'Sana',
      userImage: 'assets/user3.jpg',
      feedTime: '12 hr ago',
      feedText: "I sleep all day..",
      feedImage: 'assets/feed3.jpg',
      like: 300,
      //comment: '0 Comments',
    },
    ]
  )

  res.send("Setting Up User and Gallery.... Done ");
}

async function deleteCollection(collection) {
  const cref = db.firestore.collection(collection);
  const docs = await cref.listDocuments();
  docs.forEach((doc) => doc.delete());
}

function addDocuments(collection, docs) {
  docs.forEach((doc) => db.create(collection, doc));
}

function addGallery(collection, docs) {
  docs.forEach((doc) => db.create(collection, doc));
}

module.exports = setupDatabase;
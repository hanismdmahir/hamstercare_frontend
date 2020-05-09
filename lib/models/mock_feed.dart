import 'gallery.dart';
import 'mock_user.dart';
import 'user.dart';

User u = mockUser[0];

int i = 0;

List<Gallery> feed = [
  Gallery(
    userName: 'Malinda Roy',
    userImage: 'assets/user1.jpg',
    feedTime: '1 mins ago',
    feedText: 'My name is Chiki! ',
    feedImage: 'assets/feed1.jpg',
    like: '10k',
    comment: '400 Comments',
  ),

  u.photoUrl[i++],

  Gallery(
    userName: 'Azman Hakim',
    userImage: 'assets/user2.jpg',
    feedTime: '1 hr ago',
    feedText: "Makan makan :3",
    feedImage: 'assets/feed2.jpg',
    like: '1000k',
    comment: '50 Comments',
  ),

  u.photoUrl[i++],
  u.photoUrl[i++],

  Gallery(
    userName: 'Nazmi Irfan',
    userImage: 'assets/user3.jpg',
    feedTime: '12 hr ago',
    feedText:
        "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
    feedImage: 'assets/feed3.jpg',
    like: '1',
    comment: '0 Comments',
  ),

  u.photoUrl[i++],
  u.photoUrl[i++],

  Gallery(
    userName: 'Min Jen',
    userImage: 'assets/user4.jpg',
    feedTime: '23 hr ago',
    feedText:
        "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
    feedImage: 'assets/feed4.jpg',
    like: '5',
    comment: '1 Comments',
  ),

  u.photoUrl[i++],
];

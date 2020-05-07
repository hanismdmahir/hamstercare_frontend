
import 'package:hamstercare/models/gallery.dart';
import 'package:hamstercare/models/hamster.dart';
import 'package:hamstercare/models/user.dart';

List<User> mockUser = [

  User(
    email: "user@gmail.com",
    username: "User9990",
    bio: "My Lovely Hamster",
    password: "pass",
    profilephoto: 'assets/photo4.jpg',
    follower: 15,
    following: 23,
    pet: [
      Hamster(name:'Hachi', photo:'assets/h2.jpg'),
      Hamster(name:'Horlick', photo:'assets/h3.jpg'),
      Hamster(name:'Hachi', photo:'assets/h2.jpg'),
      Hamster(name:'Horlick', photo:'assets/h3.jpg'),
      Hamster(name:'Hachi', photo:'assets/h2.jpg'),
      Hamster(name:'Horlick', photo:'assets/h3.jpg'),
    ],
    photoUrl: [
      Gallery(photoUrl: 'assets/h1.jpg'),
      Gallery(photoUrl: 'assets/h2.jpg'),
      Gallery(photoUrl: 'assets/h3.jpg'),
      
      Gallery(photoUrl: 'assets/h4.jpg'),
      Gallery(photoUrl: 'assets/h5.jpg'),
      Gallery(photoUrl: 'assets/h6.jpg'),

      Gallery(photoUrl: 'assets/h1.jpg'),
      Gallery(photoUrl: 'assets/h2.jpg'),
      Gallery(photoUrl: 'assets/h3.jpg'),

      Gallery(photoUrl: 'assets/h1.jpg'),
      Gallery(photoUrl: 'assets/h2.jpg'),
      Gallery(photoUrl: 'assets/h3.jpg'),
      
      Gallery(photoUrl: 'assets/h4.jpg'),
      Gallery(photoUrl: 'assets/h5.jpg'),
      Gallery(photoUrl: 'assets/h6.jpg'),

      Gallery(photoUrl: 'assets/h1.jpg'),
      Gallery(photoUrl: 'assets/h2.jpg'),
      Gallery(photoUrl: 'assets/h3.jpg'),

      Gallery(photoUrl: 'assets/h1.jpg'),
      Gallery(photoUrl: 'assets/h2.jpg'),
      Gallery(photoUrl: 'assets/h3.jpg'),
      
      Gallery(photoUrl: 'assets/h4.jpg'),
      Gallery(photoUrl: 'assets/h5.jpg'),
      Gallery(photoUrl: 'assets/h6.jpg'),

      Gallery(photoUrl: 'assets/h1.jpg'),
      Gallery(photoUrl: 'assets/h2.jpg'),
      Gallery(photoUrl: 'assets/h3.jpg'),
    ]
  )

];
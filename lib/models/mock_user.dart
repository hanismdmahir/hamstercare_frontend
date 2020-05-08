
import 'package:flutter/material.dart';
import 'package:hamstercare/models/gallery.dart';
import 'package:hamstercare/models/hamster.dart';
import 'package:hamstercare/models/reminder.dart';
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
    reminder: [
      Reminder(
        date: DateTime(2020,5,8),
        time: TimeOfDay(hour: 16, minute: 30),
        title: 'Change Bedding',
        note: 'Tukar layout cage',
        repeated: true),

        Reminder(
        date: DateTime(2020,5,8),
        time: TimeOfDay(hour: 23, minute: 30),
        title: 'Feeding time',
        note: 'Jangan lupa bagi treat',
        repeated: false)
    ],
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
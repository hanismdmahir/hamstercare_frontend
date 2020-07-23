import 'package:flutter/material.dart';
import 'package:hamstercare/models/gallery.dart';
import 'package:hamstercare/models/hamster.dart';
import 'package:hamstercare/models/reminder.dart';
import 'package:hamstercare/models/user.dart';

List<User> mockUser = [
  User(
      email: "user@gmail.com",
      username: "User999",
      bio: "My Lovely Hamster",
      password: "pass",
      profilephoto: 'assets/photo4.jpg',
      follower: 15,
      following: 23,
      reminder: [
        Reminder(
            date: DateTime(2020, 5, 9),
            time: TimeOfDay(hour: 16, minute: 30),
            title: 'Change Bedding',
            note: 'Tukar layout cage',
            repeated: true),
        Reminder(
            date: DateTime(2020, 5, 9),
            time: TimeOfDay(hour: 23, minute: 30),
            title: 'Feeding time',
            note: 'Jangan lupa bagi treat',
            repeated: false),
        Reminder(
            date: DateTime(2020, 5, 9),
            time: TimeOfDay(hour: 23, minute: 30),
            title: 'Feeding time',
            note: 'Jangan lupa bagi treat',
            repeated: false)
      ],
      pet: [
        Hamster(name: 'Hachi', photo: 'assets/h2.jpg'),
        Hamster(name: 'Horlick', photo: 'assets/h3.jpg'),
      ],
      photoUrl: [
        Gallery(
          userName: 'User999',
          userImage: 'assets/photo4.jpg',
          feedImage: 'assets/h1.jpg',
          feedTime: "4 mins ago",
          feedText: "Nyum Nyum",
          like: 112,
          //comment: "34 comments"
        ),
        Gallery(
          userName: 'User999',
          userImage: 'assets/photo4.jpg',
          feedImage: 'assets/h2.jpg',
          feedTime: "2 hr ago",
          feedText: "Wink >.<",
          like: 312,
          //comment: "14 comments"
        ),
        Gallery(
          userName: 'User999',
          userImage: 'assets/photo4.jpg',
          feedImage: 'assets/h3.jpg',
          feedTime: "3 hr ago",
          feedText: "Hey",
          like: 231,
          //comment: "22 comments"
        ),
        Gallery(
          userName: 'User999',
          userImage: 'assets/photo4.jpg',
          feedImage: 'assets/h4.jpg',
          feedTime: "16 hr ago",
          feedText: "Zzzz..",
          like: 452,
          //comment: "34 comments"
        ),
        Gallery(
          userName: 'User999',
          userImage: 'assets/photo4.jpg',
          feedImage: 'assets/h5.jpg',
          feedTime: "20 hr ago",
          feedText: "Thirstyy..",
          like: 135,
          //comment: "23 comments"
        ),
        Gallery(
          userName: 'User999',
          userImage: 'assets/photo4.jpg',
          feedImage: 'assets/h6.jpg',
          feedTime: "2 days ago",
          feedText: "MCO no going outside",
          like: 235,
          //comment: "21 comments"
        ),
      ])
];

import 'package:hamstercare/models/gallery.dart';

import 'hamster.dart';

class User {
  String email;
  String username;
  String password;
  String bio;
  String profilephoto;
  int post;
  int follower;
  int following;
  List<Hamster> pet;
  List <Gallery> photoUrl;

  User({this.email,this.username,this.password,this.bio,this.profilephoto,this.post =0,this.follower,this.following,this.pet,this.photoUrl});

  int get postNo{
    return photoUrl.length;
  }

  User.copy(User from) : this(
    email: from.email, 
    username: from.username,
    password: from.password,
    bio: from.bio,
    profilephoto: from.profilephoto,
    post: from.post,
    follower: from.follower,
    following: from.following,
    pet : [...from.pet],
    photoUrl : [...from.photoUrl]
    
  );

}
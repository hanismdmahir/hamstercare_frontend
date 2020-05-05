import 'package:hamstercare/models/gallery.dart';

import 'hamster.dart';

class User {
  String email;
  String username;
  String password;
  String bio;
  List<Hamster> pet;
  List <Gallery> photoUrl;

  User({this.email,this.username,this.password,this.bio,this.pet,this.photoUrl});

  

}
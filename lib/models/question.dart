
import 'package:hamstercare/models/answer.dart';

class Question{
  String id;
  String title;
  String desc;
  String username;
  List<Answer> ans = [];

  Question({this.id, this.title, this.desc, this.username});

  Question.fromJson(Map<String, dynamic> json)
  : this(
    id: json['id'],
    title: json['title'],
    desc: json['desc'],
    username: json['username']
  );

  Map<String,dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'desc' : desc,
    'username' : username
  };
}

import 'package:flutter/material.dart';
import 'package:hamstercare/add/add.dart';
import 'package:hamstercare/models/mock_feed.dart';
import 'package:hamstercare/models/reminder.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/userProfile/userProfile.dart';
import '../feed/feed.dart';
import 'package:hamstercare/models/mock_user.dart';
import '../reminder/reminderscreen.dart';
import '../userProfile/userProfile.dart';

class DiscussionScreen extends StatefulWidget {
  final User user;

  DiscussionScreen(this.user);

  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
   int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: discussion(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('QnA'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            title: Text('Reminder'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context,MaterialPageRoute(builder: (context) => FeedNews(feed,widget.user)));
             break;
             case 1:
              Navigator.push(context,MaterialPageRoute(builder: (context) => DiscussionScreen(mockUser[0])));
             break;
             case 2:
              Navigator.push(context,MaterialPageRoute(builder: (context) => AddScreen(mockUser[0])));
             break;
             case 3:
             Navigator.push(context,MaterialPageRoute(builder: (context) => ReminderScreen(mockUser[0]),));
             break;
             case 4:
             Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage(mockUser[0]),));
             break;
          }});
}

ListView discussion() {
  return ListView(
    children: <Widget>[
      //first quest
      Card(
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: Padding(
            padding: EdgeInsets.fromLTRB(38, 10, 38, 15),
            child: Column(
              children: <Widget>[
                Container(
                  height: 30,
                  child: Text(
                    'Why my hamster dont want to eat?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ), ), ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  leading: Icon(Icons.person),
                  title: Text('User999'),
                  subtitle: Text('13 Feb 2020'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person_add),
                  ),),
                Container(
                  child: Text(
                    '34 Answers',
                    textAlign: TextAlign.left,
                  ),),
                TextField(
                  style: TextStyle(fontSize: 15.0),
                  decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(), hintText: 'Add Answer..'),
                ),
       ],),)),
      
      Card(
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: Padding(
            padding: EdgeInsets.fromLTRB(38, 10, 38, 15),
            child: Column(
              children: <Widget>[
                Container(
                  height: 30,
                  child: Text(
                    'How to tame my male roborovski hamster?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ), ), ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  leading: Icon(Icons.person),
                  title: Text('User1234'),
                  subtitle: Text('1 Jan 2020'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person_add),
                  ),),
                Container(
                  child: Text(
                    '4 Answers',
                    textAlign: TextAlign.left,
                  ),),
                TextField(
                  style: TextStyle(fontSize: 15.0),
                  decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(), hintText: 'Add Answer..'),
                ),
       ],),)),
      
 ], );}

}


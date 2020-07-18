import 'package:flutter/material.dart';
import 'package:hamstercare/discussion/discussion.dart';

import '../feed/feed.dart';
import '../models/mock_feed.dart';
import '../models/mock_user.dart';
import '../models/user.dart';
import '../reminder/reminderscreen.dart';
import '../userProfile/userProfile.dart';

class AddScreen extends StatefulWidget {
  final User user;

  AddScreen(this.user);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
   int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: add(),
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

  Container add() {
  return Container(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: TabBar(
              labelColor: Colors.black87,
              indicatorColor: Colors.orange,
              tabs: [
                Tab(text: 'Photo'),
                Tab(text: 'Hamster'),
                Tab(text: 'Question'),
              ],),
            body: TabBarView(
              children: [
                _uploadPhoto(),
                _addHamster(),
                _askQuestion(),
             ],),
)));}

//question
Container _askQuestion() {
  return Container(
    margin: EdgeInsets.only(right: 30, left: 30, top: 50),
    child: Column(
      children: <Widget>[
        TextField(
          style: TextStyle(fontSize: 12, height: 3.0),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ask anything',
        ),),
        Center(
          child: RaisedButton(
            color: Colors.orange,
            onPressed: () {},
            child: Text(
              'Post',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
         ),),),),
],),);}

//hamster
Container _addHamster() {
  return Container(
    margin: EdgeInsets.only(right: 30, left: 30),
    child: ListView(
      children: <Widget>[
        Center(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Icon(Icons.add_a_photo)),
            ),
          ),
        TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name',
          ),),
        Divider(),
        TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Gender',
          ),),
        Divider(),
        TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Birth Date',
          ),),
        Divider(),
        TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Neutered/Intact',
          ),),
        Divider(),
        TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Color',
          ),),
        Divider(),
        TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Breed',
          ),),
        Divider(),
        TextField(
          style: TextStyle(fontSize: 12, height: 3.0),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Description',
          ),),
        Center(
          child: RaisedButton(
            color: Colors.orange,
            onPressed: () {},
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
         ),),),),
      ],
    ),
  );
}

//photo
Center _uploadPhoto() {
  return Center(
    child: ListView(
      children: <Widget>[
        Center(
          child: Container(
            child: Center(child: Icon(Icons.add_a_photo)),
            height: 250,
            width: 250,
            margin: EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              focusColor: Colors.blue,
              color: Colors.orange,
              onPressed: () {},
              child: Text(
                'Hachi',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              color: Colors.orange,
              onPressed: () {},
              child: Text(
                'Horlick',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(40),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 60),
              border: OutlineInputBorder(),
              labelText: 'Say something..',
            ),
          ),
        ),
        Center(
          child: RaisedButton(
            color: Colors.orange,
            onPressed: () {},
            child: Text(
              'Share',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),),),),
      ],
    ),
  );
}

}


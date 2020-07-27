import 'package:flutter/material.dart';
import 'package:hamstercare/add/upload_photo.dart';
import 'package:hamstercare/discussion/discussion.dart';
import 'package:hamstercare/services/hamster_services.dart';
import 'package:hamstercare/services/qna_services.dart';

import '../feed/feed.dart';
import '../models/user.dart';
import '../reminder/reminderscreen.dart';
import '../userProfile/userProfile.dart';

import '../services/feedback_service.dart';
import '../models/gallery.dart';

class AddScreen extends StatefulWidget {
  final User user;
  AddScreen(this.user);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _gender = new TextEditingController();
  final TextEditingController _bod = new TextEditingController();
  final TextEditingController _ni = new TextEditingController();
  final TextEditingController _color = new TextEditingController();
  final TextEditingController _breed = new TextEditingController();
  final TextEditingController _desc = new TextEditingController();
  final TextEditingController _qtitle = new TextEditingController();
  final TextEditingController _qdesc = new TextEditingController();

  String get name => _name.text;
  String get gender => _gender.text;
  String get bod => _bod.text;
  String get ni => _ni.text;
  String get color => _color.text;
  String get breed => _breed.text;
  String get desc => _desc.text;
  String get username => widget.user.username;
  String get qdesc => _qdesc.text;
  String get qtitle => _qtitle.text;

  final dataService1 = HamsterDataService();
  final dataService2 = QnADataService();

  int _currentIndex = 2;

  //var myController = TextEditingController();
  final dataService = FeedbackDataService();
  Gallery theFeed;
  //Color _color = Colors.white;
  //Color _text = Colors.orange;

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
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedNews(widget.user)));
              break;
            case 1:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiscussionScreen(widget.user)));
              break;
            case 2:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddScreen(widget.user)));
              break;
            case 3:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReminderScreen(widget.user),
                  ));
              break;
            case 4:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(widget.user),
                  ));
              break;
          }
        });
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
                ],
              ),
              body: TabBarView(
                children: [
                  // UploadPhoto(_color: _color, _text: _text, _controller: _controller, dataService: dataService, user: widget.user),
                  UploadPhoto(widget.user),
                  _addHamster(),
                  _askQuestion(),
                ],
              ),
            )));
  }

//question
  Container _askQuestion() {
    return Container(
      margin: EdgeInsets.only(right: 30, left: 30, top: 50),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _qtitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Title...',
            ),
          ),
          Divider(),
          TextField(
            controller: _qdesc,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Description...',
            ),
          ),
          Center(
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () async {
                await dataService2.createQuestion(qtitle, qdesc, username);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DiscussionScreen(widget.user)));
              },
              child: Text(
                'Post',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
            controller: _name,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          Divider(),
          TextField(
            controller: _gender,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Gender',
            ),
          ),
          Divider(),
          TextField(
            controller: _bod,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Birth Date',
            ),
          ),
          Divider(),
          TextField(
            controller: _ni,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Neutered/Intact',
            ),
          ),
          Divider(),
          TextField(
            controller: _color,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Color',
            ),
          ),
          Divider(),
          TextField(
            controller: _breed,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Breed',
            ),
          ),
          Divider(),
          TextField(
            controller: _desc,
            style: TextStyle(fontSize: 12, height: 3.0),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Description',
            ),
          ),
          Center(
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () async {
                await dataService1.createHamster(
                    name: name,
                    photo: null,
                    gender: gender,
                    bod: bod,
                    color: color,
                    desc: desc,
                    breed: breed,
                    ni: ni,
                    username: username);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(widget.user)));
              },
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

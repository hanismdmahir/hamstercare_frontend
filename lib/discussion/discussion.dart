import 'package:flutter/material.dart';
import 'package:hamstercare/add/add.dart';
import 'package:hamstercare/models/answer.dart';
import 'package:hamstercare/models/question.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/services/qna_services.dart';
import 'package:hamstercare/userProfile/userProfile.dart';
import '../feed/feed.dart';
import '../reminder/reminderscreen.dart';
import '../userProfile/userProfile.dart';

class DiscussionScreen extends StatefulWidget {
  final User user;

  DiscussionScreen(this.user);

  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  List<TextEditingController> _answer = [];
  List<Question> quest = List<Question>();
  List<Answer> ans = List<Answer>();
  final dataService = QnADataService();
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Future.wait([dataService.getQuestion(), dataService.getAnswer()]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            quest = snapshot.data[0];
            for (int i = 0; i < quest.length; i++)
              _answer.add(TextEditingController());
            ans = snapshot.data[1];
            var l = ans.length - 1;

            for (var i = 0; i < quest.length; i++) {
              for (var j = l; j > -1; j--) {
                if (quest[i].id == ans[j].qid) {
                  Answer a = ans[j];
                  quest[i].ans.add(a);
                }
              }
            }

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.orange[400],
                centerTitle: true,
                title: Text(
                  "Discussion",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 2),
                ),
              ),
              body: discussion(quest, ans),
              bottomNavigationBar: buildBottomNavigationBar(),
            );
          }
          return _buildFetchingDataScreen();
        });

    //
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching from DB... Please wait'),
          ],
        ),
      ),
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

  Container discussion(List<Question> quest, List<Answer> ans) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange[900],
        //   Colors.orange[800],
        Colors.orange[400],
      ])),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: quest.length,
        itemBuilder: (context, index) {
          return Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 15, 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      child: Text(
                        quest[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(quest[index].desc),
                      subtitle: Text(
                        quest[index].username,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      color: Colors.orange,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: quest[index].ans.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      itemBuilder: (context, i) {
                        return Container(
                          child: ListTile(
                            onLongPress: () => (quest[index].ans[i].username ==
                                    widget.user.username)
                                ? deleteAnswer(index, i, quest[index].ans[i].id)
                                : null,
                            title: Text(quest[index].ans[i].answer),
                            subtitle: Text(
                              quest[index].ans[i].username,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _answer[index],
                      style: TextStyle(fontSize: 15.0),
                      decoration: InputDecoration.collapsed(
                          border: OutlineInputBorder(),
                          hintText: 'Add Answer..'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () async {
                        Answer a = await dataService.createAnswer(
                            quest[index].id,
                            _answer[index].text,
                            widget.user.username);

                        setState(() {
                          quest[index].ans.add(a);
                        });

                        _answer[index].clear();
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(150, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueAccent),
                        child: Text("Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ));
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.transparent,
        ),
      ),
    );
  }

  deleteAnswer(int index, int i, String id) {
    dataService.deleteAnswer(id: id);

    setState(() {
      quest[index].ans.removeAt(i);
      print(quest[index].ans.length);
    });

  }
}

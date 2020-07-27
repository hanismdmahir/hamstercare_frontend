import 'package:flutter/material.dart';
import 'package:hamstercare/add/add.dart';
import 'package:hamstercare/discussion/discussion.dart';
import 'package:hamstercare/models/reminder.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/reminder/addreminderscreen.dart';
import 'package:hamstercare/services/reminder_services.dart';
import 'package:hamstercare/userProfile/userProfile.dart';
import '../feed/feed.dart';


class ReminderScreen extends StatefulWidget {
  final User user;

  ReminderScreen(this.user);

  @override
  _ReminderScreen createState() => _ReminderScreen();
}

class _ReminderScreen extends State<ReminderScreen> {
  List<Reminder> reminder = new List<Reminder>();
  final dataService = ReminderDataService();
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([dataService.getReminder()]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            widget.user.reminder = [];
            reminder = snapshot.data[0];
            for (var i = 0; i < reminder.length; i++) {
              if(widget.user.username == reminder[i].username){
                widget.user.reminder.add(reminder[i]);
              }
            }

            return Scaffold(
              //to avoid overflow pixel
              resizeToAvoidBottomInset: false,
              body: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.orange[900],
                    //   Colors.orange[800],
                    Colors.orange[400],
                  ])),

                  //should ListView.separated
                  child: ListView(children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Reminder",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ]),
                        ),

                        //kene buat supaya boleh separate based on incoming tarikh
                        ListView.separated(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int indexL) {
                              return Column(
                                children: <Widget>[
                                  
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Dismissible(
                                          // tarik ke kiri untuk delete
                                          key: UniqueKey(),
                                          direction:
                                              DismissDirection.endToStart,
                                          onDismissed: (direction) {
                                            setState(() {
                                              var id = widget.user.reminder[index].id;
                                              widget.user.reminder.removeAt(index);
                                              dataService.deleteReminder(id: id);
                                              
                                            });
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Reminder has been deleted")));
                                          },
                                          background: Container(
                                            color: Colors.green,
                                            child: Align(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    " Done",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              ),
                                              alignment: Alignment.centerRight,
                                            ),
                                          ),
                                          child: buildReminderCard(
                                              index, context) // isi card
                                          );
                                    },
                                    itemCount: widget.user.reminder.length,
                                  )
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int indexL) =>
                                    const Divider(color: Colors.white54),
                            itemCount: 1),
                      ],
                    )
                  ])),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  showDialog(
                          context: context,
                          builder: (context) =>
                              AddReminderScreen(widget.user, "add", 0))
                      .then((addedReminder) {
                    setState(() {
                      widget.user.reminder = addedReminder;
                    });
                  });
                },
                backgroundColor: Colors.white,
                label: Text(
                  'Add',
                  style: TextStyle(color: Colors.orange),
                ),
                icon: Icon(
                  Icons.add,
                  color: Colors.orange,
                ),
              ),
              bottomNavigationBar: buildBottomNavigationBar(context),
            );
          }

          return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 50),
                      Text("Fetching from DB.. "),
                    ],
                  ),
                ),
              );
        });
  }

  Card buildReminderCard(int index, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.user.reminder[index].title),
        subtitle: Text(widget.user.reminder[index].date+
            " : " +
            widget.user.reminder[index].time),
        trailing: Wrap(
          spacing: 12,
          children: <Widget>[
            InkWell(
                onTap: () => showDialog(
                            context: context,
                            builder: (context) =>
                                AddReminderScreen(widget.user, "edit", index))
                        .then((editedReminder) {
                      setState(() {
                        widget.user.reminder = editedReminder;
                      });
                    }),
                child: Icon(IconData(57940, fontFamily: 'MaterialIcons'))),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
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
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FeedNews(widget.user)));
             break;
             case 1:
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DiscussionScreen(widget.user)));
             break;
             case 2:
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AddScreen(widget.user)));
             break;
             case 3:
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ReminderScreen(widget.user),));
             break;
             case 4:
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage(widget.user),));
             break;
          }
        });
  }
}

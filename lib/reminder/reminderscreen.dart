import 'package:flutter/material.dart';
import 'package:hamstercare/models/mock_feed.dart';
import 'package:hamstercare/models/reminder.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/reminder/addreminderscreen.dart';
import 'package:hamstercare/userProfile/userProfile.dart';
import '../feed/feed.dart';
import 'package:hamstercare/models/mock_user.dart';

class ReminderScreen extends StatefulWidget {
  final User user;

  ReminderScreen(this.user);

  @override
  _ReminderScreen createState() => _ReminderScreen();
}
  
class _ReminderScreen extends State<ReminderScreen> {
  
  @override
  Widget build(BuildContext context) {
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
        child:ListView(
          children: <Widget> [
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
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]
                  ),
                ),
                
                //kene buat supaya boleh separate based on incoming tarikh
                ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int indexL) {
                    return Column(
                      children: <Widget>[
                        _buildDay(day:'Today'),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder:  (BuildContext context, int index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                setState(() {
                                  widget.user.reminder.removeAt(index);
                                });
                                Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text("Reminder has been deleted")));
                              },
                              background: Container(
                                color: Colors.red,
                                child: Align(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        " Delete",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
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

                              child: _buildCard(widget.user.reminder[index],index)
                              );

                          },
                          itemCount: widget.user.reminder.length,
                          )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int indexL) => const Divider(color: Colors.white54), 
                  itemCount: 1),
              ],
            )
          ]
        )
        
        
        
        
        
         /*ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Reminder",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Size'dBox(
                      height: 10,
                    ),
                    _buildDay(
                      day: 'Today',
                    ),
                  ],
                ),
              ),
              _buildCard(title: 'Changging Bedding', time: '12pm'),
              _buildCard(title: 'Feed Hamster', time: '1pm'),
              _buildDay(
                day: '11/5/2020',
              ),
              _buildCard(title: 'Meet a doctor', time: '4pm'),
            ],
          )
        ]),*/
      ),
      floatingActionButton: FloatingActionButton.extended(
        
        onPressed: (){
          showDialog(context: context,
          builder:(context)=>AddReminderScreen(widget.user,"add",0))
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
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Column _buildDay({day}) {
    return Column(children: <Widget>[
      Padding(
        child: Text(
          day,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        padding: EdgeInsets.all(15),
      ),
    ]);
  }

  Card _buildCard(Reminder r, int index) {
    return Card(
      child: ListTile(
        title: Text(r.title),
        subtitle: Text(r.time.hour.toString()+ ":" + r.time.minute.toString()),
        trailing: Wrap(
          spacing: 12,
          children: <Widget>[
            InkWell(
              onTap: () => showDialog(context: context,
                            builder:(context)=>AddReminderScreen(widget.user,"edit", index))
                            .then((editedReminder) {
                              setState(() {
                                widget.user.reminder = editedReminder;
                              });
                            }),
              child: Icon(IconData(57940, fontFamily: 'MaterialIcons'))
              ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        //currentIndex: _currentIndex,
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
             case 4:
             Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage(mockUser[0]),));
             break;
          }});
  }
}


import 'package:flutter/material.dart';
import 'package:hamstercare/reminder/addreminderscreen.dart';

class ReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        
        onPressed: (){
          showDialog(context: context,
          builder:(context)=>AddReminderScreen());
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
        padding: EdgeInsets.all(7),
      ),
    ]);
  }

  Card _buildCard({title, time}) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(time),
        trailing: Wrap(
          spacing: 12,
          children: <Widget>[
            Icon(IconData(57940, fontFamily: 'MaterialIcons')),
            Icon(IconData(59506, fontFamily: 'MaterialIcons')),
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
        onTap: null);
  }
}

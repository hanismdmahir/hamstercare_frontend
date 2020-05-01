import 'package:flutter/material.dart';


class AddReminderScreen extends StatefulWidget {
  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 16, left: 16, right: 16),
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  )
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //close button
                    FlatButton(
                        onPressed:() {Navigator.pop(context);},
                        child: Icon(
                          IconData(58829, fontFamily: 'MaterialIcons'),
                        )),
                        SizedBox(width: 5,),
                        Text("New Reminder",style: TextStyle(fontSize: 20),),
                  ],
                ),
                  SizedBox(height: 10,),
                //textfiled task
                TextField(
                  decoration: InputDecoration(
                    hintText: "Remind me about...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                  ),
                ),
                SizedBox(height: 5),
                //Dropdown time
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton<int>(
                        value: 4,
                        items: [
                          DropdownMenuItem(
                            child: Text("9.00 am"),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("3.00 pm"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("6.00 pm"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("9.00 pm"),
                            value: 1,
                          ),
                        ],
                        onChanged: (newValue) {}),
                    SizedBox(width: 60),

                    //Dropdown date
                    DropdownButton<int>(
                        isDense: true,
                        value: 4,
                        items: [
                          DropdownMenuItem(
                            child: Text("11/5/2019"),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("12/5/2019"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("11/5/2019"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("11/5/2019"),
                            value: 1,
                          ),
                        ],
                        onChanged: (newValue) {}),
                  ],
                ),

                //Dropdown repeat
                Container(
                  width: 280,
                  child: DropdownButton<int>(
                      isExpanded: true,
                      value: 2,
                      items: [
                        DropdownMenuItem(
                          child: Text("Repeat"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("No Repeat"),
                          value: 1,
                        ),
                      ],
                      onChanged: (newValue) {}),
                ),
                SizedBox(height: 10),
                //textfield addnotes
                TextField(
                  decoration: InputDecoration(
                    hintText: "Add Notes...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                  ),
                ),

                SizedBox(height: 30),
                //save button
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.orange),
                  child: FlatButton(
                    child: Text("Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    onPressed: null,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hamstercare/models/reminder.dart';
import 'package:hamstercare/models/user.dart';


class AddReminderScreen extends StatefulWidget {
  final User user;

  AddReminderScreen(this.user);

  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time=TimeOfDay.now();
  }

  final _title = TextEditingController();
  final _note = TextEditingController();
  bool repeat = false;

  _pickDate() async{
     final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime.now().add( Duration(days: 1825)),
      );  

      if(picked != null)
      setState(() {
        pickedDate = picked;
      });
  }

  _pickTime() async {
   TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time
    );
    if(t != null)
      setState(() {
        time = t;
      });
  }

  void _addReminder(String title, DateTime date, TimeOfDay time, String note, bool repeat){
    setState(() {
      User _user = User.copy(widget.user);
      _user.reminder.add(Reminder(date:date , time: time ,note:note ,title: title ,repeated: repeat));
      widget.user.reminder = _user.reminder;
    });

  }

  @override
  Widget build(BuildContext context) {
     
    return SingleChildScrollView(
      
          child: Dialog(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(top: 30),
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
                      controller: _title,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Card(
                          elevation: 0,
                          child: Row(
                            children: <Widget> [
                              Text("${time.hour}:${time.minute}"),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: ()=> _pickTime(),
                                )
                            ]
                          ),
                        ),
                        
                        /*DropdownButton<int>(
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
                        SizedBox(width: 60),*/

                        //Dropdown date

                        Card(
                          elevation: 0,
                          child: Row(
                            children: <Widget> [
                              Text("${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: () => _pickDate(),
                                )
                            ]
                          ),
                        ),
                        /*DropdownButton<int>(
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
                            onChanged: (newValue) {}),*/
                      ],
                    ),

                    //Dropdown repeat
                    Container(
                      width: 280,
                      child: DropdownButton<bool>(
                          isExpanded: true,
                          value: repeat,
                          items: [
                            DropdownMenuItem(
                              child: Text("No Repeat"),
                              value: false,
                            ),
                            DropdownMenuItem(
                              child: Text("Repeat"),
                              value: true,
                            ),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              repeat=newValue;
                            });
                          }),
                    ),
                    SizedBox(height: 10),
                    //textfield addnotes
                    TextField(
                      controller: _note,
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
                        onPressed: () {
                          _addReminder(_title.toString(), pickedDate, time, _note.toString(), repeat);
                            
                          Navigator.of(context).pop(widget.user.reminder);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

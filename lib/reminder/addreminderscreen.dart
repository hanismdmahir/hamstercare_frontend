import 'package:flutter/material.dart';
import 'package:hamstercare/models/reminder.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/services/reminder_services.dart';


class AddReminderScreen extends StatefulWidget {
  final User user;
  final String type;
  final int indx;

  AddReminderScreen(this.user,this.type,this.indx);

  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  List<Reminder> reminder;
  final dataService = ReminderDataService();
  DateTime pickedDate;
  TimeOfDay time;
  final _title = TextEditingController();
  final _note = TextEditingController();
  bool repeat = false;
  
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time=TimeOfDay.now();
    if(widget.type == "edit"){
      _title.text = widget.user.reminder[widget.indx].title;
      _note.text = widget.user.reminder[widget.indx].note;
      pickedDate = DateTime.parse(widget.user.reminder[widget.indx].date) ;
      time=  TimeOfDay(hour:int.parse(widget.user.reminder[widget.indx].time.split(":")[0]),minute: int.parse(widget.user.reminder[widget.indx].time.split(":")[1])) ;
    }
  }
  

  

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

  void _addReminder(String title, String date, String time, String note, bool repeat){
    setState(() {
      date = date.substring(0,10);
      time = time.substring(10,15);
      dataService.createReminder(date,time,title,note,repeat,widget.user.username);
      //User _user = User.copy(widget.user);
      //_user.reminder.add(Reminder(date:date , time: time ,note:note ,title: title ,repeated: repeat));
      //= _user.reminder;
      widget.user.reminder.add(Reminder(date:date , time: time ,note:note ,title: title ,repeated: repeat, username:widget.user.username));
    });

  }

  _pickEditDate(DateTime pick) async{
     final DateTime picked = await showDatePicker(
      context: context,
      initialDate: pick,
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime.now().add( Duration(days: 1825)),
      );  

      if(picked != null)
      setState(() {
        pickedDate = picked;
      });
  }

  _pickEditTime(TimeOfDay rtime) async {
   TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: rtime
    );
    if(t != null)
      setState(() {
        time = t;
      });
  }

  void _editReminder(int index,String title, String date, String time, String note, bool repeat){
    setState(() {
      Reminder r = Reminder.copy(widget.user.reminder[index]);
      
      r.title = title;
      r.date = date.substring(0,10);
      r.time = time.substring(10,15);
      r.note = note;
      r.repeated = repeat;
      r.username = widget.user.username;

      dataService.updateReminder(id: widget.user.reminder[index].id, q: r);

      print(widget.user.reminder[index]);
      widget.user.reminder.removeAt(index);
      widget.user.reminder.insert(index, r);
      print(widget.user.reminder[index]);
    });

  }

  @override
  Widget build(BuildContext context) {
     
  if(widget.type == "add")
  {
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
                            onPressed:() {Navigator.pop(context, widget.user);},
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
                          _addReminder(_title.text, pickedDate.toString(), time.toString(), _note.text, repeat);
                            
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

  else{
    bool repeatEdit = widget.user.reminder[widget.indx].repeated;

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
                            onPressed:() {Navigator.pop(context, widget.user);},
                            child: Icon(
                              IconData(58829, fontFamily: 'MaterialIcons'),
                            )),
                            SizedBox(width: 5,),
                        Text("Edit Reminder",style: TextStyle(fontSize: 20),),
                            
                      ],
                    ),
                      SizedBox(height: 10,),
                    //textfiled task
                    TextField(
                      controller: _title,
                      decoration: InputDecoration(
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
                                onPressed: ()=> _pickEditTime(TimeOfDay(hour:int.parse(widget.user.reminder[widget.indx].time.split(":")[0]),minute: int.parse(widget.user.reminder[widget.indx].time.split(":")[1]))),
                                )
                            ]
                          ),
                        ),
                        
                        //Dropdown date

                        Card(
                          elevation: 0,
                          child: Row(
                            children: <Widget> [
                              Text("${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: () => _pickEditDate(pickedDate),
                                )
                            ]
                          ),
                        ),
                        
                      ],
                    ),

                    //Dropdown repeat
                    Container(
                      width: 280,
                      child: DropdownButton<bool>(
                          isExpanded: true,
                          value: repeatEdit,
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
                              repeatEdit=newValue;
                            });
                          }),
                    ),
                    SizedBox(height: 10),
                    //textfield addnotes
                    TextField(
                      controller: _note,
                      decoration: InputDecoration(
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
                          _editReminder(widget.indx,_title.text, pickedDate.toString(), time.toString(), _note.text, repeatEdit);
                            
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
    
}
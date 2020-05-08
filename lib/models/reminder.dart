import 'package:flutter/material.dart';

class Reminder {
  DateTime date;
  TimeOfDay time;
  String title;
  String note;
  bool repeated;

  Reminder({this.date,this.time,this.title,this.note,this.repeated});

  set setDate(DateTime d)
  {
    date = d;
  }

  set setTime(TimeOfDay t)
  {
    time=t;
  }

  set setTitle(String t)
  {
    title = t;
  }

  set setNote(String n)
  {
    note=n;
  }

  set setRepeat(bool r)
  {
    repeated=r;
  }

  Reminder.copy(Reminder from) : this(
    date: from.date,
    time: from.time,
    title: from.title,
    note: from.note,
    repeated: from.repeated
  );


}
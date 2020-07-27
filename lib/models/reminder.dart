

class Reminder {
  String  date;
  String time;
  String title;
  String note;
  bool repeated;
  String id;
  String username;

  Reminder({this.date,this.time,this.title,this.note,this.repeated, this.id,this.username});

  set setDate(String d)
  {
    date = d;
  }

  set setTime(String t)
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

 Reminder.fromJson(Map<String, dynamic> json)
 : this(
   id: json['id'],
   date: json['date'],
   time: json['time'],
   title: json['title'],
   note: json['note'],
   repeated: json['repeated'],
   username: json['username']
  );

  Map<String, dynamic> toJson() => {
  'date': date,
   'time': time,
   'title': title,
   'note': note,
   'repeated': repeated,
   'username' : username
  };
}
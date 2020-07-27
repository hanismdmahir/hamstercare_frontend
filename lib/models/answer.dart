class Answer{
  String id;
  String qid;
  String answer;
  String username;

  Answer({this.id, this.qid, this.answer, this.username});

  Answer.fromJson(Map<String, dynamic> json)
  : this(
    id: json['id'],
    qid: json['qid'],
    answer: json['answer'],
    username: json['username']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'qid': qid,
    'answer': answer,
    'username': username
  };
}
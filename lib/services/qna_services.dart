import 'package:hamstercare/models/answer.dart';
import 'package:hamstercare/models/question.dart';

import 'rest_services.dart';

class QnADataService {
  static final QnADataService _instance = QnADataService._constructor();
  factory QnADataService() {
    return _instance;
  }

  QnADataService._constructor();
  final rest = RestService();

  Future<List<Question>> getQuestion() async {
    final listJson = await rest.get('question');

    return (listJson as List)
        .map((itemJson) => Question.fromJson(itemJson))
        .toList();
  }

  Future<List<Answer>> getAnswer() async {
    final listJson = await rest.get('answer');

    return (listJson as List)
        .map((itemJson) => Answer.fromJson(itemJson))
        .toList();
  }

  Future<Question> createQuestion(String title, String desc, String username) async {
    final json = await rest.post('question',
        data: {'title': title, 'desc': desc, 'username': username, });
    return Question.fromJson(json);
  }

  Future<Answer> createAnswer(String qid, String answer, String username) async {
    final json = await rest.post('answer',
        data: {'qid': qid, 'answer': answer, 'username': username});
    return Answer.fromJson(json);
  }

  Future<Question> getQuestionbyId({String id}) async {
    final json = await rest.get('question/$id');
    return Question.fromJson(json);
  }

  Future<Answer> getAnswerbyId({String id}) async {
    final json = await rest.get('answer/$id');
    return Answer.fromJson(json);
  }

  Future<Question> updateQuestion({String id, Question q}) async {
    final json = await rest.patch('question/$id', data: q);
    return Question.fromJson(json);
  }

  Future<Answer> updateAnswer({String id, Answer a}) async {
    final json = await rest.patch('answer/$id', data: a);
    return Answer.fromJson(json);
  }

  void deleteAnswer({String id}) async {
    await rest.delete('answer/$id');
  }

  void deleteQuestion({String id}) async {
    await rest.delete('question/$id');
  }
} 

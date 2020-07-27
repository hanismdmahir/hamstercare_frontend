import 'package:hamstercare/models/reminder.dart';

import 'rest_services.dart';

class ReminderDataService {
  static final ReminderDataService _instance = ReminderDataService._constructor();
  factory ReminderDataService() {
    return _instance;
  }

  ReminderDataService._constructor();
  final rest = RestService();

  Future<List<Reminder>> getReminder() async {
    final listJson = await rest.get('reminder');

    return (listJson as List)
        .map((itemJson) => Reminder.fromJson(itemJson))
        .toList();
  }

  Future<Reminder> createReminder(String date, String time, String title, String note, bool repeated, String username) async {
    final json = await rest.post('reminder',
        data: {'date':date, 'time': time, 'title':title,'note': note,'repeated':repeated, 'username':username});
    return Reminder.fromJson(json);
  }

  Future<Reminder> getReminderbyId({String id}) async {
    final json = await rest.get('reminder/$id');
    return Reminder.fromJson(json);
  }

  Future<Reminder> updateReminder({String id, Reminder q}) async {
    final json = await rest.patch('reminder/$id', data: q);
    return Reminder.fromJson(json);
  }

  Future deleteReminder({String id}) async {
    await rest.delete('reminder/$id');
  }

} 

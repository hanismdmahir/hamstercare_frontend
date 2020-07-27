import 'package:hamstercare/models/gallery.dart';

import '../models/gallery.dart';
import 'rest_services.dart';

class FeedbackDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final FeedbackDataService _instance =
      FeedbackDataService._constructor();
  factory FeedbackDataService() {
    return _instance;
  }

  FeedbackDataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.

  Future<List<Gallery>> getGallery() async {
    final listJson = await rest.get('gallery');

    return (listJson as List)
        .map((itemJson) => Gallery.fromJson(itemJson))
        .toList();
  }

  Future<Gallery> createGallery(
      {String userName,
      String userImage,
      String feedImage,
      String feedTime,
      String feedText,
      int like}) async {
    final json = await rest.post('gallery', data: {
      'userName': userName,
      'userImage': userImage,
      'feedImage': feedImage,
      'feedTime': feedTime,
      'feedText': feedText,
      'like': like
    });
    return Gallery.fromJson(json);
  }

  void deleteGallery({String id}) async {
    await rest.delete('gallery/$id');
  }
}

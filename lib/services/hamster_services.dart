import '../models/hamster.dart';
import 'rest_services.dart';

// UserDataService is a wrapper class implmenting calls for CRUD operations on Quote endpoints.
//  The class is implemented using the Singleton design pattern.


// Example: get the list of quotes, get a quote for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git

class HamsterDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final HamsterDataService _instance = HamsterDataService._constructor();
  factory HamsterDataService() {
    return _instance;
  }

  HamsterDataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.

  Future<List<Hamster>> getAllHamster() async {
    final listJson = await rest.get('hamster');

    return (listJson as List)
        .map((itemJson) => Hamster.fromJson(itemJson))
        .toList();
  }

  Future<Hamster> createHamster({String name, String photo, String gender, String bod, String color, String desc, String breed, String ni,String username} ) async {
    final json = await rest.post('hamster',
        data: {'name': name, 'photo': photo, 'gender': gender, 'bod': bod,
                'color': color, 'desc': desc, 'breed': breed,'ni': ni,
                'username': username});
    return Hamster.fromJson(json);
  }

  Future<Hamster> editHamster({String id, String name, String photo, String gender, String bod, String color, String desc, String breed, String ni,String username} ) async {
    final json = await rest.patch('hamster/$id',
        data: {'name': name, 'photo': photo, 'gender': gender, 'bod': bod,
                'color': color, 'desc': desc, 'breed': breed,'ni': ni,
                'username': username});
    return Hamster.fromJson(json);
  }

  void deleteHamster({String id}) async {
    await rest.delete('hamster/$id');
  }
 
}
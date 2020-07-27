import '../models/user.dart';
import 'rest_services.dart';

// UserDataService is a wrapper class implmenting calls for CRUD operations on Quote endpoints.
//  The class is implemented using the Singleton design pattern.

// : Modify this class accordingly. You want to add all CRUD operations that your app uses.
// Example: get the list of quotes, get a quote for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git

class UserDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final UserDataService _instance = UserDataService._constructor();
  factory UserDataService() {
    return _instance;
  }

  UserDataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.

  Future<List<User>> getAllUser() async {
    final listJson = await rest.get('user');

    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  // You may not need this REST call in your app. It is only for example here.
  Future<User> createUser(
      {String username, String email, String password}) async {
    final json = await rest.post('user', data: {
      'username': username,
      'email': email,
      'password': password,
      'follower': 0,
      'following': 0,
      'post': 0,
      'bio': '',
      'profilephoto': ''
    });
    return User.fromJson(json);
  }

  Future<User> newName({String id, User name}) async {
    final json =
        await rest.patch('user/$id', data: {"username": name.username});
    return User.fromJson(json);
  }

  Future<User> newPass({String id, User pass}) async {
    final json =
        await rest.patch('user/$id', data: {"password": pass.password});
    return User.fromJson(json);
  }

  Future<User> newBio({String id, User bio}) async {
    final json = await rest.patch('user/$id', data: {"bio": bio.bio});
    return User.fromJson(json);
  }

  Future<User> newEmail({String id, User email}) async {
    final json = await rest.patch('user/$id', data: {"email": email.email});
    return User.fromJson(json);
  }
}

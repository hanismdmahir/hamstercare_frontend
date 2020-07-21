import '../models/user.dart';
import 'rest_services.dart';

// UserDataService is a wrapper class implmenting calls for CRUD operations on Quote endpoints.
//  The class is implemented using the Singleton design pattern.

// TODO: Modify this class accordingly. You want to add all CRUD operations that your app uses.
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
  Future<User> createUser({User username, User email, User password}) async {
    final json = await rest.post('user',
        data: {'username': username, 'email': email, 'password': password});
    return User.fromJson(json);
  }

  // TODO: You may need to provide the REST calls for the followings:
  //        Get a quote for a given id
  Future<User> getQuote({String id, User username}) async {
    final json = await rest.get('user/$id');
    return User.fromJson(json);
  }

  //        Update a quote for a given id
  Future<User> updateQuote({String id, User quote}) async {
    final json = await rest.patch('user/$id', data: quote);
    return User.fromJson(json);
  }
} // class Quote

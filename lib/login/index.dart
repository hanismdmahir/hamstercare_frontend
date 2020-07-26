import 'package:flutter/material.dart';
import 'package:hamstercare/feed/feed.dart';
import 'package:hamstercare/login/signup.dart';
//import 'package:hamstercare/models/mock_feed.dart';
//import 'package:hamstercare/models/mock_user.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/services/auth_services.dart';
//import 'package:hamstercare/userProfile/userProfile.dart';

class LoginPage extends StatefulWidget {
  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();

  // List<User> alluser;

  // LoginPage(this.alluser);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String get username => LoginPage._user.text;
  List<User> alluser;
  User user;

  String get password => LoginPage._pass.text;
  final dataService = UserDataService();
  bool login = false;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: dataService.getAllUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          alluser = snapshot.data;
          return _buildScaffold(context);
        }
        //  return _buildScaffold(context);
        return _buildFetchingDataScreen();
      },
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSizedBox(),
              _buildPadding(),
              SizedBox(
                height: 20,
              ),
              _buildExpanded(context),
            ],
          ),
        ));
  }

  Expanded _buildExpanded(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                //  SizedBox(height:10 ,), //60
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(255, 95, 27, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextField(
                          controller: LoginPage._user,
                          decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextField(
                          controller: LoginPage._pass,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey[100]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Center(
                      //tukar route kemana perlu pergi
                      child: FlatButton(
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            for (var i = 0; i < alluser.length; i++) {
                              if (username == alluser[i].username &&
                                  password == alluser[i].password) {
                                user = alluser[i];
                                login = true;
                                LoginPage._user.clear();
                                LoginPage._pass.clear();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FeedNews(user),

                                      // _showSnackBar
                                    ));
                              }
                            }
                            if (login == false) {
                              scaffoldKey.currentState.showSnackBar(new SnackBar(
                                  content: new Text(
                                      "Your Username or Password Are Wrong!")));
                            }
                          })),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  child: Text("Don't have a account? Sign Up here",
                      style: TextStyle(color: Colors.black87)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                )
              ],
            ),
          )),
    );
  }

  Padding _buildPadding() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Welcome Back",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }

  SizedBox _buildSizedBox() {
    return SizedBox(
      height: 60,
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
      Colors.orange[900],
      Colors.orange[800],
      Colors.orange[400] //ni kalau nak orange cair kat bawah
    ]));
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching Data... Please wait'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hamstercare/services/auth_services.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          resizeToAvoidBottomInset: false, //bottom overflow
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],
            ])),
            child: _ListTextField(),
          )),
    );
  }
}

class _ListTextField extends StatefulWidget {
  const _ListTextField({
    Key key,
  }) : super(key: key);
  static final TextEditingController _username = new TextEditingController();
  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();
  @override
  __ListTextFieldState createState() => __ListTextFieldState();
}

class __ListTextFieldState extends State<_ListTextField> {
  String get username => _ListTextField._username.text;
  String get email => _ListTextField._email.text;

  String get password => _ListTextField._pass.text;
  final dataService = UserDataService();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          ),
        ),
        //username
        Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(255, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: TextField(
                      controller: _ListTextField._username,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                //email
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(255, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: TextField(
                      controller: _ListTextField._email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                //password
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(255, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: TextField(
                      controller: _ListTextField._pass,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                    )),
                SizedBox(
                  height: 20,
                ),
                //confirm password
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(255, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                    )),
                SizedBox(
                  height: 50,
                ),

                //sign up button
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black87),
                  child: FlatButton(
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    onPressed: null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // link to login
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Already have account?",
                      style: TextStyle(color: Colors.grey[100]),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}

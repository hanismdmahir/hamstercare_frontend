import 'package:flutter/material.dart';
import 'package:hamstercare/feed/feed.dart';
import 'package:hamstercare/login/signup.dart';
import 'package:hamstercare/models/mock_user.dart';
import 'package:hamstercare/reminder/addreminderscreen.dart';
import 'package:hamstercare/reminder/reminderscreen.dart';
import 'package:hamstercare/testing.dart';
import 'package:hamstercare/userProfile/userProfile.dart';
import 'login/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'HamsterCare',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      //home: ProfilePage(mockUser[0]),
      //home: SignUp(),
      //home: FeedNews(),
      //home: ReminderScreen(mockUser[0]),
      //home: ReminderScreen(),
      //home: AddReminderScreen(),
      routes: <String, WidgetBuilder>{
      '/LoginPage': (BuildContext context) => new LoginPage(mockUser),
      },
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(mockUser),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       body: Container(
         child: Center(
           child: Image.asset("assets/splash.gif", 
            gaplessPlayback: true, 
            fit: BoxFit.fill),
         ),
       ), 
    );
  }
}

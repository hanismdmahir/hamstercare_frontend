import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HamsterCare',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
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
            builder: (context) => HomePage(),
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
import 'package:flutter/material.dart';
//void main() => runApp(MyApp());


 void main() => runApp(
   MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Setting(),
  )
 );
class Setting extends StatelessWidget {

  void _goHome(){
    print('go home');
  }
    void _logout(){
    print('log out');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("Setting"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: (){_goHome();}),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){_logout();}),

          ],
        ),
        body: Text('me'),
      ),
        
      );
    
  }
}


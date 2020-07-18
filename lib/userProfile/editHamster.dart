//biodata hamster
import 'package:flutter/material.dart';

class HamsterBiodata extends StatefulWidget {

  @override
  _HamsterBiodataState createState() => _HamsterBiodataState();
}

class _HamsterBiodataState extends State<HamsterBiodata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: editProfile(),
    );
  }

  Center editProfile() {
  return Center(
    child: Card(
      child: ListView(
        children: <Widget>[
          Divider(),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 150,
              width: 150,
          ),),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('Hachi'),
          ),
          ListTile(
            leading: Icon(Icons.gesture),
            title: Text('Male'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('5 March 2019'),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Roborovski Hamster White Face'),
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('White Brown'),
          ),
          ListTile(
            title: Text('Hachi is the alpha. My first ever hamster'),
          ),
          Center(
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () {},
              child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
           ), ),),)
        ],
      ),
    ),
  );
}

}


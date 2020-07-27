//biodata hamster
import 'package:flutter/material.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/services/hamster_services.dart';
import 'package:hamstercare/userProfile/userProfile.dart';

class HamsterBiodata extends StatefulWidget {
  final User user;
  final int indexHam;
  HamsterBiodata(this.user,this.indexHam);

  @override
  _HamsterBiodataState createState() => _HamsterBiodataState();
}

class _HamsterBiodataState extends State<HamsterBiodata> {
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _gender = new TextEditingController();
  final TextEditingController _bod = new TextEditingController();
  final TextEditingController _ni = new TextEditingController();
  final TextEditingController _color = new TextEditingController();
  final TextEditingController _breed = new TextEditingController();
  final TextEditingController _desc = new TextEditingController();

  String get name  => _name.text;
  String get gender  => _gender.text;
  String get bod  => _bod.text;
  String get ni  => _ni.text;
  String get color  => _color.text;
  String get breed  => _breed.text;
  String get desc  => _desc.text;
  String get username => widget.user.username;
  String get photo => widget.user.pet[widget.indexHam].photo;
  String get id => widget.user.pet[widget.indexHam].id;

  final dataService = HamsterDataService();

  @override
  void initState() {
    super.initState();
    _name.text = widget.user.pet[widget.indexHam].name;
    _gender.text = widget.user.pet[widget.indexHam].gender;
    _bod.text = widget.user.pet[widget.indexHam].bod;
    _ni.text = widget.user.pet[widget.indexHam].ni;
    _color.text = widget.user.pet[widget.indexHam].color;
    _breed.text = widget.user.pet[widget.indexHam].breed;
    _desc.text = widget.user.pet[widget.indexHam].desc;
  }

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
                image: DecorationImage(
                  image: AssetImage(widget.user.pet[widget.indexHam].photo),
                  fit:BoxFit.cover,
                  ) ,
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
            title: TextField(
              controller: _name,
            ),
          ),
          ListTile(
            leading: Icon(Icons.gesture),
            title: TextField(
              controller: _breed,
            ),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: TextField(
              controller: _bod,
            ),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: TextField(
              controller: _gender,
            ),
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: TextField(
              controller: _color,
            ),
          ),
          ListTile(
            title: TextField(
              controller: _desc,
            ),
          ),
          Center(
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () async{
                await dataService.editHamster(
                name: name, photo: photo, gender: gender, bod: bod,
                color: color, desc: desc, breed: breed, ni: ni,
                username: username, id:id
              );

              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage(widget.user)));
            },
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


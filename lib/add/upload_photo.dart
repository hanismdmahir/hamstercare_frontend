import 'package:flutter/material.dart';
import 'package:hamstercare/models/gallery.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/services/feedback_service.dart';

class UploadPhoto extends StatefulWidget {
  final User user;
  UploadPhoto(this.user);

  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  final TextEditingController _controller = TextEditingController();
  final dataService = FeedbackDataService();
  //final dataService = FeedbackDataService();
  Gallery theFeed;
  Color _color = Colors.white;
  Color _text = Colors.orange;

  //final TextEditingController _controller;
  //final FeedbackDataService dataService;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Center(
            child: Container(
              child: Center(
                child: RaisedButton(
                  onPressed: () {},
                  child: Icon(Icons.add_a_photo),
                  color: Colors.white,
                ),
              ),
              height: 250,
              width: 250,
              margin: EdgeInsets.only(top: 20, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  //color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                //focusColor: Colors.blue,
                color: _color,
                onPressed: () {
                  setState(() {
                    _color = Colors.orange;
                    _text = Colors.white;
                  });
                },
                child: Text(
                  'Hachi',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: _text,
                  ),
                ),
              ),
              RaisedButton(
                color: _color,
                onPressed: () {
                  setState(() {
                    _color = Colors.orange;
                    _text = Colors.white;
                  });
                },
                child: Text(
                  'Horlick',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: _text,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(40),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 60),
                border: OutlineInputBorder(),
                labelText: widget.user.username,
              ),
            ),
          ),
          Center(
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () async {
                theFeed = await dataService.createGallery(
                  userName: widget.user.username,
                  userImage: widget.user.profilephoto,
                  feedImage: widget.user.profilephoto,
                  feedTime: DateTime.now().toString(),
                  feedText: _controller.text,
                  like: 5,
                );
              },
              child: Text(
                'Share',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

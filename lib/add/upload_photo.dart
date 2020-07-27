import 'package:flutter/material.dart';
import 'package:hamstercare/add/choose_photo.dart';
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
  void _navigate(index) async {
    final returnData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Choose(),
      ),
    );

    if (returnData != null) {
      setState(() => photo = returnData);
    }
  }

  final TextEditingController _controller = TextEditingController();
  final dataService = FeedbackDataService();
  Gallery theFeed;
  String photo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Center(
            child: Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      _navigate(context);
                    },
                    icon: Icon(
                      Icons.photo_library,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
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
                  feedImage: photo,
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

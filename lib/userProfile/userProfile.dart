import 'package:flutter/material.dart';
import 'package:hamstercare/add/add.dart';
import 'package:hamstercare/discussion/discussion.dart';
import 'package:hamstercare/feed/feed.dart';
import 'package:hamstercare/login/index.dart';
import 'package:hamstercare/models/gallery.dart';
import 'package:hamstercare/models/hamster.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/reminder/reminderscreen.dart';
import 'package:hamstercare/services/feedback_service.dart';
import 'package:hamstercare/services/hamster_services.dart';
import 'package:hamstercare/userProfile/editHamster.dart';

import '../setting/setting.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage(this.user);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<Hamster> hamster = List<Hamster>();
  List<Gallery> gallery = List<Gallery>();
  final dataService1 = HamsterDataService();
  final dataService2 = FeedbackDataService();

 

  void _deleteImage(int index) {
    dataService2.deleteGallery(id: widget.user.photoUrl[index].id);
    setState(() {
      widget.user.photoUrl.removeAt(index);
    });
  }

  void _deletePet(int index) {
    dataService1.deleteHamster(id:widget.user.pet[index].id);
    setState(() {
      widget.user.pet.removeAt(index);
    });
  }

  int _currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: Future.wait([dataService1.getAllHamster(), dataService2.getGallery()]),
      builder: (context,snapshot) {
        if(snapshot.hasData){
          hamster = snapshot.data[0];
          gallery = snapshot.data[1];

          widget.user.pet = [];
          widget.user.photoUrl = [];

          for (var i = 0; i < hamster.length ; i++) {
            if(hamster[i].username == widget.user.username)
            {
              Hamster ham =hamster[i];
              widget.user.pet.add(ham);

            }
            
          }

          for (var i = 0; i < gallery.length; i++) {
            if(gallery[i].userName == widget.user.username)
            {
              
              Gallery gal = gallery[i];
              widget.user.photoUrl.add(gal);
            }
          }

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: buildListView(),
            bottomNavigationBar: buildBottomNavigationBar(),
            endDrawer: Setting(widget.user),
          );
        
        }

        else{
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 50),
                  Text('Fetching from DB... Please wait'),
                ],
              ),
            ),
          );
        }
      },
      );
    
    
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      leading: Icon(Icons.announcement),
      title: Row(
        children: <Widget>[
          Text('HamsterCare'),
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView(children: <Widget>[
      // profile pic n else
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            buildProfileInfo(),

            SizedBox(
              height: 10,
            ),

            buildProfileBio(), //bio

            SizedBox(
              height: 20,
            ),

            buildPetAvatar(), //pet avatar

            SizedBox(
              height: 10,
            ),

            Divider(
              thickness: 1,
            ),

            SizedBox(
              height: 5,
            ),

            buildGallery() //gallery
          ])),
    ]);
  }

  SizedBox buildPetAvatar() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.user.pet.length,
          itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(10),
                child: InkWell(
                  onLongPress: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Remove Pet ?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop(null);
                              },
                            ),
                            FlatButton(
                                child: Text('Remove'),
                                onPressed: () {
                                  _deletePet(index);
                                  Navigator.of(context).pop(widget.user);
                                }),
                          ],
                        );
                      }),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HamsterBiodata(widget.user, index))),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey,
                        backgroundImage:(widget.user.pet[index].photo != null)?
                        AssetImage(widget.user.pet[index].photo) : AssetImage('assets/pic3.jpg'),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(widget.user.pet[index].name)
                    ],
                  ),
                ),
              )),
    );
  }

  GridView buildGallery() {
    return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widget.user.photoUrl.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => InkWell(
              onLongPress: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Do you want to delete it ?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop(null);
                          },
                        ),
                        FlatButton(
                            child: Text('Delete'),
                            onPressed: () {
                              _deleteImage(index);
                              Navigator.of(context).pop(widget.user);
                            }),
                      ],
                    );
                  }),
              child: Container(
                margin: EdgeInsets.all(2.0),
                color: Colors.black,
                child: Image.asset(widget.user.photoUrl[index].feedImage,
                    width: 100, height: 100, fit: BoxFit.cover),
              ),
            ));
  }

  Row buildProfileBio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.user.bio),
          ],
        ),
      ],
    );
  }

  Row buildProfileInfo() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 50.0,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(widget.user.profilephoto),
        ),
        Expanded(
            flex: 1,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.user.photoUrl.length.toString(),
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Post',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.user.follower.toString(),
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Follower',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.user.following.toString(),
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Following',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]))
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('QnA'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            title: Text('Reminder'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FeedNews(widget.user)));
             break;
             case 1:
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DiscussionScreen(widget.user)));
             break;
             case 2:
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AddScreen(widget.user)));
             break;
             case 3:
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ReminderScreen(widget.user),));
             break;
             case 4:
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage(widget.user),));
             break;
          }
          setState(() {
            _currentIndex = index;
          });
        });
  }
}

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({this.title, this.description, this.buttonText, this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(
                image: AssetImage('assets/pic3.jpg'),
                height: 150,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: Text("Confirm"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

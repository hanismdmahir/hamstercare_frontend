import 'package:flutter/material.dart';
import 'package:hamstercare/login/index.dart';
import 'package:hamstercare/models/mock_user.dart';
import 'package:hamstercare/models/user.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage(this.user);
  
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _bio = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _bio.dispose();
    _username.dispose();
    super.dispose();
  }

  void _bioState(String bio){
    User _user = User.copy(widget.user);
    _user.bio = bio;
    widget.user.bio = _user.bio;
  }

  void _usernameState(String username){
    User _user = User.copy(widget.user);
    _user.username = username;
    widget.user.username = _user.username;
  }

  void _passwordState(String password){
    User _user = User.copy(widget.user);
    _user.password = password;
    widget.user.password = _user.password;
  }

  void _emailState(String email){
    User _user = User.copy(widget.user);
    _user.email = email;
    widget.user.email = _user.email;
  }

  int _currentIndex = 4;
  bool _noti = false;
  get noti => _noti;
  set noti(value) => setState(() => _noti = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildListView(),
      bottomNavigationBar: buildBottomNavigationBar(),
      endDrawer: buildEndDrawer(),
    );
  }

   Drawer buildEndDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(widget.user.profilephoto),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      widget.user.username,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //profile picture
          ListTile(
            leading: Icon(Icons.photo_camera),
            title: Text('Profile Picture'),
            trailing: Icon(Icons.edit),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Profile Picture"),
                      content: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.photo_camera,
                                size: 26,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.photo_library,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Upload'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    );
                  });
            },
          ),
          Divider(),
          //bio
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Bio'),
            trailing: Icon(Icons.edit),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("New Bio"),
                      content: TextField(
                        controller: _bio ,
                        maxLength: 50,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: widget.user.bio,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
                          onPressed: () {
                            _bioState(_bio.text);
                            _bio.clear();
                            Navigator.of(context).pop(widget.user.bio);
                          },
                        ),
                        FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              _bio.clear();
                              Navigator.of(context).pop(null);
                            }),
                      ],
                    );
                  });
            },
          ),
          Divider(),
          //username
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Username'),
            trailing: Icon(Icons.edit),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("New Username"),
                      content: TextField(
                        controller: _username,
                        maxLength: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: widget.user.username,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
                          onPressed: () {
                            _usernameState(_username.text);
                            _username.clear();
                            Navigator.of(context).pop(widget.user.username);
                          },
                        ),
                        FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              _username.clear();
                              Navigator.of(context).pop(null);
                            }),
                      ],
                    );
                  });
            },
          ),
          Divider(),
          //password
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Password'),
            trailing: Icon(Icons.edit),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("New Password"),
                      content: TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: widget.user.password,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
                          onPressed: () {
                            _passwordState(_password.text);
                            _password.clear();
                            Navigator.of(context).pop(widget.user.password);
                          },
                        ),
                        FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              _password.clear();
                              Navigator.of(context).pop(null);
                            }),
                      ],
                    );
                  });
            },
          ),
          Divider(),
          //email
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Email'),
            trailing: Icon(Icons.edit),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("New Email"),
                      content: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: widget.user.email,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
                          onPressed: () {
                            _emailState(_email.text);
                            _email.clear();
                            Navigator.of(context).pop(widget.user.email);
                          },
                        ),
                        FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              _email.clear();
                              Navigator.of(context).pop(null);
                            }),
                      ],
                    );
                  });
            },
          ),
          Divider(),
          //notification
          SwitchListTile(
            activeColor: Colors.orange,
            value: noti,
            onChanged: (value) => noti = value,
            title: Text('Notification'),
            secondary: Icon(Icons.notifications_active),
          ),
          Divider(),
          //logout button
          Container(
            width: 100.0,
            height: 40.0,
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () {
                 showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                          title: "Are You Sure Want To Logout?",
                         
                        ));

              },
              child: Text(
                'Logout',
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
              itemCount: widget.user.pet.length+1,
              itemBuilder: (context,index) => Container(
                margin: EdgeInsets.all(10),
                child: (index == 0) 
                ? GestureDetector(
                  onTap: null,
                  child: Column(
                    children: <Widget>[
                      Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 3, color: Colors.black)),
                            child: Icon(
                              Icons.add,
                              size: 56,
                              color: Colors.black,
                            ),
                          ),
                      SizedBox(height: 5,),
                      Text("Add")
                    ],
                  ),
            )
                  
                : Column(
                  children: <Widget>[
                    CircleAvatar(
                            
                            radius: 30.0,
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage(widget.user.pet[index-1].photo),
                          ),
                    SizedBox(height: 6,),
                    Text(widget.user.pet[index-1].name)    
                  ],
                ),
              )
              ),
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
               itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(2.0),
                  color: Colors.black,
                  child: Image.asset(widget.user.photoUrl[index].photoUrl, width: 100, height: 100, fit: BoxFit.cover),
               )                
              );
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
                            widget.user.postNo.toString(),
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
                              builder: (context) => LoginPage(mockUser),
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

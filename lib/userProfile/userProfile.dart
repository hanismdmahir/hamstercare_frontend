import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                      backgroundImage: AssetImage('assets/photo4.jpg'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'user999',
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
                      title: Text("Bio"),
                      content: TextField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'New Bio',
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
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
                      title: Text("Username"),
                      content: TextField(
                        maxLength: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'New Username',
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
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
                      title: Text("Password"),
                      content: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'New Password',
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
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
                      title: Text("Email"),
                      content: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'New Email',
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
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
              onPressed: () {},
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
        mainAxisAlignment: MainAxisAlignment.center,
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
          child: Column(children: <Widget>[
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

            buildGallery(), //gallery
          ])),
    ]);
  }

  
  Row buildGallery() {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    child: Image.asset('assets/h1.jpg',
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ]),
                Column(children: <Widget>[
                  Container(
                    child: Image.asset('assets/h2.jpg',
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ]),
                Column(children: <Widget>[
                  Container(
                    child: Image.asset('assets/h3.jpg',
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ]),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    child: Image.asset('assets/h4.jpg',
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ]),
                Column(children: <Widget>[
                  Container(
                    child: Image.asset('assets/h5.jpg',
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ]),
                Column(children: <Widget>[
                  Container(
                    child: Image.asset('assets/h6.jpg',
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ]),
              ],
            ),
          ]),
        ]);
  }

  SingleChildScrollView buildPetAvatar() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            iconSize: 60,
                            padding: const EdgeInsets.all(0),
                            onPressed: null),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 5,),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Add '),
                    ],
                  ),
                ],
              ),

              SizedBox(width: 5,),

              Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/h2.jpg'),
                      ),
                    ],
                  ),

                  SizedBox(height: 5,),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Hachi')
                      ],
                  ),
                ],
              ),

              SizedBox(width: 5,),

              Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/h3.jpg'),
                      ),
                    ],
                  ),

                  SizedBox(height: 5,),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[Text('Horlick')],
                  ),
                ],
              ),
            ]));
  }

  Row buildProfileBio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Hamster Lover <3'),
            InkWell(
              child: new Text('my instagram'),
            ),
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
          backgroundImage: AssetImage('assets/photo4.jpg'),
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
                            '6',
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
                            '13',
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
                            '25',
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



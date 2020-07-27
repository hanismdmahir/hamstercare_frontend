import 'package:flutter/material.dart';
import 'package:hamstercare/models/user.dart';
import 'package:hamstercare/services/auth_services.dart';
import 'package:hamstercare/userProfile/userProfile.dart';

class Setting extends StatefulWidget {
  final User user;
  Setting(this.user);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _noti = false;
  get noti => _noti;
  set noti(value) => setState(() => _noti = value);

  final _bio = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final dataService = UserDataService();

  @override
  void initState() {
    super.initState();
    _bio.text = widget.user.bio;
    _username.text = widget.user.username;
    _password.text = widget.user.password;
    _email.text = widget.user.email;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _bio.dispose();
    _username.dispose();
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  void _bioState(String bio) {
    setState(() {
      User _user = User.copy(widget.user);
      _user.bio = bio;
      widget.user.bio = _user.bio;
    });
  }

  void _usernameState(String username) {
    setState(() {
      User _user = User.copy(widget.user);
      _user.username = username;
      widget.user.username = _user.username;
    });
  }

  void _passwordState(String password) {
    setState(() {
      User _user = User.copy(widget.user);
      _user.password = password;
      widget.user.password = _user.password;
    });
  }

  void _emailState(String email) {
    setState(() {
      User _user = User.copy(widget.user);
      _user.email = email;
      widget.user.email = _user.email;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        controller: _bio,
                        maxLength: 50,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: widget.user.bio,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Save'),
                          onPressed: () async {
                            User newBio = User.copy(widget.user);
                            newBio.bio = _bio.text;
                            await dataService.newBio(
                                id: widget.user.id, bio: newBio);

                            setState(() {
                              _bioState(_bio.text);
                              widget.user.bio = newBio.bio;
                            });
                            Navigator.of(context).pop(null);
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
                          onPressed: () async {
                            User newName = User.copy(widget.user);
                            newName.username = _username.text;
                            await dataService.newName(
                                id: widget.user.id, name: newName);
                            setState(() {
                              _usernameState(_username.text);
                              widget.user.username = newName.username;
                            });
                            Navigator.of(context).pop(null);
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
                          onPressed: () async {
                            User newPass = User.copy(widget.user);
                            newPass.password = _password.text;
                            await dataService.newPass(
                                id: widget.user.id, pass: newPass);
                            setState(() {
                              _passwordState(_password.text);
                              widget.user.password = newPass.password;
                            });
                            Navigator.of(context).pop(null);
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
                          onPressed: () async {
                            User newEm = User.copy(widget.user);
                            newEm.email = _email.text;
                            await dataService.newEmail(
                                id: widget.user.id, email: newEm);
                            setState(() {
                              _emailState(_email.text);
                              widget.user.email = newEm.email;
                            });
                            Navigator.of(context).pop(null);
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
            onChanged: (value) {
              setState(() {
                noti = value;
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Hamstercare will send you notification"),
                    );
                  },
                );
              });
            },
            activeColor: Colors.orange,
            value: noti,
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
}

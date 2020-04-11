import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 4;

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
        //setting tiqah
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



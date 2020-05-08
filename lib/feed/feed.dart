import 'package:flutter/material.dart';
import 'package:hamstercare/models/mock_user.dart';
import 'package:hamstercare/reminder/reminderscreen.dart';
import 'package:hamstercare/userProfile/userProfile.dart';

class FeedNews extends StatefulWidget {
  @override
  _FeedNewsState createState() => _FeedNewsState();
}

class _FeedNewsState extends State<FeedNews> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.white,
      bottomNavigationBar: buildBottomNavigationBar(),
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   leading: Icon(Icons.announcement),
      //   title: 
      // //   Column(
      // //   crossAxisAlignment: CrossAxisAlignment.start,
      // //   children: <Widget>[
      // //     Container(
      // //       height: 100,
      // //       padding: EdgeInsets.only(
      // //         right: 10,
      // //         left: 10,
      // //         bottom: 10,
      // //         top: 40,
      // //       ),
      // //       child: Row(
      // //         children: <Widget>[
      // //           Expanded(
      // //               child: Container(
      // //             decoration: BoxDecoration(
      // //               borderRadius: BorderRadius.circular(50),
      // //               color: Colors.grey[200],
      // //             ),
      // //             child: TextField(
      // //               decoration: InputDecoration(
      // //                 prefixIcon: Icon(Icons.search, color: Colors.grey),
      // //                 border: InputBorder.none,
      // //                 hintStyle: TextStyle(color: Colors.grey),
      // //                 hintText: "Search",
      // //               ),
      // //             ),
      // //           ))
      // //         ],
      // //       ),
      // //     )
      // //   ],
      // // ),
      //   // Row(
      //   //   mainAxisAlignment: MainAxisAlignment.center,
      //   //   children: <Widget>[
      //   //     Text('HamsterCare'),
      //   //   ],
      //   // ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 10,
              top: 20,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.orange[50],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.orange[700]),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.orange[600]),
                      hintText: "Search",
                    ),
                  ),
                ),),
                // jarak tepi SizedBox(width: 20,),
              ],
            ),
          ),
           Expanded(
            child: SingleChildScrollView(
             // scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    makeFeed(
                      userName: 'Malinda Roy',
                      userImage: 'assets/user1.jpg',
                      feedTime: '1 mins ago',
                      feedText: 'My name is Chiki! ',
                      feedImage: 'assets/feed1.jpg',
                      like: '10k',
                      comment: '400 Comments',
                    ),
                    makeFeed(
                      userName: 'Azman Hakim', 
                      userImage: 'assets/user2.jpg', 
                      feedTime: '1 hr ago', 
                      feedText: "Makan makan :3", 
                      feedImage: 'assets/feed2.jpg',
                      like: '1000k',
                      comment: '50 Comments',
                    ),
                    makeFeed(
                      userName: 'Nazmi Irfan', 
                      userImage: 'assets/user3.jpg', 
                      feedTime: '12 hr ago', 
                      feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.", 
                      feedImage: 'assets/feed3.jpg',
                      like: '1',
                      comment: '0 Comments',
                    ),
                      makeFeed(
                      userName: 'Min Jen', 
                      userImage: 'assets/user4.jpg', 
                      feedTime: '23 hr ago', 
                      feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.", 
                      feedImage: 'assets/feed4.jpg',
                      like: '5',
                      comment: '1 Comments',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );


  }
  Widget makeFeed({userName, userImage, feedTime, feedText, feedImage, like, comment}) {
    return Container(
      
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(userImage),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(userName, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),),
                      SizedBox(height: 3,),
                      Text(feedTime, style: TextStyle(fontSize: 15, color: Colors.grey),),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, size: 30, color: Colors.grey[600],), 
                onPressed: () {},
              )
            ],
          ),
          SizedBox(height: 20,),
          Text(feedText, style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5, letterSpacing: .7),),
          SizedBox(height: 20,),
          feedImage != '' ?
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(feedImage),
                fit: BoxFit.cover
              )
            ),
          ) : Container(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  makeLike(),
                  Transform.translate(
                    offset: Offset(-5, 0),
                    child: makeLove()
                  ),
                  SizedBox(width: 5,),
                  //like number
                  Text(like, style: TextStyle(fontSize: 15, color: Colors.grey[800]),)
                ],
              ),
              //like comment
              Text(comment, style: TextStyle(fontSize: 13, color: Colors.grey[800]),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              makeLikeButton(isActive: true),
              makeCommentButton(),
              makeShareButton(),
            ],
          )
        ],
      ),
    );
  }
  Widget makeShareButton() {
    return Container(
      width: 12,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      height: 30,
      child: Center(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Icon(Icons.share, color: Colors.grey, size: 18),
            //SizedBox(width: ,),
            FlatButton(
            
              onPressed: null,
              child: Text("Share", style: TextStyle(color: Colors.grey),), 
            ),
            
          ],
        ),
      ),
    );
  }
  Widget makeCommentButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      height: 30,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.chat, color: Colors.grey, size: 18),
          //  SizedBox(width: 5,),
            FlatButton(
              onPressed: null, 
              child: Text("Comment", style: TextStyle(color: Colors.grey),),
            )
          ],
        ),
      ),
    );
  }
  Widget makeLikeButton({isActive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      height: 30,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.thumb_up, color: isActive ? Colors.blue : Colors.grey, size: 18,),
        // SizedBox(width: 3,),
            FlatButton(
            onPressed: null, 
            child: Text("Like", style: TextStyle(color: isActive ? Colors.blue : Colors.grey),),
            )
            
          ],
        ),
      ),
    );
  }
  Widget makeLove() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Icon(Icons.favorite, size: 12, color: Colors.white),
      ),
    );
  }
  Widget makeLike() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
      ),
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
             Navigator.push(context,MaterialPageRoute(builder: (context) => FeedNews(),));
             break;
             case 3:
             Navigator.push(context,MaterialPageRoute(builder: (context) => ReminderScreen(mockUser[0]),));
             break;
             case 4:
             Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage(mockUser[0]),));
             break;
          }
          setState(() {
            _currentIndex = index;
          });
        });
  }
}



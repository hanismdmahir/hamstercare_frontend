// import 'package:flutter/material.dart';

// final myController = TextEditingController();

// //photo
// Center _uploadPhoto() {
//   return Center(
//     child: ListView(
//       children: <Widget>[
//         Center(
//           child: Container(
//             child: Center(child: Icon(Icons.add_a_photo)),
//             height: 250,
//             width: 250,
//             margin: EdgeInsets.only(top: 20, bottom: 10),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.grey,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             RaisedButton(
//               focusColor: Colors.blue,
//               color: Colors.orange,
//               onPressed: () {},
//               child: Text(
//                 'Hachi',
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             RaisedButton(
//               color: Colors.orange,
//               onPressed: () {},
//               child: Text(
//                 'Horlick',
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Container(
//           margin: EdgeInsets.all(40),
//           child: TextField(
//             controller: myController,
//             obscureText: true,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 60),
//               border: OutlineInputBorder(),
//               labelText: 'Say something..',
//             ),
//           ),
//         ),
//         Center(
//           child: RaisedButton(
//             color: Colors.orange,
//             onPressed: () {
//               return showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     // Retrieve the text the that user has entered by using the
//                     // TextEditingController.
//                     content: Text("myController.text"),
//                   );
//                 },
//               );
//             },
//             child: Text(
//               'Share',
//               style: TextStyle(
//                 fontSize: 15.0,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

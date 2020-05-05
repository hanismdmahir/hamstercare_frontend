
import 'package:flutter/material.dart';
import 'package:hamstercare/models/mock_user.dart';

import 'models/user.dart';

class Testing extends StatefulWidget {
  @override
  _Testing createState() => _Testing();
}
  
class _Testing extends State<Testing> {
  User user = mockUser[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
                 shrinkWrap: true,
                 itemCount: user.photoUrl.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   childAspectRatio: 1,
                 ),
                 itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(2.0),
                    color: Colors.black,
                    child: Image.asset(user.photoUrl[index].photoUrl),
                 )                
                )
    );
  }

}


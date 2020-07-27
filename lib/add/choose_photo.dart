import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Choose(),
  ));
}

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  final List<bool> isSelected = [false, false];
  final List<bool> isChoosen = [false, false];
  final List<String> url = [
    'assets/feedPic/2hamster.jpg',
    'assets/feedPic/3hamster.jpg'
  ];
  String choosen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("My App Title"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ToggleButtons(
                  selectedBorderColor: Colors.green,
                  selectedColor: Colors.green,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 140,
                      height: 140,
                      child: Image(
                        image: AssetImage('assets/feedPic/2hamster.jpg'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 140,
                      height: 140,
                      child: Image(
                        image: AssetImage('assets/feedPic/3hamster.jpg'),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isChoosen.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          isChoosen[buttonIndex] = !isChoosen[buttonIndex];
                          choosen = url[buttonIndex];
                          Navigator.pop(context);
                        } else {
                          isChoosen[buttonIndex] = false;
                          Navigator.pop(context);
                        }
                      }
                    });
                  },
                  isSelected: isChoosen,
                ),
                Divider(
                  height: 10,
                ),
                ToggleButtons(
                  selectedBorderColor: Colors.green,
                  selectedColor: Colors.green,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Text("Choose"),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Text("Cancel"),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      int buttonIndex = 0;
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = !isSelected[buttonIndex];
                        Navigator.of(context).pop(choosen);
                      } else {
                        isSelected[buttonIndex] = false;
                        choosen = null;
                        Navigator.pop(context);
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hamstercare/setting/setting.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  )
);

class LoginPage extends StatelessWidget {

static final TextEditingController _user = new TextEditingController();
 static final TextEditingController _pass = new TextEditingController();

 String get username => _user.text;
 String get password => _pass.text;


 final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400]  //ni kalau nak orange cair kat bawah 
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text("Login",style: TextStyle(color: Colors.white, fontSize: 40),),
              SizedBox(height:10,),
              Text("Welcome Back",style: TextStyle(color: Colors.white, fontSize: 20),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
            ),
            child: Padding(
              padding:EdgeInsets.all(20) ,
              child: Column(
                children: <Widget>[
                //  SizedBox(height:10 ,), //60
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(
                        color:Color.fromRGBO(255, 95, 27, .3),
                        blurRadius: 20,
                        offset: Offset(0, 10)
                      )]
                    ),
             child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(bottom:BorderSide(color:Colors.grey[200]))
                        ),
                      child: TextField(controller: _user,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color:Colors.grey),
                          border:InputBorder.none
                        ),
                      ),
                    ),
                    Container(
                    padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(bottom:BorderSide(color:Colors.grey[200]))
                        ),
                     child: TextField(
                        controller: _pass,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color:Colors.grey),
                          border:InputBorder.none
                        ), obscureText: true,
                      ),
                    ),
                ],),),
                    SizedBox(height: 40,),
                    Text("Forgot Password?", style: TextStyle(color:Colors.grey[100]),),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal:50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                      ),
                      child: Center(
                        //ko
                        child: FlatButton(child: Text ("Login", style: TextStyle(color:Colors.orange, fontWeight: FontWeight.bold)), 
                         onPressed: (){
                            if(username =="user" && password =="pass"){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting(),
                           // _showSnackBar
                            ));
                            
                              }
                              else{
                                scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("Your Username or Password Are Wrong!")));
                              }
                         }
                                         
                        )
                    ),),
                    SizedBox(height: 40,),
                    Text("Don't have a account? Sign Up here", style: TextStyle(color:Colors.black87)),
                     ],
                     
                    
                    ),
                    
                  )
                

              ),
              
              ),
          
      ],
      ),
    )
   );
      
    
  }
}
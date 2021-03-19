import 'dart:async';
import 'package:flutter/material.dart';
import 'LogInScreen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}
class _SplashScreen extends State<SplashScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff000725),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Loading", style: TextStyle(fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Color(0xffff2fc3)),
                  ),
                  SizedBox(height: 30.0),
                  CircularProgressIndicator(),
                  SizedBox(height: 30.0),
                  Text("please wait", style: TextStyle(fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Color(0xffff2fc3)),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  void NavigateToLogIn(){
    Timer(Duration(seconds: 5), ()=> Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context)=> LogInScreen())
    ));
  }
  @override
  void initState() {
    super.initState();
    NavigateToLogIn();
  }
}


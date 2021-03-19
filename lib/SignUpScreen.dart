import 'package:flutter/material.dart';
import 'Home.dart';
import 'LogInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpScreen();
  }
}
class _SignUpScreen extends State<SignUpScreen>{
  String email="", password="";
  var _formKey=GlobalKey<FormState>();

  FirebaseAuth auth=FirebaseAuth.instance;
  Future<void> register() async{
    await auth.createUserWithEmailAndPassword(
        email: email.trim(), password: password).then((value){
    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Color(0xff000725),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 102,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    SizedBox(height: 5.0,),
                    Text("Register",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                        fontSize: 35.0,),
                    ),
                    Text("Welcome to register page",
                      style: TextStyle(color: Colors.white,),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(150)),
                color: Color(0xffff2fc3),
              ),
            ),

            Theme(
              data: ThemeData(
                hintColor: Colors.blue,
              ),
              child: Padding(padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter your name!";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                  ),
                ),
              ),
            ),

            Theme(
              data: ThemeData(
                hintColor: Colors.blue,
              ),
              child: Padding(padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter password!";
                    }else{
                      email=value;
                    }
                    return null;
                  },

                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                  ),
                ),
              ),
            ),

            Theme(
              data: ThemeData(
                hintColor: Colors.blue,
              ),
              child: Padding(padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: TextFormField(
                  obscureText: true,
                  autocorrect: false,
                  validator: (value){
                    if(value.isEmpty){
                      return "please your enter password!";
                    }else if(value.length<8){
                      return "your password must be more then 8 characters.";
                    }else{
                      password=value;
                    }
                    return null;
                  },

                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.only(left: 20, right: 20),
              child:RaisedButton(onPressed: (){
                if(_formKey.currentState.validate()){
                  register();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context)=>HomeScreen()
                  ));
                }
              },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color(0xffff2fc3),
                child: Text("register", style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold, fontSize: 20),),
                padding: EdgeInsets.all(10.0),
              ),
            ),

            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.blue,
            ),
/*
            Padding(padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google, color: Colors.red,),
                    SizedBox(width: 5.0),
                    Text("Sign in with google", style: TextStyle(
                      fontSize: 20, color: Color(0xff000725),
                    ),)
                  ],
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.facebook, color: Colors.blue,),
                    SizedBox(width: 5.0),
                    Text("Sign in with facebook", style: TextStyle(
                      fontSize: 20, color: Color(0xff000725),
                    ),)
                  ],
                ),
              ),
            ),
*/
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Text("Already have an account!", style: TextStyle(
                    color: Colors.white,
                  ),),

                  FlatButton(onPressed: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context)=> LogInScreen()));
                  },
                      child: Column(
                        children: <Widget>[
                          Text("Log in", style: TextStyle(color: Colors.blue),),
                          Container(
                            width: 45,
                            height: 1,
                            color: Colors.blue,
                          ),
                        ],
                      )

                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}
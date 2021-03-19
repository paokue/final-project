import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ForgotScreen.dart';
import 'Home.dart';
import 'SignUpScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogInScreen ();
  }
}
class _LogInScreen extends State<LogInScreen>{
  bool signInState= false;
  String email="", password="";
  var _formKey=GlobalKey<FormState>();

  static FirebaseAuth auth=FirebaseAuth.instance;

  Future<String> Login() async{
    String user=(await auth.signInWithEmailAndPassword(
        email: email.trim(), password: password)).toString();
    return user;
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Future<void> _GoogleSignIn() async{
    GoogleSignInAccount signInAccount=await _googleSignIn.signIn();
    GoogleSignInAuthentication signInAuthentication=await signInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(idToken: signInAuthentication.idToken, accessToken: signInAuthentication.accessToken);
    FirebaseUser user=(await auth.signInWithCredential(credential)).user;
    print(user);

    setState(() {
      signInState = true;
    });
  }
  @override
  void initState(){
    super.initState();
    Future(() async{
      if(await auth.currentUser()!=null){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen()));
      }
    }
    );
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
                    Text("Log in",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                        fontSize: 35.0,),
                    ),
                    Text("Welcome to Our app",
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
                      return "please enter password!";
                    }else{
                      password=value;
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "password",
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

            Padding(padding: EdgeInsets.only(top: 10.0, right:30.0),
              child: Container(
                width: double.infinity,
                child:InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context)=> ForgotScreen()));
                  },
                  child: Text("Forgot password?", style: TextStyle(color: Color(0xffff2fc3)),
                    textAlign: TextAlign.right,),
                ),
              ),
            ),

            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.only(left: 20, right: 20),
              child:RaisedButton(onPressed: (){
                if(_formKey.currentState.validate()) {
                  Future<String> check = Login();
                  if (check != null) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
                  }
                }
              },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color(0xffff2fc3),
                child: Text("Log in", style: TextStyle(color: Colors.black,
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

            Padding(padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: RaisedButton(
                onPressed: (){
                  _GoogleSignIn();
                  if(signInState){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (BuildContext context)=> HomeScreen()));
                  }
                },
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google, color: Colors.red,),
                    SizedBox(width: 10.0),
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

            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5.0,),
                  Text("Don't have an account yet!", style: TextStyle(
                    color: Colors.white,
                  ),),

                  FlatButton(onPressed: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context)=> SignUpScreen()));
                  },
                      child: Column(
                        children: <Widget>[
                          Text("Sign Up", style: TextStyle(color: Colors.blue),),
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

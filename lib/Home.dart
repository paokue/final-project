import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LogInScreen.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen();

  @override
  _HomeScreenState createState()=> _HomeScreenState();
}
class  _HomeScreenState extends State<HomeScreen>{

  _HomeScreenState();
  FirebaseAuth auth=FirebaseAuth.instance;
  Future<void> Logout() async{
    FirebaseUser user=auth.signOut() as FirebaseUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffff2fc3),
        title: Text("Home"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                Logout();
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context)=> LogInScreen()));
              },
              icon: Icon(Icons.person),
              label: Text("Log out")
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color(0xff000725),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30.0),),
                  Image(image: AssetImage("images/logo.png"),height: 100, width: double.infinity,),
                  SizedBox(height: 5.0,),
                  Text("Welcome to FlowerApp", style: TextStyle(color: Colors.white),),
                  SizedBox(height:12.0),
                ],
              ),
            ),

            ListTile(
              title: Text("Upload"),
              leading: Icon(Icons.cloud_upload, color: Colors.green,),
            ),

            ListTile(
              title: Text("My Favorite"),
              leading: Icon(Icons.favorite, color: Colors.red,),
            ),

            ListTile(
              title: Text("My profile"),
              leading: Icon(Icons.person, color: Colors.black,),
            ),
            Divider(),

            ListTile(
              title: Text("Contact Us"),
              leading: Icon(Icons.email, color: Colors.blue,),
            ),
          ],
        ),
      ),

      body: Container(
        color: Colors.pinkAccent, height: 500, width: 500,
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 25.0)),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 15.0),),
                    Image(image: AssetImage("images/rose1.png"),height: 100.0, width: 120.0,),
                    SizedBox(height: 3.0,),
                    Text("ດອກກຸລາຍແດງ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 12),),
                    Text("ລາຄາ 150,000 ກີບ/ຊໍ່", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 11),),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10.0),),
                    Image(image: AssetImage("images/rose2.png"),height: 100.0, width: 120.0),
                    SizedBox(height: 3.0,),
                    Text("ດອກກຸລາບເຫຼືອງ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 12),),
                    Text("ລາຄາ 130,000 ກີບ/ຊໍ່", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 11),),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10.0),),
                    Image(image: AssetImage("images/rose3.png"),height: 100.0, width: 120.0),
                    SizedBox(height: 3.0,),
                    Text("ດອກກຸລາບຟ້າ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 12),),
                    Text("ລາຄາ 200,000 ກີບ/ຊໍ່", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 11),),
                  ],
                ),
              ],
            ),

            Padding(padding: EdgeInsets.only(left: 25.0)),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 15.0),),
                    Image(image: AssetImage("images/rose4.png"),height: 100.0, width: 120.0,),
                    SizedBox(height: 3.0,),
                    Text("ດອກກຸລາບບົວ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 12),),
                    Text("ລາຄາ 120,000 ກີບ/ຊໍ່", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 11),),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10.0),),
                    Image(image: AssetImage("images/rose5.png"),height: 100.0, width: 120.0),
                    SizedBox(height: 3.0,),
                    Text("ດອກກຸລາບຂາວ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 12),),
                    Text("ລາຄາ 80,000 ກີບ/ຊໍ່", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 11),),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10.0),),
                    Image(image: AssetImage("images/rose6.png"),height: 100.0, width: 120.0),
                    SizedBox(height: 3.0,),
                    Text("ດອກກຸລາບຟ້າອ່ອນ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),),
                    Text("ລາຄາ 150,000 ກີບ/ຊໍ່", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 11),),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
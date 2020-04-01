import 'package:camp_activities/screens/home.dart';
import 'package:camp_activities/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/services/auth.dart';
import 'package:camp_activities/models/counselor.dart';
import 'home.dart';
class AdminScreen extends StatefulWidget {
  static const routeName = '/admin-screen';

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    
    
    final AuthService _auth = AuthService();
    /////////////////////////////////////////////////////ADMİN SCREENİN LOG OUTU NEDEN ÇALIŞMIYOOORR!!!!!!!!!!!!
    return Scaffold(
      // appBar: AppBar(title: Text('Admin screen'),
      //     actions: <Widget>[
      //       FlatButton.icon(
      //         onPressed: (){Home.theSingOut(_auth);},
      //         // () async {
      //         //   await _auth.signOut(); //when this gets complete, we will get a null value in our stream!
      //       //  }, //buraya bastığımızda log out lucaz! ondan hep bunlar
      //         icon: Icon(Icons.person),
      //         label: Text('log out'),
      //       )
      //     ],),
      body: Center(
        child: Text('ADMIN IN THE HOUSE') , //
      ),
    floatingActionButton:FloatingActionButton(child: Text('add activity'),),
    );
  }
}

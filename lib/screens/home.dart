import 'package:camp_activities/screens/AdminScreen.dart';
import 'package:camp_activities/screens/CounselorScreen.dart';
import 'package:camp_activities/services/auth.dart';
import 'package:camp_activities/services/database-service.dart';
import 'package:camp_activities/shared/loading.dart';
import 'package:camp_activities/widgets/camper-list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import 'package:camp_activities/models/activity.dart';
import 'package:camp_activities/models/counselor.dart';
import 'package:flutter/foundation.dart';
import 'ChooseDepartmentScreeen.dart';

class Home extends StatefulWidget {
  static const routeName = '/home-screen';
   static theSingOut(AuthService auth) async {
    await auth
        .signOut(); //when this gets complete, we will get a null value in our stream!
  }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  bool goToAdmin = false;
  @override
  Widget build(BuildContext context) {
    final counselor =
        Provider.of<Counselor>(context); //giriş yapan counselor oluyor

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'French Woods Sports And Arts Center',
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            FlatButton.icon( onPressed:(){Home.theSingOut(_auth);},
              // onPressed: () async {
              //   await _auth
              //       .signOut(); //when this gets complete, we will get a null value in our stream!
              //}, //buraya bastığımızda log out lucaz! ondan hep bunlar
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'log out',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: StreamBuilder<CounselorData>(
          stream: DatabaseService(uid: counselor.uid).counselorData,
          builder: (context, snapshot) {
            //this snapshot comes from the stream has nothing to do with firebase
            if (snapshot.hasData) {
              CounselorData dataOfCounselor = snapshot.data;
              // print(  'NAME SURNAME ${dataOfCounselor.nameSurname},IS ADMIN ${dataOfCounselor.isAdmin}');
              if (goToAdmin == false) {
                if (dataOfCounselor.isAdmin) {
                return AdminScreen();
             //   ChooseDepartmentScreen();
              //  AdminScreen();
                  
                  // goToAdmin = true;   
                  // WidgetsBinding.instance.addPostFrameCallback((_) =>
                      // Navigator.of(context).pushNamed(AdminScreen.routeName,
                  //     //     arguments: dataOfCounselor.nameSurname));
                  // Navigator.of(context).pushNamed(AdminScreen.routeName,arguments:[dataOfCounselor.nameSurname,dataOfCounselor.dept,dataOfCounselor.isAdmin]));// LOG OUT YAPINCA NULL VERİYO
                }
              }
              return Container(
                child: CounselorScreen(),
              ); //BUNK LISTS WILL BE HERE
            }
            return Loading();
          },
        ));
  }
}

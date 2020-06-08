import 'package:camp_activities/screens/ChooseDepartmentScreeen.dart';
import 'package:camp_activities/screens/home.dart';
import 'package:camp_activities/shared/loading.dart';
import 'package:camp_activities/widgets/activity-list-2.dart';
import 'package:camp_activities/widgets/activity-list.dart';
import 'package:camp_activities/widgets/activity-list3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/services/auth.dart';
import 'package:camp_activities/models/counselor.dart';
import 'home.dart';
import 'package:camp_activities/widgets/add-activity-form.dart';
class AdminScreen extends StatefulWidget {
  static const routeName = '/admin-screen';

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
   int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    static List<Widget> _widgetOptions = <Widget>[
    ChooseDepartmentScreen(),
    ActivityList3(),
    ActivityList2(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
       body: Center(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Dept'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Enquiry'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_activity),
          title: Text('Tüm aktiviteler'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).accentColor,
      onTap: _onItemTapped,
    ),
    );
    
    

  }
  }
//    final AuthService _auth = AuthService();
    /////////////////////////////////////////////////////ADMİN SCREENİN LOG OUTU NEDEN ÇALIŞMIYOOORR!!!!!!!!!!!!
 //   return Scaffold(
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
      //body: ActivityList(), //
      ////////////////////////////////////////////////////////////////////////////////BURADA A
   
   //BU Aşağıdaki özelliği ben  ActivityList'e ekledim :) 
   // floatingActionButton:FloatingActionButton(child: Text('add activity'),
   // onPressed:(){ Navigator.of(context).pushNamed(AddActivityForm.routeName);},),
  //  );
//  }
//}

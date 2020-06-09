import 'package:camp_activities/screens/EnquiryScreen.dart';
import 'package:camp_activities/widgets/activity-list-2.dart';
import 'package:camp_activities/widgets/activity-list3.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/widgets/camper-list.dart';
import 'Choose-bunk-list.dart';

class CounselorScreen extends StatefulWidget {
  @override
  _CounselorScreenState createState() => _CounselorScreenState();
}

////////////////////////////////////////////////////777
///BÜTÜN KTİVİTELERİ GÖSTERMEK İÇİN ACTIVITY LIST 2 VE ACTIVITY TILE KULLLANDIM!!!

class _CounselorScreenState extends State<CounselorScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ChooseBunkList(), // CamperList(),
    ActivityList3(), //EnquiryScreen(), ActivityList3'teki Activitytile3'e basınca bize o aktiviteye ait kampçı listesine götürcek , Activity tile3 avtivity tile2'nin ontap içeren hali
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
            title: Text('Choose Activity'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Attendance'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            title: Text('All Activities'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:camp_activities/models/activity.dart';

import 'package:camp_activities/models/counselor.dart';
import 'package:camp_activities/screens/authenticateScreen.dart';
import 'package:camp_activities/services/database-activity.dart';
import 'screens/home.dart';
import 'package:camp_activities/services/auth.dart';
import 'package:camp_activities/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/AdminScreen.dart';
import 'models/camper.dart';
import 'services/database-camper.dart';
import 'package:camp_activities/services/database-activity.dart';
import 'widgets/choose-activity-form.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Burada sadece counselor için bir tane stream provider vardı ama ben admin için de ekledim
      providers: [
        StreamProvider<Counselor>.value(value: AuthService().counselor),
        StreamProvider<List<Activity>>.value(
            value: ActivityDatabase().activities),
        StreamProvider<List<Camper>>.value(value: CamperDatabase().campers),
        StreamProvider<Camper>.value(value: CamperDatabase().currentCamperData),
        StreamProvider<List<Activity>>.value(value: ActivityDatabase().activities), //activities için stream provider sağladık bu streame ulaşabileceğiz çeşitli yerlerden
      ],

      child: MaterialApp(
        title: 'Camp Activities',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
        home:
            Wrapper(), //we want to access the provider from here so that we can listen to on auth changes and depending on it show either home or authenticateScreen
        routes: {
          Home.routeName: (ctx) => Home(),
          AuthenticateScreen.routeName: (ctx) => AuthenticateScreen(),
          AdminScreen.routeName: (ctx) => AdminScreen(),
          ChooseActivityForm.routeName:(ctx)=> ChooseActivityForm(),
        },
      ),
    );
  }
}

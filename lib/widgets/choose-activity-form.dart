import 'package:camp_activities/shared/loading.dart';
import 'package:camp_activities/widgets/show-activities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/models/camper.dart';
import 'package:camp_activities/services/database-camper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
import 'package:camp_activities/services/database-activity.dart';
import 'package:camp_activities/shared/constants.dart';

class ChooseActivityForm extends StatefulWidget {
  static const routeName = '/activity-form';

  @override
  _ChooseActivityFormState createState() => _ChooseActivityFormState();
}

///Dont forget to add the chosen activities to the lists :) so that counselors can see who signed up for their activity

class _ChooseActivityFormState extends State<ChooseActivityForm> {
  final formKey = GlobalKey<FormState>();
  String _currentAct1;
  String _currentAct2;
  String _currentAct3;

  //final List<String> act = ['act1', 'act2', 'act3'];

  @override
  Widget build(BuildContext context) {
    String uid; // CAMPER TILE'DAN ALICAZ BUNU
    Camper chosenCamper = ModalRoute.of(context).settings.arguments;
    uid=chosenCamper.uid;
    final activities = Provider.of<List<Activity>>(context) ?? [];
   

    final activities1 = activities.where((act) => act.period=='1').toList() ?? []; 
    final activities2 = activities.where((act) => act.period=='2').toList() ?? []; 
    final activities3 = activities.where((act) => act.period=='3').toList() ?? []; 



    return StreamBuilder<Camper>(
      stream: CamperDatabase(uid: chosenCamper.uid).currentCamperData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Camper camper = snapshot.data;
          print('I MADE SNAPSHOTS WOOOOOOOOOOOOOOOOOOORK ');
          return Scaffold(
            appBar: AppBar(
              title: Text('Choose ${camper.nameSurname}\'s activities'),
            ),
            body: Padding(
               padding: EdgeInsets.only(top: 8),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text('Choose ${camper.nameSurname}\'s first minor'),
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                      child: DropdownButtonFormField(
                        value: _currentAct1 ?? camper.activity1,
                        items: activities1.map((activity) {
                          return DropdownMenuItem(
                            value: activity.activityName,
                            child: Text(activity.activityName),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _currentAct1 = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Choose ${camper.nameSurname}\'s second minor'),
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                      child: DropdownButtonFormField(
                        value: _currentAct2 ?? camper.activity2,
                        items: activities2.map((activity) {
                          return DropdownMenuItem(
                            value: activity.activityName,
                            child: Text(activity.activityName),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _currentAct2 = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Choose ${camper.nameSurname}\'s third minor'),
                    Card(
                      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                      elevation: 5,
                      child: DropdownButtonFormField(
                        value: _currentAct3 ?? camper.activity3,
                        items: activities3.map((activity) {
                          return DropdownMenuItem(
                            value: activity.activityName,
                            child: Text(activity.activityName),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _currentAct3 = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('Save'),
                      onPressed: () async {
                        await CamperDatabase(uid:camper.uid).updateCamperData(
                           // camper.activity1?? _currentAct1,
                            _currentAct1 ?? camper.activity1,
                            _currentAct2 ?? camper.activity2,
                            _currentAct3 ?? camper.activity3);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
          return Loading();
        }
      },
    );
  }
}

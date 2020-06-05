import 'package:camp_activities/models/activity.dart';
import 'package:camp_activities/services/database-service.dart';
import 'package:camp_activities/widgets/choose-activity-form.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/camper.dart';
import 'package:camp_activities/services/database-camper.dart';

class CamperTile2 extends StatelessWidget {
  final Camper camper;
  final Activity activityName;

  CamperTile2({this.camper,this.activityName});

  @override
  Widget build(BuildContext context) {
    return camper.activity1== activityName ||camper.activity2== activityName || camper.activity3== activityName? Container(
      child: Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          elevation: 5,
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            leading: CircleAvatar(child: Text('${camper.bunk}'),backgroundColor: Theme.of(context).primaryColor, radius: 25,), 
            title:
                Text('${camper.nameSurname}'),

            onTap: () {
               Navigator.of(context).pushNamed(ChooseActivityForm.routeName,arguments: camper);
            },
            
          ),
        ),
      ),
    ) : SizedBox(height: 0,);
  }
}



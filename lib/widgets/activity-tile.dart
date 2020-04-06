import 'package:camp_activities/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;
  ActivityTile({this.activity});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          elevation: 5,
          child: ListTile(
            
            title: Text('${activity.activityName}'),
            subtitle: Text('${activity.counselorName}'),
            trailing:Text('minor:${activity.period}'),
          ),
        ));
  }
}

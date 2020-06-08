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
          child: activity.activityName == '2nd Minor' ||
                  activity.activityName == '1st Minor' ||
                  activity.activityName == '3rd Minor'
              ? null :ListTile(
               leading: CircleAvatar(child: Text('${activity.period}'),backgroundColor: Theme.of(context).primaryColor, radius: 25,),
              title: Text('${activity.activityName}'),
              subtitle: Text('${activity.counselorName}'),
          ),
        ));
  }
}

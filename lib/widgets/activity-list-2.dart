import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
import 'activity-tile.dart';
import 'admin-activity-tile.dart';
import 'add-activity-form.dart';

class ActivityList2 extends StatefulWidget {
  @override
  _ActivityList2State createState() => _ActivityList2State();
}

class _ActivityList2State extends State<ActivityList2> {
  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<List<Activity>>(context) ?? [];

    // activities.forEach((activity){
    //   print(activity.activityName);
    //   print(activity.counselorName);
    //   print(activity.period);
    // }
    // );
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            if(activities[index].activityName == '2nd Minor' ||
                  activities[index].activityName == '1st Minor' ||
                  activities[index].activityName == '3rd Minor'){
                 return SizedBox(height: 0,);
                  }
            return ActivityTile(activity: activities[index]);
          }),
    );
  }
}


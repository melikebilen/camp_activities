import 'package:camp_activities/widgets/activity-tile3.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
import 'activity-tile.dart';
import 'admin-activity-tile.dart';
import 'add-activity-form.dart';
class ActivityList3 extends StatefulWidget {
  @override
  _ActivityList3State createState() => _ActivityList3State();
}

class _ActivityList3State extends State<ActivityList3> {
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
        itemBuilder:(context,index){
         return ActivityTile3(activity:activities[index]);
      }
      ),
  
    );
  
  }
}
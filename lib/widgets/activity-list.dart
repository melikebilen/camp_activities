import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';

//The activity list is stateful becaaause it will change! If any activity gets added or removed! it will be changed!!!

class ActivityList extends StatefulWidget {
  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  
  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<List<Activity>>(context) ?? [];

    activities.forEach((activity){
      print(activity.activityName);
      print(activity.counselorName);
      print(activity.period);
    }
    );
    // return ListView.builder(
    //   itemCount: activities.length,
    //   itemBuilder:(context,index){
    //     return ActivitytTile();

    // }
    // );
  }
}
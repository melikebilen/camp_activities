import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
import 'activity-tile.dart';
import 'admin-activity-tile.dart';
import 'add-activity-form.dart';

//The activity list is stateful becaaause it will change! If any activity gets added or removed! it will be changed!!!

class ActivityList extends StatefulWidget {
  static const routeName = '/activity-list';
  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {

  
  @override
  Widget build(BuildContext context) {
    String chosenDept= ModalRoute.of(context).settings.arguments ?? 'all';
    final activities = Provider.of<List<Activity>>(context) ?? [];

    // activities.forEach((activity){
    //   print(activity.activityName);
    //   print(activity.counselorName);
    //   print(activity.period);
    // }
    // );
    return Scaffold(
      appBar: AppBar(title: Text(chosenDept),),
          body: ListView.builder(
        itemCount: activities.length,
        itemBuilder:(context,index){
         return AdminActivityTile(activity:activities[index],dept:chosenDept);
      }
      ),
    floatingActionButton:FloatingActionButton(child: Text('add activity'),
    onPressed:(){ Navigator.of(context).pushNamed(AddActivityForm.routeName);},),
    );
  
}
}
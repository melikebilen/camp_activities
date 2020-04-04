import 'package:camp_activities/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/services/database-activity.dart';
import 'activity-list.dart';
import 'package:camp_activities/models/activity.dart';
import 'package:provider/provider.dart';
class ShowActivities extends StatefulWidget {
  @override
  _ShowActivitiesState createState() => _ShowActivitiesState();
}

class _ShowActivitiesState extends State<ShowActivities> {
 
  @override
  Widget build(BuildContext context) {
     final activities = Provider.of<List<Activity>>(context);
    return ActivityList();
    // StreamBuilder<Activity>(
    //   stream: ActivityDatabase().activities,
    //   builder: (context,snapshot){
    //     if(snapshot.hasData){
    //       Activity activity= snapshot.data;
    //       return Scaffold(body: Text('${activity.activityName}'),);
    //     }
    //     else{
    //       return Container(child: Text('Cant show you anything hunnie bun !'),);

    //       //return Loading();
    //     }

    //   },
      
    // );
  }
}
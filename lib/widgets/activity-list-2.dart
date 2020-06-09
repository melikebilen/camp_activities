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
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Text(
                text,
        style: TextStyle(color: Colors.white,backgroundColor: Colors.pink)
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        border: Border.all(color: Colors.pink),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: double.infinity,
     margin: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
      padding: EdgeInsets.all(3),
      child: child,
    );
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildSectionTitle(context, '  1st Minors  '),
            buildContainer(
              ListView.builder(
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    if (activities[index].activityName == '2nd Minor' ||
                        activities[index].activityName == '1st Minor' ||
                        activities[index].activityName == '3rd Minor') {
                      return SizedBox(
                        height: 0,
                      );
                    }
                    return activities[index].period == '1'
                        ? ActivityTile(activity: activities[index])
                        : SizedBox(
                            height: 0,
                          );
                  }),
            ),
            buildSectionTitle(context, '  2nd Minors  '),
            buildContainer(
              ListView.builder(
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    if (activities[index].activityName == '2nd Minor' ||
                        activities[index].activityName == '1st Minor' ||
                        activities[index].activityName == '3rd Minor') {
                      return SizedBox(
                        height: 0,
                      );
                    }
                    return activities[index].period == '2'
                        ? ActivityTile(activity: activities[index])
                        : SizedBox(
                            height: 0,
                          );
                  }),
            ),
            buildSectionTitle(context, '  3rd Minors  '),
            buildContainer(
              ListView.builder(
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    if (activities[index].activityName == '2nd Minor' ||
                        activities[index].activityName == '1st Minor' ||
                        activities[index].activityName == '3rd Minor') {
                      return SizedBox(
                        height: 0,
                      );
                    }
                    return activities[index].period == '3'
                        ? ActivityTile(activity: activities[index])
                        : SizedBox(
                            height: 0,
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

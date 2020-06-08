import 'package:camp_activities/models/activity.dart';
import 'package:camp_activities/services/database-activity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/models/camper.dart';
import 'package:camp_activities/services/database-camper.dart';

class AdminActivityTile extends StatelessWidget {
  final Activity activity;
  final String dept;
  AdminActivityTile({this.activity, this.dept});
  ActivityDatabase activityDatabase = ActivityDatabase();

  @override
  Widget build(BuildContext context) {
    final campers = Provider.of<List<Camper>>(context) ?? [];
    campers.forEach((camper) {
      print(camper.nameSurname);
    });

    if (dept == 'all') {
      return Padding(
          padding: EdgeInsets.only(top: 8),
          child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            elevation: 5,
            child: activity.activityName == '2nd Minor' ||
                  activity.activityName == '1st Minor' ||
                  activity.activityName == '3rd Minor'
              ?SizedBox.shrink() :ListTile(
              leading: CircleAvatar(
                child: Text('${activity.period}'),
                backgroundColor: Theme.of(context).primaryColor,
                radius: 25,
              ),
              title: Text('${activity.activityName}'),
              subtitle: Text('${activity.counselorName}'),
              trailing: IconButton(
                icon: Icon(Icons.delete), color: Colors.red,
                // onPressed:()async{ await activityDatabase.deleteActivity(activity.uid);} ,
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => AlertDialog(
                            content:
                                Text('Do you want to delete the activity?'),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text('Yes'),
                                  onPressed: () async {
                                    /////////////////BURAYA EKLEME YAPIYORUZ
                                    campers.forEach((camper) async {
                                      print(camper.nameSurname);
                                      if (activity.period == "1" &&
                                          camper.activity1 ==
                                              activity.activityName) {
                                        await CamperDatabase(uid: camper.uid)
                                            .updateCamperData(
                                                "1st Minor",
                                                camper.activity2,
                                                camper.activity3);
                                      }
                                      if (activity.period == "2" &&
                                          camper.activity2 ==
                                              activity.activityName) {
                                        await CamperDatabase(uid: camper.uid)
                                            .updateCamperData(camper.activity1,
                                                "2nd Minor", camper.activity3);
                                      }
                                      if (activity.period == "3" &&
                                          camper.activity3 ==
                                              activity.activityName) {
                                        await CamperDatabase(uid: camper.uid)
                                            .updateCamperData(camper.activity1,
                                                camper.activity2, "3rd Minor");
                                      }
                                    });
                                    //////////////////////////
                                    Navigator.of(context).pop();
                                    await activityDatabase
                                        .deleteActivity(activity.uid);
                                  }),
                              FlatButton(
                                child: Text('No'),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ));
                },
              ),
            ),
          ));
    } else
      return activity.department == dept
          ? Padding(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                elevation: 5,
                child:  activity.activityName == '2nd Minor' ||
                  activity.activityName == '1st Minor' ||
                  activity.activityName == '3rd Minor'
              ?SizedBox.shrink() :ListTile(
                  leading: CircleAvatar(
                    child: Text('${activity.period}'),
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 25,
                  ),
                  title: Text('${activity.activityName}'),
                  subtitle: Text('${activity.counselorName}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete), color: Colors.red,
                    // onPressed:()async{ await activityDatabase.deleteActivity(activity.uid);} ,
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => AlertDialog(
                                content:
                                    Text('Do you want to delete the activity?'),
                                actions: <Widget>[
                                  FlatButton(
                                      child: Text('Yes'),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await activityDatabase
                                            .deleteActivity(activity.uid);
                                      }),
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ));
                    },
                  ),
                ),
              ))
          : SizedBox(
              height: 0,
            );
  }
}

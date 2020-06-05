import 'package:camp_activities/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/models/camper.dart';
import 'camper-tile2.dart';
import 'attendance-tile.dart';

class CamperList2 extends StatefulWidget {
  static const routeName = '/camper-list';
  Activity currentActivity;
  CamperList2(this.currentActivity);
  @override
  _CamperList2State createState() => _CamperList2State();
}

class _CamperList2State extends State<CamperList2> {
  @override
  Widget build(BuildContext context) {
    //Activity activityName= ModalRoute.of(context).settings.arguments ?? 'all';
    final campers = Provider.of<List<Camper>>(context) ?? [];

    campers.forEach((camper) {
      print(camper.nameSurname);
    });
    return Scaffold(
      backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('${widget.currentActivity.activityName}'),
        ),
        body: ListView.builder(
            itemCount: campers.length,
            itemBuilder: (context, index) {
              return campers[index].activity1 ==
                          widget.currentActivity.activityName ||
                      campers[index].activity2 ==
                          widget.currentActivity.activityName ||
                      campers[index].activity3 ==
                          widget.currentActivity.activityName
                  ? Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Card(
                          elevation: 5,
                          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                          child: AttendanceTile(campers[index]))
                    )
                  : SizedBox();
            }));
  }
}

//ListTile(
//                              leading: CircleAvatar(
//                                child: Text('${campers[index].bunk}'),
//                                backgroundColor: Theme.of(context).primaryColor,
//                                radius: 25,
//                              ),
//                              title: Text('${campers[index].nameSurname}'),                   
//                              )
//                              ),
                              
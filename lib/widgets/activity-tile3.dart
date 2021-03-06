import 'package:camp_activities/models/activity.dart';
import 'package:camp_activities/screens/EnquiryScreen.dart';
import 'package:flutter/material.dart';

class ActivityTile3 extends StatelessWidget {
  final Activity activity;
  ActivityTile3({this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5,bottom: 5),
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          elevation: 5,
          child:  
          //activity.activityName == '2nd Minor' ||
          //        activity.activityName == '1st Minor' ||
          //        activity.activityName == '3rd Minor'
          //    ? Container()
          //    : 
              ListTile(
                  leading: CircleAvatar(
                    child: Text('${activity.period}'),
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 25,
                  ),
                  title: Text('${activity.activityName}'),
                  subtitle: Text('${activity.counselorName}'),

                  onTap: () => Navigator.of(context).pushNamed(
                      EnquiryScreen.routeName,
                      arguments:
                          activity), //Aktivite adını parametre olarak ver
                ),
        ));
  }
}

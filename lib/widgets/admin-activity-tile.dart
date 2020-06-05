import 'package:camp_activities/models/activity.dart';
import 'package:camp_activities/services/database-activity.dart';
import 'package:camp_activities/widgets/activity-list-2.dart';
import 'package:camp_activities/widgets/activity-list.dart';
import 'package:flutter/material.dart';

class AdminActivityTile extends StatelessWidget {
  final Activity activity;
  final String dept;
  AdminActivityTile({this.activity,this.dept});
  ActivityDatabase activityDatabase= ActivityDatabase();
  
  @override
  Widget build(BuildContext context) {
    if(dept=='all'){
      return   Padding(
          padding: EdgeInsets.only(top: 8),
          child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(child: Text('${activity.period}'),backgroundColor: Theme.of(context).primaryColor, radius: 25,),
              title: Text('${activity.activityName}'),
              subtitle: Text('${activity.counselorName}'),
              trailing: IconButton(icon: Icon(Icons.delete), color: Colors.red ,
              // onPressed:()async{ await activityDatabase.deleteActivity(activity.uid);} ,
              onPressed: (){showDialog(
                barrierDismissible: false,
                context: context, 
                builder:(_)=> AlertDialog(
                  content: Text('Do you want to delete the activity?'),
                  actions: <Widget>[
                    FlatButton(child: Text('Yes'),onPressed:()async{Navigator.of(context).pop(); await activityDatabase.deleteActivity(activity.uid);
                    }),
                    FlatButton(child: Text('No'),onPressed:()=> Navigator.of(context).pop(),),
                  ],));},
               ) ,
            ),
          )  
          ) ; 
    }
    else
    return activity.department == dept ?
      Padding(
          padding: EdgeInsets.only(top: 8),
          child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(child: Text('${activity.period}'),backgroundColor: Theme.of(context).primaryColor, radius: 25,),
              title: Text('${activity.activityName}'),
              subtitle: Text('${activity.counselorName}'),
              trailing: IconButton(icon: Icon(Icons.delete), color: Colors.red ,
              // onPressed:()async{ await activityDatabase.deleteActivity(activity.uid);} ,
              onPressed: (){showDialog(
                barrierDismissible: false,
                context: context, 
                builder:(_)=> AlertDialog(
                  content: Text('Do you want to delete the activity?'),
                  actions: <Widget>[
                    FlatButton(child: Text('Yes'),onPressed:()async{Navigator.of(context).pop(); await activityDatabase.deleteActivity(activity.uid);
                    }),
                    FlatButton(child: Text('No'),onPressed:()=> Navigator.of(context).pop(),),
                  ],));},
               ) ,
            ),
          )  
          )    : SizedBox(height: 0,) ;
  }
}

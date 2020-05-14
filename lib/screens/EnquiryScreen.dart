import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
class EnquiryScreen extends StatelessWidget {
  static const routeName = '/enquiry-screen';
  @override
  Widget build(BuildContext context) {
    Activity currentActivity=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('${currentActivity.activityName}'),),

         body: Container(child: Text('YOKLAMA'),
        
      ),
    );
  }
}
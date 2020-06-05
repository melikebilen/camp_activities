import 'package:camp_activities/widgets/camper-list2.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
class EnquiryScreen extends StatefulWidget {
  static const routeName = '/enquiry-screen';
  @override
  _EnquiryScreenState createState() => _EnquiryScreenState();
}

class _EnquiryScreenState extends State<EnquiryScreen> {
  @override
  Widget build(BuildContext context) {
    Activity currentActivity=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body:CamperList2(currentActivity) ,);
    
    
   // Scaffold(
   //   body:  Container(
   //     child: Column(
   //         crossAxisAlignment: CrossAxisAlignment.center,
   //         mainAxisAlignment: MainAxisAlignment.center,
   //         children: <Widget>[
   //         CamperList2(currentActivity),
            
   //         ]
   //     ),
   //   ),
  //  );
      //i will either keep a list for each activity OR i will list campers who have this activity in their activitiees!
  }
}
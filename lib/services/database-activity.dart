import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:camp_activities/models/activity.dart';

class ActivityDatabase {
  final String uid;
  ActivityDatabase({this.uid});
  final CollectionReference activityCollection =
      Firestore.instance.collection('activities');

  //activity list from the snapshot
  List<Activity> _activityListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Activity(
        uid: doc.documentID,
        department: doc.data['department'],
        activityName: doc.data['activityName'],
        counselorName: doc.data['counselorName'],
        period: doc.data['period'],
      );
    }).toList();
  }

  Stream<List<Activity>> get activities {
    return activityCollection.snapshots().map(_activityListFromSnapshot);
  }



 Future deleteActivity(String uid) async {
 await activityCollection.document(uid).delete();
   print('Activity deleted');
}


 Future getActivity(String uid) async {
 await activityCollection.document(uid).get();
}

  
///////////////////////////////BU EKLENDİ
  Future addNewActivity(String activityName, String counselorName,String period, String department) async {
      DocumentReference  newActivity;
     newActivity = await activityCollection.add({
      'activityName': activityName,
      'counselorName': counselorName,
      'period': period,
      'department': department,
    }); 
   return await activityCollection.document(newActivity.documentID).updateData({
        'activityName': activityName,
      'counselorName': counselorName,
      'period': period,
      'department': department,
      'uid':newActivity.documentID,
     });
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:camp_activities/models/activity.dart';

class ActivityDatabase{

final CollectionReference activityCollection = Firestore.instance.collection('activity');

  //activity list from the snapshot
  List<Activity> _activityListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Activity(
        uid: doc.documentID,
        activityName: doc.data['activityName'],
        counselorName: doc.data['counselorName'],
        period: doc.data['period'],
        );
    }).toList();
  }

  Stream<List<Activity>> get activities{
    return activityCollection.snapshots().map( _activityListFromSnapshot);
  }



}
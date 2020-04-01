import 'package:camp_activities/models/camper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CamperDatabase{
  final String uid;  //CAMPERS UID
  CamperDatabase({this.uid}); 

final CollectionReference camperCollection = Firestore.instance.collection('campers');

List<Camper> _camperFromDataSnapshot(QuerySnapshot snaphot){
return snaphot.documents.map((doc){
  return Camper(
  uid: uid,
  nameSurname: doc.data['nameSurname'],
  bunk: doc.data['bunk'],
  activity1: doc.data['activity1'],
  activity2: doc.data['activity2'],
  activity3: doc.data['activity3'],
);
}).toList();
}

Stream<List<Camper>> get campers{
  print('UID: $uid');
  return camperCollection.snapshots().map(_camperFromDataSnapshot);
  }
Future updateCamperData(String act1,String act2,String act3) async{
  return await camperCollection.document(uid).setData({
    'activity1': act1,
    'activity2': act2,
    'activity3': act3,
  }); //if the uid doesnt exist, it'll create one for it
}
}
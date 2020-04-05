import 'package:camp_activities/models/camper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CamperDatabase {
  final String uid; //CAMPERS UID
  CamperDatabase({this.uid});

  final CollectionReference camperCollection =
      Firestore.instance.collection('campers');

  List<Camper> _camperFromDataSnapshot(QuerySnapshot snaphot) {
    return snaphot.documents.map((doc) {
      return Camper(
        uid: doc.data['uid'],
        nameSurname: doc.data['nameSurname'],
        bunk: doc.data['bunk'],
        activity1: doc.data['activity1'],
        activity2: doc.data['activity2'],
        activity3: doc.data['activity3'],
      );
    }).toList();
  }

  Stream<List<Camper>> get campers {
    print('UID: $uid');
    return camperCollection.snapshots().map(_camperFromDataSnapshot);
  }

  Camper _chosenCamperData(DocumentSnapshot snapshot) {
    return Camper(
      uid: snapshot.data['uid'],
      bunk: snapshot.data['bunk'],
      nameSurname: snapshot['nameSurname'],
      activity1: snapshot.data['activity1'],
      activity2: snapshot.data['activity2'],
      activity3: snapshot.data['activity3'],
    );
  }



 Stream<Camper> get currentCamperData{ //STREAM BUILDERDAN DINLEYECEĞİM ŞEY BU!
   return camperCollection.document(uid).snapshots().map(_chosenCamperData);
 }


//   Stream<Camper> get currentCamperData{ //STREAM BUILDERDAN DINLEYECEĞİM ŞEY BU!
//    return camperCollection.document(uid).snapshots().map(_chosenCamperData);
//  }



  Future updateCamperData(String act1, String act2, String act3) async {
    return await camperCollection.document(uid).updateData({
      'activity1': act1,
      'activity2': act2,
      'activity3': act3,
    }); //if the uid doesnt exist, it'll create one for it
  }
}

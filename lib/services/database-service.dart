import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:camp_activities/models/counselor.dart';

class DatabaseService {
//the one related with counselors!

  //thiss will be equal to counselor id!
  final String uid;
  DatabaseService({this.uid});

  CollectionReference counselors = Firestore.instance.collection('counselors');


  Stream<CounselorData> get counselorData {
    return counselors.document(uid).snapshots().map(_counselorFromSnapshot);
  }

  CounselorData _counselorFromSnapshot(DocumentSnapshot snapshot){
    //Collectiondan aldığı bilgiyi çeviricek
    return CounselorData(
      uid: uid,
      nameSurname: snapshot.data['nameSurname'],
      isAdmin: snapshot.data['isAdmin'],
      dept: snapshot.data['dept'],
    );
  }  
}

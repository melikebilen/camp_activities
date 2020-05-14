import 'package:camp_activities/models/camper.dart';
class Activity {
  final String uid;
  final String activityName;
  final String counselorName;
  final String period;
  final String department;
  final List<String> campersThatSignedForActvity;
  Activity({this.uid,this.department ,this.activityName, this.counselorName, this.period,this.campersThatSignedForActvity});
}

//Userlar için ayrıca bir user dataya ihtiyaç duymamızın nedeni user ile userın bilgilerini birleştirmek için uid kullanmamızdı glb
// class ActivityData {
//   final String uid;
//   final String activityName;
//   final String counselorName;
//   final String period;
//   ActivityData({this.uid, this.activityName, this.counselorName, this.period});
// }

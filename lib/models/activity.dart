class Activity {
  final String uid;
  final String activityName;
  final String counselorName;
  final String period;
  Activity({this.uid, this.activityName, this.counselorName, this.period});
}

//Userlar için ayrıca bir user dataya ihtiyaç duymamızın nedeni user ile userın bilgilerini birleştirmek için uid kullanmamızdı glb
// class ActivityData {
//   final String uid;
//   final String activityName;
//   final String counselorName;
//   final String period;
//   ActivityData({this.uid, this.activityName, this.counselorName, this.period});
// }

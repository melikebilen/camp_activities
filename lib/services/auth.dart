//all of our auth logic will be here!
import 'package:firebase_auth/firebase_auth.dart';
import 'package:camp_activities/models/counselor.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;



// //converts FirebaseUser to Admin model YENİ EKLENDİ //////////////////////////////////////
//   Admin _adminFromFirebaseUser(FirebaseUser user) {
//     print('admin from firebase user method');
//     return user != null ? Admin(uid: user.uid) : null;
//   }

//   //auth change user stream YENİ EKLENDİ //////////////////////////////////////7
//   Stream<Admin> get admin {
//     print('STREAM ADMIN');
//     return _auth.onAuthStateChanged
//         .map((FirebaseUser user) =>_adminFromFirebaseUser(user));
//   }

  //auth change user stream
//converts FirebaseUser to Counselor model

  Counselor _counselorFromFirebaseUser(FirebaseUser user) {
    print('counselor from firebase user');
    return user != null ? Counselor(uid: user.uid) : null;
  }

  Stream<Counselor> get counselor {
    print('STREAM COUNSELOR');
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _counselorFromFirebaseUser(user));
  }

  //sign in e-mail / password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return()=> _counselorFromFirebaseUser(user);  
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email & password

  //sign out 
  Future signOut() async{ 
    try{
     return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
    }


  }



}









// Stream<FirebaseUser> get user{
//   return _auth.onAuthStateChanged; //it will return us Firebase users whenever there is an change in user!
// }

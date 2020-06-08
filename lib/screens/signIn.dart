import 'package:camp_activities/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'AdminScreen.dart';
import 'package:camp_activities/shared/loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  bool loading = false;
// String adminPassCheck = '';
//   String adminEmail='';
  // String adminPassword = '12345678';

  final textInputDec = InputDecoration(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink[400], width: 2)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('French Woods Sports and Arts Center'),
      ),
      body: loading
          ? Loading()
          : Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView (
                                  child: Column(          
                    children: <Widget>[
                      Stack(
              children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft:Radius.circular(20),
                        bottomRight: Radius.circular(20))
                        ,
                    child: Image.network(
                      'https://scontent.fadb2-1.fna.fbcdn.net/v/t1.0-9/45683124_1093515827489009_4141998810232520704_n.jpg?_nc_cat=110&_nc_sid=85a577&_nc_oc=AQnncrTMTIp0GDFgWyuuh-xZIYtqg6TC4Q78riDTxzwMF_N-iGwFZLgTYEH4j7Vl2s4&_nc_ht=scontent.fadb2-1.fna&oh=1148e2e80ccac6fbb02c4bde68cb12dc&oe=5F058B5A',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
             //   Positioned(
             //     bottom: 20,
             //     right: 10,
             //     child: Container(
             //       width: 300,
             //       color: Colors.black54,
             //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
             //       child: Text(
             //       '-SIGN IN-',
             //         style: TextStyle(fontSize: 25, color: Colors.white),
             //         softWrap: true,
             //         overflow: TextOverflow
             //             .fade, //eğer yerinden taşacak kadar büyük bi textse küçülsün taşmasın diye bu
             //       ),
             //     ),
             //   )
              ],
            ),
                      SizedBox(
                        height: 10,
                      ),
                     // Card(
                     //   child: Text('FWC' ,style: TextStyle(fontSize: 40),)),

                      //EMAIL
                      TextFormField(
                        decoration: textInputDec.copyWith(hintText: ('Email')),
                        validator: (val) => val.isEmpty
                            ? 'You have to provide an email'
                            : null, //VALIDATOR RETURNS NULL IF NO ERROR OCCURS
                        onChanged: (value) {
                          //everytime user types in something, the function will run again and the value will be equal to whatever is written inside
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //PAROLA
                      TextFormField(
                        decoration: textInputDec.copyWith(hintText: ('Password')),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'The password must be longer than 6 chars'
                            : null,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //SIGN IN BUTTON
                      RaisedButton(
                        elevation: 5,
                        color: Colors.pink[400],
                        child: Text('Sign in',style: TextStyle(color: Colors.white),),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            //validate şeyini hallet burada
                            loading = true;
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                              
                            print('THE RESULT PRINT ${result}');
                            if (result == null) {
                              setState(() {
                                error = 'Can\'t sign in';
                                loading = false;
                              });
                            }
                          }
                          print(email);
                          print(password);
                        },
                      ),
                      SizedBox(
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.pink[900], fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

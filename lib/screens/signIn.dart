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
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text('Sign In!'),
        // actions: <Widget>[
        //   //ADMİN SAYFASINA GEÇME KISMIIIIIIIIIIIIIIIIIIIII
        //   FlatButton.icon(
        //       onPressed: () {
        //         showModalBottomSheet(
        //             backgroundColor: Colors.pink[100],
        //             context: context,
        //             builder: (context) {
        //               return Container(
        //                   padding: EdgeInsets.symmetric(
        //                       horizontal: 50, vertical: 70),
        //                   child: Form(
        //                       key: _formKey2,
        //                       child: Column(
        //                         children: <Widget>[
        //                           TextFormField(
        //                             decoration: textInputDec.copyWith(
        //                                 hintText: ('Admin Email')),
        //                             validator: (val) => val.isEmpty
        //                                 ? 'You havent provided a valid email'
        //                                 : null, //VALIDATOR RETURNS NULL IF NO ERROR OCCURS
        //                             onChanged: (value) {
        //                               //everytime user types in something, the function will run again and the value will be equal to whatever is written inside
        //                               setState(() {
        //                                 adminEmail = value;
        //                               });
        //                             },
        //                           ),
        //                           //   Text('Admin Login',style: TextStyle(color: Colors.white,fontSize: 30),),
        //                           TextFormField(
        //                             decoration: textInputDec.copyWith(
        //                                 hintText: ('Admin Password')),
        //                             obscureText: true,
        //                             validator: (val) => val != adminPassword
        //                                 ? 'Not allowed'
        //                                 : null,
        //                             onChanged: (value) {
        //                               setState(() {
        //                                 adminPassCheck = value;
        //                               });
        //                             },
        //                           ),
        //                           SizedBox(
        //                             height: 10,
        //                           ),
        //                           RaisedButton(
        //                             color: Colors.pink[200],
        //                             child: Text('Admin Login'),
        //                             onPressed: () async {
        //                               if (_formKey2.currentState.validate()) {

        //                                 Navigator.of(context)
        //                                     .pushNamed(AdminScreen.routeName);
        //                               }
        //                             },
        //                           ),
        //                         ],
        //                       )));
        //             });
        //       },
        //       icon: Icon(Icons.accessibility),
        //       label: Text(
        //         'Admin',
        //         style: TextStyle(color: Colors.white),
        //       ))
        // ],
      ),
      body: loading
          ? Loading()
          : Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
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
                      color: Colors.pink[200],
                      child: Text('Sign in'),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'signIn.dart';
class AuthenticateScreen extends StatefulWidget {
  static const routeName = '/authenticate-screen';
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

//login one!
class _AuthenticateScreenState extends State<AuthenticateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(),
      // body: Center(child: Text('Authenticate Screen'),),
      
    );
  }
}
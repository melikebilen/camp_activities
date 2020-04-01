
import 'package:camp_activities/services/database-service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/models/counselor.dart';
import 'screens/authenticateScreen.dart';
import './screens/signIn.dart';
import 'screens/AdminScreen.dart';
import 'screens/home.dart';
import 'package:camp_activities/shared/loading.dart';
//Biz bu wrapper class'ıyla herhangi bir user'la login miyiz değil miyiz onu görücez, eğer loginse home'a değilse giriş sayfasıma

class Wrapper extends StatelessWidget {
  //Eğer bir user varsa, home sayfası görünmeli, eğer yoksa authenticateScreen görünmeli

  @override
  Widget build(BuildContext context) {
    // we use the provider in the build because WE NEED CONTEXT
  
    final counselor = Provider.of<Counselor>(
        context); // we access this everytime we get a new value!

     //Loading();


    if (counselor == null) {
      return AuthenticateScreen();
    } else {
      return Home();
    }
  }
}

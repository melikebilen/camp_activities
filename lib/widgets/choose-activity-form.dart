import 'package:camp_activities/shared/loading.dart';
import 'package:camp_activities/widgets/show-activities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/models/camper.dart';
import 'package:camp_activities/services/database-camper.dart';

class ChooseActivityForm extends StatefulWidget {
  static const routeName = '/activity-form';

  @override
  _ChooseActivityFormState createState() => _ChooseActivityFormState();
}

///Dont forget to add the chosen activities to the lists :) so that counselors can see who signed up for their activity

class _ChooseActivityFormState extends State<ChooseActivityForm> {
  final formKey = GlobalKey<FormState>();
  String _currentAct1='first minor';
  String _currentAct2 = 'second minor';
  String _currentAct3 = 'third minor';

  final List<String> act = ['act1', 'act2', 'act3'];

  @override
  Widget build(BuildContext context) {
    String uid; // CAMPER TILE'DAN ALICAZ BUNU
    Camper chosenCamper = ModalRoute.of(context).settings.arguments;
    // final camper = Provider.of<Camper>(context);

    return StreamBuilder<Camper>(
      stream: CamperDatabase(uid: chosenCamper.uid).currentCamperData,
      builder: (context, snapshot) {
        //that snapshot doesnt come from database
        if (snapshot.hasData) {
          Camper camper = snapshot.data;
          print('I MADE SNAPSHOTS WOOOOOOOOOOOOOOOOOOORK ');
          return Scaffold(
              appBar: AppBar(
                title: Text('Choose activity'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                        'Choose ${camper.nameSurname}\'s Activites for today! '),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 200,
                   
                    child: ShowActivities()),    /////////////////AKTİVİTELERİ BURADA GÖSTERDİİİİİİİİİİM
                    

                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),

                        // Text('Choose first minor'),
                        // DropdownButtonFormField(
                        //   value: _currentAct1 ?? camper.activity1,
                        //   items: act.map((activity) {
                        //     return DropdownMenuItem(
                        //       value: activity,
                        //       child: Text('$activity is the activity chosen'),
                        //     );
                        //   }).toList(),
                        //   onChanged: (val) {
                        //     setState(() {
                        //       _currentAct1 = val;
                        //     });
                        //   },
                        // ),
                        // Text('Choose second minor'),
                        // DropdownButtonFormField(
                        //   value: _currentAct2 ?? camper.activity2,
                        // ),
                        // Text('Choose third minor'),
                        // DropdownButtonFormField(
                        //   value: _currentAct3 ?? camper.activity3,
                        // ),
                      ],
                    ),
                  )
                ],
              ));
        } else {
          print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
          return Loading();
        }
      },
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('${chosenCamper.nameSurname}\'s Activities!,${chosenCamper.activity1}'),
    //   ),
    //   body: Form(
    //     key: formKey,
    //     child: Text('yay'),
    //   ),
    // );
    //body:
  }
}

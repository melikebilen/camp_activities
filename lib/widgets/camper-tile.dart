import 'package:camp_activities/services/database-service.dart';
import 'package:camp_activities/widgets/choose-activity-form.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/camper.dart';
import 'package:camp_activities/services/database-camper.dart';

class CamperTile extends StatelessWidget {
  final Camper camper;
   final String bunk;
  CamperTile({this.camper,this.bunk});

  @override
  Widget build(BuildContext context) {
    //CamperDatabase camperDatabaseObj = CamperDatabase(uid:camper.uid);
    return camper.bunk== bunk ? Padding(
      padding: EdgeInsets.only(top: 8), // top left right bottom.. one of them
      child: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(child: Text('${camper.bunk}'),backgroundColor: Theme.of(context).primaryColor, radius: 25,), 
          title:
              Text('${camper.nameSurname}'),

          onTap: () {
             Navigator.of(context).pushNamed(ChooseActivityForm.routeName,arguments: camper);
            //KAMPÇILARI DİNLEYEN BİR PROVIDER YARATSAK VE BU SEÇİLDİĞİNDE UYARSAK ONU????????????????????????????????????
            // showModalBottomSheet(
            //     context: context,
            //     builder: (context) {
            //       //CamperDatabase camperDatabaseObj =CamperDatabase(uid: camper.uid);
            //       //print(camper.uid);
            //       //return ChooseActivityForm();
            //       // Navigator.of(context).pushNamed(ChooseActivityForm.routeName,arguments: camper);
            //       //return Container(child: Text(camper.uid),);
            //       Container(child: ChooseActivityForm(),);
            //     });
          },
          
        ),
      ),
    ) : SizedBox(height: 0,);
  }
}



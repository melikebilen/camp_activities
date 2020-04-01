import 'package:flutter/material.dart';
import 'package:camp_activities/models/camper.dart';

class CamperTile extends StatelessWidget {
  final Camper camper;
  CamperTile({this.camper});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8), // top left right bottom.. one of them
      child: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title: Text(camper.nameSurname),
        ),
      ),
    );
  }
}

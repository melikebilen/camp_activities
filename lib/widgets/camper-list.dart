import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/models/camper.dart';
import 'camper-tile.dart';
class CamperList extends StatefulWidget {
  static const routeName = '/camper-list';
  @override
  _CamperListState createState() => _CamperListState();
}

class _CamperListState extends State<CamperList> {

  @override
  Widget build(BuildContext context) {
 String chosenBunk= ModalRoute.of(context).settings.arguments ?? 'all';
    final campers = Provider.of<List<Camper>>(context) ?? [];
   
    campers.forEach((camper){
      print(camper.nameSurname);
    });

    return Scaffold(
     appBar: AppBar(title: Text(chosenBunk),),
          body: ListView.builder(
        itemCount: campers.length,
        itemBuilder: (context,index){
        return CamperTile(camper: campers[index],bunk:chosenBunk);
        }),
    );
  }
}
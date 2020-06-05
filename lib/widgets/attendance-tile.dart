import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_activities/models/camper.dart';

class AttendanceTile extends StatefulWidget {
  Camper camper;
  AttendanceTile(this.camper);
  @override
  _AttendanceTileState createState() => _AttendanceTileState();
}

class _AttendanceTileState extends State<AttendanceTile> {
  @override
  bool checked = false;
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text('${widget.camper.nameSurname}'),
      value: checked,
      onChanged: (bool value) {
        setState(() {
          checked = value;
        });
      },
      secondary: CircleAvatar(
        child: Text('${widget.camper.bunk}'),
        backgroundColor: Theme.of(context).primaryColor,
        radius: 25,
      ),
    );
  }
}

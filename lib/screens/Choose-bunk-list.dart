import 'package:camp_activities/widgets/camper-list.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/shared/constants.dart';
class ChooseBunkList extends StatefulWidget {
    final List<String> bunks = [
    'G1',
    //'G2',
    'B1',
   // 'B2',
  ];
  @override
  _ChooseBunkListState createState() => _ChooseBunkListState();
}

class _ChooseBunkListState extends State<ChooseBunkList> {
 String _bunk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: ('Bunks')),
                value: _bunk,
                items: widget.bunks.map((bunk) {
                  return DropdownMenuItem(
                    value: bunk,
                    child: Text('$bunk'),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _bunk = val;
                  });
                },
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Choose Bunk',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('$_bunk \' Campers will be listed');
                Navigator.of(context)
                    .pushNamed(CamperList.routeName, arguments: _bunk);
              },
            ),
          ]
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
import 'package:camp_activities/services/database-activity.dart';
import 'package:camp_activities/shared/constants.dart';

class AddActivityForm extends StatefulWidget {
  static const routeName = '/add-activity-form';
  @override
  _AddActivityFormState createState() => _AddActivityFormState();
}

class _AddActivityFormState extends State<AddActivityForm> {
  ActivityDatabase activityDatabaseObj = ActivityDatabase();

  final _formKey = GlobalKey<FormState>();
  final List<String> departments = [
    'Technology',
    'Art',
    'Cooking',
    'Performing arts',
  ];
  final List<String> periods = ['1', '2', '3'];

  bool _button1 = false;
  bool _button2 = false;
  bool _button3 = false;

  String _activityName;
  String _counselorName;
  String _period;
  String _department;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New activity'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListView(children: <Widget>[Container(
                        child:Form(
                key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Text(
                      //   'Add a new activity!',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: ('Activity Name')),
                        initialValue: _activityName ?? '',
                        validator: (val) =>
                            val.isEmpty ? 'Please enter the activity name' : null,
                        onChanged: (val) {
                          setState(() {
                            _activityName = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: ('Counselor Name')),
                        initialValue: _counselorName ?? '',
                        validator: (val) =>
                            val.isEmpty ? 'Please enter the counselor name' : null,
                        onChanged: (val) {
                          setState(() {
                            _counselorName = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: ('Department')),
                        value: _department,
                        items: departments.map((dept) {
                          return DropdownMenuItem(
                            value: dept,
                            child: Text('$dept'),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _department = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: ('Minors')),
                        value: _period,
                        items: periods.map((period) {
                          return DropdownMenuItem(
                            value: period,
                            child: Text('$period'),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _period = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Add activity',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await activityDatabaseObj.addNewActivity(_activityName,
                                _counselorName, _period, _department);
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                ),
            ),],
                    
          ),
          ),
        );
  }
}

//  Column(children: <Widget>[
//         RaisedButton(onPressed: (){
//           activityDatabaseObj.addNewActivity('a', 'b', 'c', 'd');},)
//       ],),

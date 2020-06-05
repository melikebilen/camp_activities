import 'package:camp_activities/widgets/activity-list.dart';
import 'package:flutter/material.dart';
import 'package:camp_activities/models/activity.dart';
import 'package:camp_activities/services/database-activity.dart';
import 'package:camp_activities/shared/constants.dart';
import 'package:camp_activities/widgets/add-activity-form.dart';

//buradan ativity list'e geçiş yapılcak, activity list'e biz seçilen departmanın adını vericez ve oraya geçicek :) :)

class ChooseDepartmentScreen extends StatefulWidget {
  final List<String> departments = [
    'Technology',
    'Art',
    'Cooking',
    'Performing arts',
    'all'
  ];

  @override
  _ChooseDepartmentScreenState createState() => _ChooseDepartmentScreenState();
}

class _ChooseDepartmentScreenState extends State<ChooseDepartmentScreen> {
  String _department;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: ('Department')),
                value: _department,
                items: widget.departments.map((dept) {
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
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'See Activities',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('$_department ACTIVITIES WILL BE SHOWN');
                Navigator.of(context)
                    .pushNamed(ActivityList.routeName, arguments: _department);
              },
            ),
            SizedBox(height: 50,),
            FloatingActionButton(
              backgroundColor: Colors.pink,
              child: Text('  add activity', style:TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pushNamed(AddActivityForm.routeName);
              },
            ),
          ]),
    );
  }
}

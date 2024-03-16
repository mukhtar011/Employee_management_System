import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddEmployee.dart';
import 'AttendanceScreen.dart';
import 'EmployeeList.dart';
import 'LogoutScreen.dart';
import 'ModifyScreen.dart';
import 'RemoveScreen.dart';

class Story extends StatelessWidget {
  final BuildContext context;

  Story(this.context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 40,
            mainAxisSpacing: 30,
            children: [
              itemDashboard('Attendance', Icons.person, Colors.green, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceScreen()));
              }),
              itemDashboard('List of Employees', Icons.list, Colors.deepPurple, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeesListScreen()));
              }),
              itemDashboard("Add Employee", Icons.add, Colors.orange, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployeeScreen()));
              }),
              itemDashboard('Remove Employee', Icons.delete, Colors.brown, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RemoveEmployeeScreen()));
              }),
              itemDashboard('Modify Employee', Icons.edit, Colors.indigo, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyEmployeeScreen()));
              }),
              itemDashboard('Logout', Icons.logout, Colors.pinkAccent, () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogoutScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }


  Widget itemDashboard(String title, IconData iconData, Color background, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white,),
          ),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    ),
  );
}
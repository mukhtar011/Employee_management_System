import 'package:flutter/material.dart';

class EmployeesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Employees'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of employees
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Employee $index'),
            onTap: () {
              // Implement action when an employee is tapped
            },
          );
        },
      ),
    );
  }
}
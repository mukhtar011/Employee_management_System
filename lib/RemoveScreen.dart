import 'package:flutter/material.dart';

class RemoveEmployeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Employee'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of employees
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Employee $index'),
            onTap: () {
              removeEmployee(index); // Implement remove logic here
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  void removeEmployee(int index) {
    // Implement logic to remove the employee
    print('Removing Employee at index $index');
  }
}
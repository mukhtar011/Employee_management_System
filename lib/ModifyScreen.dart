import 'package:flutter/material.dart';

class ModifyEmployeeScreen extends StatefulWidget {
  @override
  _ModifyEmployeeScreenState createState() => _ModifyEmployeeScreenState();
}

class _ModifyEmployeeScreenState extends State<ModifyEmployeeScreen> {
  String newName = '';
  int newId = 0;
  int newSalary = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'New Employee Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
              onChanged: (value) {
                setState(() {
                  newName = value;
                });
              },
            ),
            SizedBox(height: 16,),
            TextField(
              decoration: InputDecoration(
                  labelText: 'New Employee ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  newId = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16,),
            TextField(
              decoration: InputDecoration(
                  labelText: 'New Employee Salary',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  newSalary = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                modifyEmployee(); // Implement modify logic here
                Navigator.pop(context);
              },
              child: Text('Modify Employee'),
            ),
          ],
        ),
      ),
    );
  }

  void modifyEmployee() {
    // Implement logic to modify the employee details
    print('Modifying Employee:');
    print('New Name: $newName, New ID: $newId, New Salary: $newSalary');
  }
}
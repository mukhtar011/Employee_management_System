import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  String name = '';
  int id = 0;
  int salary = 0;

  List<Map<String, dynamic>> employees = []; // List to store added employees

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Employee Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 16,),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Employee ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  id = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16,),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Employee Salary',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  salary = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addEmployee();
              },
              child: Text('Add Employee'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return ListTile(
                    title: Text(employee['name']),
                    subtitle: Text('ID: ${employee['id']}, Salary: ${employee['salary']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addEmployee() {
    // Add your logic to add the employee to the list
    // For now, we'll just print the details
    print('Adding Employee:');
    print('Name: $name, ID: $id, Salary: $salary');
  }
}
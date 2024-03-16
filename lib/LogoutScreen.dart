import 'package:flutter/material.dart';
import 'LoginPage.dart'; // Import your login screen file

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implement logout logic here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
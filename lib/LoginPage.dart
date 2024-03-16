import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'main.dart';

class LoginPage extends StatelessWidget{
  var uUserController = TextEditingController();
  var uPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 450,
              decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/loginpic.jpg'),
                fit: BoxFit.contain,
              ),
              ),
            ),


              TextField(
              controller: uUserController,
              decoration: InputDecoration(
                labelText: 'Username or Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),

                )
              ),

            ),
            SizedBox(height: 16,),
            TextField(
              controller: uPassController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
              ),
              obscureText: true,
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: ()async{
              var user =  uUserController.text.toString();
              var pass = uPassController.text.toString();
              var sharedpref = await SharedPreferences.getInstance();
              sharedpref.setBool(SplashScreenState.KEYLOGIN,true);
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => home_screen()),);
              print('LogIn Button Pressed');
            },
              child: Text('LogIn'),


            )
        ],
        ),
      ),

    );
  }
}
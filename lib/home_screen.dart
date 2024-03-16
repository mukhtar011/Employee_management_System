import 'package:employee_management/story.dart';
import 'package:flutter/material.dart';

import 'bottombar_widget.dart';

class home_screen extends StatefulWidget{
  @override
  State<home_screen> createState() => home_screenstate();

  }

  class home_screenstate extends State<home_screen>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: Text('Welcome Admin', style: TextStyle(
         decoration: TextDecoration.none,
           fontFamily: 'Satisfy-Regular',fontSize: 30,color: Colors.black),
       ),
       actions: [
         IconButton(icon: Icon(Icons.menu_sharp,
           size: 30, color: Colors.black,
         ), onPressed: (){},),
       ],),
body:  Builder(
    builder: (context) => Story(context),),
bottomNavigationBar: bottombar_widget(),


     );
  }

  }




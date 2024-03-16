import 'package:flutter/material.dart';

class bottombar_widget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(child:
    BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home,size: 35, color: Colors.grey,),
      label: 'Home',
      ),
        BottomNavigationBarItem(icon: Icon(Icons.search,size: 35,),
          label: 'Search',

        ),
    BottomNavigationBarItem(icon: Icon(Icons.settings,size: 35,),
    label: 'Setting',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle,size: 35,),
    label: 'User',
    ),

     ] ),

    );

  }

}
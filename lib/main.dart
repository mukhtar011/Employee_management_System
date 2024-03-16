import 'dart:async';
import 'package:flutter/material.dart';
import 'package:employee_management/AddEmployee.dart';
import 'Database_helper.dart';
import 'Model.dart';
import 'story.dart';
import 'bottombar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage.dart';
import 'home_screen.dart';

void main() {
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await DatabaseHelper.initDatabase();

    // Add an employee
    Employee employee1 = Employee(name: 'John Doe', salary: 50000);
    await DatabaseHelper.addEmployee(employee1);

    // Get all employees
    List<Employee> employees = await DatabaseHelper.getEmployees();
    print(employees);

    // Update an employee
    employee1.salary = 60000;
    await DatabaseHelper.updateEmployee(employee1);

    // Delete an employee
    await DatabaseHelper.deleteEmployee(employee1.id!);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
    );
  }
}
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen>{
  static const String KEYLOGIN = 'LogIn';
 @override
 void initState(){
   super.initState();
   whereToGo();
 }
 void whereToGo() async{

   var sharedpref = await SharedPreferences.getInstance();
   var isLoggedIn = sharedpref.getBool(SplashScreenState.KEYLOGIN);



   Timer(
     Duration(seconds: 3),(){
       if(isLoggedIn!= null){
         if (isLoggedIn) {
           Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => home_screen()),);
         }else {
           Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => LoginPage()),);

         }
       } else {
         Navigator.pushReplacement(context,
             MaterialPageRoute(builder: (context) => LoginPage()),);
       }
   }
   );
 }
 @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Hero(
            tag: 'logo',
            child: Image.asset('assets/images/employee.jpg',width: 200,height: 200,),
          )
      ),
    );
 }
}





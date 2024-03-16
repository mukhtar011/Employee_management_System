import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Model.dart';

class DatabaseHelper {
  static Database? _database;

  static const String dbName = 'employee.db';
  static const String employeeTable = 'employees';

  static Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, initialize it
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $employeeTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            salary INTEGER
          )
        ''');
      },
    );
  }

  // Add Employee
  static Future<int> addEmployee(Employee employee) async {
    Database db = await database;
    return await db.insert(employeeTable, employee.toMap());
  }

  // Get All Employees
  static Future<List<Employee>> getEmployees() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(employeeTable);
    return List.generate(maps.length, (i) {
      return Employee.fromMap(maps[i]);
    });
  }

  // Update Employee
  static Future<int> updateEmployee(Employee employee) async {
    Database db = await database;
    return await db.update(
      employeeTable,
      employee.toMap(),
      where: 'id = ?',
      whereArgs: [employee.id],
    );
  }

  // Delete Employee
  static Future<int> deleteEmployee(int id) async {
    Database db = await database;
    return await db.delete(
      employeeTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
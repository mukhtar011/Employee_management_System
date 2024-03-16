class Employee {
  int? id;
  String name;
  int salary;

  Employee({this.id, required this.name, required this.salary});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'salary': salary,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      name: map['name'],
      salary: map['salary'],
    );
  }
}
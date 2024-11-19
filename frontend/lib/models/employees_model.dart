import 'package:frontend/models/departments_model.dart';
import 'package:frontend/models/skills_model.dart';

class EmployeesModel {
  final int id;
  final String name;
  final String position;
  final double salary;
  final String hireDate;
  final String email;
  final DepartmentsModel department;
  final List<SkillsModel> skills;
  final EmployeesModel? manager;

  EmployeesModel({
    required this.id,
    required this.name,
    required this.position,
    required this.salary,
    required this.hireDate,
    required this.email,
    required this.department,
    required this.skills,
    required this.manager,
  });

  // From Json
  factory EmployeesModel.fromJson(Map<String, dynamic> json) {
    return EmployeesModel(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      salary: json['salary'],
      hireDate: json['hire_date'],
      email: json['email'],
      department: DepartmentsModel.fromJson(json['department']),
      skills: (json['skills'] as List).map((skill) => SkillsModel.fromJson(skill)).toList(),
      manager: json['manager'] != null ? EmployeesModel.fromJson(json['manager']) : null,
    );
  }
}

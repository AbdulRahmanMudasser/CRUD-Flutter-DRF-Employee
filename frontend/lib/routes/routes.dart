import 'package:frontend/views/deparment/departments_view.dart';
import 'package:frontend/views/employee/employees_view.dart';
import 'package:frontend/views/skill/skills_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const employee = '/employee';
  static const department = '/department';
  static const skill = '/skill';

  static final routes = [
    GetPage(name: employee, page: () => EmployeeView()),
    GetPage(name: department, page: () => DepartmentView()),
    GetPage(name: skill, page: () => SkillView()),
  ];
}

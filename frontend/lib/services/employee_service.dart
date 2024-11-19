import 'dart:convert';

import 'package:frontend/models/employees_model.dart';
import 'package:frontend/utils/config.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  // Fetch All Employees
  static Future<List<EmployeesModel>> getEmployees() async {
    final response = await http.get(Uri.parse("${Config.baseURL}/employees"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((employee) => EmployeesModel.fromJson(employee)).toList();
    } else {
      throw Exception("Failed to Load Employees");
    }
  }
}
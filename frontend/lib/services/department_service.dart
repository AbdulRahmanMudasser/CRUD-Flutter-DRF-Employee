import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/departments_model.dart';
import 'package:frontend/utils/config.dart';
import 'package:http/http.dart' as http;

class DepartmentService {
  // Fetch All Departments
  static Future<List<DepartmentsModel>> fetchDepartments() async {
    final response = await http.get(Uri.parse("${Config.baseURL}/departments/"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((department) => DepartmentsModel.fromJson(department)).toList();
    } else {
      debugPrint(json.decode(response.body));
      throw Exception("Failed to Load Departments");
    }
  }
}
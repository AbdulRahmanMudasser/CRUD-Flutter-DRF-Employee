import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/departments_model.dart';
import 'package:frontend/utils/config.dart';
import 'package:http/http.dart' as http;

class DepartmentService {
  // Create New Department
  static Future<DepartmentsModel?> addDepartment(String name) async {
    final response = await http.post(
      Uri.parse("${Config.baseURL}/departments/"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {'name': name},
      ),
    );

    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);

      return DepartmentsModel.fromJson(jsonResponse);
    } else {
      debugPrint(json.decode(response.body));
      return null;
    }
  }

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

  // Update Department
  static Future<DepartmentsModel?> updateDepartment(int id, String name) async {
    final response = await http.put(
      Uri.parse("${Config.baseURL}/department/$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {'name': name},
      ),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return DepartmentsModel.fromJson(jsonResponse);
    } else {
      debugPrint(json.decode(response.body));
      return null;
    }
  }

  // Delete Department
  static Future<bool> deleteDepartment(int id) async {
    final response = await http.delete(Uri.parse("${Config.baseURL}/department/$id"));

    return response.statusCode == 200;
  }
}

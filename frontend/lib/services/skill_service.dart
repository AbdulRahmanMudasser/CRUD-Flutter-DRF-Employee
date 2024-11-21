import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/skills_model.dart';
import 'package:frontend/utils/config.dart';
import 'package:http/http.dart' as http;

class SkillService {
  // Add Skill
  static Future<SkillsModel?> addSkill(String name) async {
    final response = await http.post(
      Uri.parse("${Config.baseURL}/skills/"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {'name': name},
      ),
    );

    if (response.statusCode == 201) {
      var jsonResponse = json.decode(response.body);

      return SkillsModel.fromJson(jsonResponse);
    } else {
      debugPrint(json.decode(response.body));
      return null;
    }
  }

  // Fetch All Skills
  static Future<List<SkillsModel>> fetchSkills() async {
    final response = await http.get(Uri.parse("${Config.baseURL}/skills/"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((skill) => SkillsModel.fromJson(skill)).toList();
    } else {
      throw Exception("Failed to Load Skills");
    }
  }

  // Update Skill
  static Future<SkillsModel?> updateSkill(int id, String name) async {
    final response = await http.put(
      Uri.parse("${Config.baseURL}/skill/$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {'name': name},
      ),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return SkillsModel.fromJson(jsonResponse);
    } else {
      debugPrint(json.decode(response.body));
      return null;
    }
  }

  // Delete Skill
  static Future<bool> deleteSkill(int id) async {
    final response = await http.delete(Uri.parse("${Config.baseURL}/skill/$id"));

    return response.statusCode == 200;
  }
}

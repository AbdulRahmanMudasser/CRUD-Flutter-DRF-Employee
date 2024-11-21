import 'package:flutter/cupertino.dart';
import 'package:frontend/methods/snack_bar.dart';
import 'package:frontend/services/skill_service.dart';
import 'package:get/get.dart';

class SkillController extends GetxController {
  var skills = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchSkills();

    super.onInit();
  }

  // Add New Skill
  void addSkill(String name) async {
    try {
      isLoading(true);

      var newSkill = await SkillService.addSkill(name);

      if (newSkill != null) {
        skills.add(newSkill);
      }
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Fetch All Skills
  void fetchSkills() async {
    try {
      isLoading(true);

      var skillsList = await SkillService.fetchSkills();

      skills.assignAll(skillsList);
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Update Skill
  void updateSkill(int id, String name) async {
    try {
      isLoading(true);

      var updatedSkill = await SkillService.updateSkill(id, name);

      if (updatedSkill != null) {
        int index = skills.indexWhere((skill) => skill.id == id);

        skills[index] = updatedSkill;
      }
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Delete Skill
  void deleteSkill(int id) async {
    try {
      isLoading(true);

      bool success = await SkillService.deleteSkill(id);

      if (success) {
        skills.removeWhere((skill) => skill.id == id);
      }
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }
}

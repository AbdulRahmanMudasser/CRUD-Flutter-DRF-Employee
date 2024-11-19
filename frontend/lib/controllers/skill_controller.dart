import 'package:flutter/cupertino.dart';
import 'package:frontend/methods/snack_bar.dart';
import 'package:frontend/services/skills_service.dart';
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

      var newSkill = await SkillsService.addSkill(name);

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

      var skillsList = await SkillsService.fetchSkills();

      skills.assignAll(skillsList);
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/controllers/skill_controller.dart';
import 'package:frontend/models/skills_model.dart';
import 'package:get/get.dart';

void skillDialog(
    BuildContext context,
    SkillController controller,
    SkillsModel? skill,
    bool updateSkill,
    ) {
  final nameController = TextEditingController(text: updateSkill ? skill!.name : '');

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        actions: [
          FilledButton(
            style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10)),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(fontSize: 12),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10)),
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                updateSkill
                    ? controller.updateSkill(skill!.id, nameController.text)
                    : controller.addSkill(nameController.text);
                Get.back();
              }
            },
            child: Text(
              updateSkill ? "Update" : "Add",
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      );
    },
  );
}

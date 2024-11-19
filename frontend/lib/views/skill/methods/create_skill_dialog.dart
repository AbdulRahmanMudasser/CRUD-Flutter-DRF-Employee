import 'package:flutter/material.dart';
import 'package:frontend/controllers/skill_controller.dart';
import 'package:get/get.dart';

void createSkillDialog(BuildContext context, SkillController controller) {
  final nameController = TextEditingController();

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
            const SizedBox(height: 10),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              controller.addSkill(nameController.text);
              Get.back();
            },
            child: const Text("Add"),
          ),
        ],
      );
    },
  );
}

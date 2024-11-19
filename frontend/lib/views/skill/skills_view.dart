import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/skill_controller.dart';
import 'methods/create_skill_dialog.dart';

class SkillsView extends StatelessWidget {
  SkillsView({super.key});

  final SkillController controller = Get.put(SkillController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Skills",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 25),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataTextStyle: const TextStyle(fontSize: 12),
                      headingTextStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      dividerThickness: 0,
                      border: TableBorder.all(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      headingRowHeight: 45,
                      showBottomBorder: true,
                      sortColumnIndex: 0,
                      columns: const [
                        DataColumn(label: Text("Id")),
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Edit")),
                        DataColumn(label: Text("Delete")),
                      ],
                      rows: controller.skills
                          .map((skill) => DataRow(
                                cells: [
                                  DataCell(Text(skill.id.toString())),
                                  DataCell(Text(skill.name)),
                                  DataCell(
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: const Icon(Icons.edit, size: 18),
                                      ),
                                    ),
                                  ),
                                  const DataCell(
                                    Center(child: Icon(Icons.delete, size: 18)),
                                  ),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createSkillDialog(context, controller),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const CircleBorder(),
        hoverElevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
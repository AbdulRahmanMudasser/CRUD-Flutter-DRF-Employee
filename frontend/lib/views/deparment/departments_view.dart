import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../controllers/department_controller.dart';

class DepartmentView extends StatelessWidget {
  DepartmentView({super.key});

  final DepartmentController controller = Get.put(DepartmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataTextStyle: const TextStyle(fontSize: 12),
                headingTextStyle: const TextStyle(
                  fontSize: 14,
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
                ],
                rows: controller.departments
                    .map((department) => DataRow(
                          cells: [
                            DataCell(Text(department.id.toString())),
                            DataCell(Text(department.name)),
                          ],
                        ))
                    .toList(),
              ),
            );
          }
        }),
      ),
    );
  }
}

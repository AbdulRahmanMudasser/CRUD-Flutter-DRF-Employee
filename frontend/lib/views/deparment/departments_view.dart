import 'package:flutter/material.dart';
import 'package:frontend/views/deparment/methods/department_dialog.dart';
import 'package:get/get.dart';

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
                    "Departments List",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 25),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataTextStyle: const TextStyle(fontSize: 12),
                      headingTextStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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
                      rows: controller.departments
                          .map((department) => DataRow(
                                cells: [
                                  DataCell(Text(department.id.toString())),
                                  DataCell(Text(department.name)),
                                  DataCell(
                                    Center(
                                      child: GestureDetector(
                                        onTap: () => departmentDialog(context, controller, department, true),
                                        child:  Icon(
                                          Icons.edit,
                                          size: 18,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: GestureDetector(
                                        onTap: () => controller.deleteDepartment(department.id),
                                        child: Icon(
                                          Icons.delete,
                                          size: 18,
                                          color: Theme.of(context).primaryColorDark,
                                        ),
                                      ),
                                    ),
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
        onPressed: () => departmentDialog(context, controller, null, false),
        hoverElevation: 0,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/controllers/employee_controller.dart';
import 'package:get/get.dart';

class EmployeesView extends StatelessWidget {
  EmployeesView({super.key});

  final EmployeeController controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
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
                    DataColumn(label: Text("Position")),
                    DataColumn(label: Text("Salary"), numeric: true),
                    DataColumn(label: Text("Hire Date")),
                    DataColumn(label: Text("Email")),
                    DataColumn(label: Text("Department")),
                    DataColumn(label: Text("Skills")),
                    DataColumn(label: Text("Manager")),
                    DataColumn(label: Text("Edit")),
                    DataColumn(label: Text("Delete")),
                  ],
                  rows: controller.employees
                      .map(
                        (employee) => DataRow(
                          cells: [
                            DataCell(Text(employee.id.toString())),
                            DataCell(Text(employee.name)),
                            DataCell(Text(employee.position)),
                            DataCell(Text(employee.salary.toString())),
                            DataCell(Text(employee.hireDate)),
                            DataCell(Text(employee.email)),
                            DataCell(Text(employee.department)),
                            DataCell(Text(employee.skills)),
                            DataCell(Text(employee.manager)),
                            const DataCell(Icon(Icons.edit, size: 10)),
                            const DataCell(Icon(Icons.delete, size: 10)),
                          ],
                        ),
                      )
                      .toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

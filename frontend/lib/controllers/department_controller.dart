import 'package:flutter/material.dart';
import 'package:frontend/methods/snack_bar.dart';
import 'package:frontend/services/department_service.dart';
import 'package:get/get.dart';

class DepartmentController extends GetxController {
  var departments = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchDepartments();

    super.onInit();
  }

  // Create New Department
  void addDepartment(String name) async {
    try {
      isLoading(true);

      var newDepartment = await DepartmentService.addDepartment(name);

      if (newDepartment != null) {
        departments.add(newDepartment);
      }
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Fetch All Departments
  void fetchDepartments() async {
    try {
      isLoading(true);

      var departmentsList = await DepartmentService.fetchDepartments();

      departments.assignAll(departmentsList);
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Update Department
  void updateDepartment(int id, String name) async {
    try {
      isLoading(true);

      var updatedDepartment = await DepartmentService.updateDepartment(id, name);

      if (updatedDepartment != null) {
        int index = departments.indexWhere((department) => department.id == id);

        departments[index] = updatedDepartment;
      }
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Delete Department
  void deleteDepartment(int id) async {
    try {
      isLoading(true);

      bool success = await DepartmentService.deleteDepartment(id);

      if (success) {
        departments.removeWhere((department) => department.id == id);
      }
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    } finally {
      isLoading(false);
    }
  }
}

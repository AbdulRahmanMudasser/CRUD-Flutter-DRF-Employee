import 'package:flutter/material.dart';
import 'package:frontend/services/department_service.dart';
import 'package:frontend/services/employee_service.dart';
import 'package:get/get.dart';

class DepartmentController extends GetxController {
  var departments = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchDepartments();

    super.onInit();
  }

  // Fetch All Departments
  void fetchDepartments() async {
    try {
      isLoading(true);

      var departmentsList = await DepartmentService.fetchDepartments();

      departments.assignAll(departmentsList);
    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          behavior: SnackBarBehavior.floating,
          width: Get.width / 2,
        ),
        snackBarAnimationStyle: AnimationStyle(
          curve: Curves.ease,
          duration: const Duration(seconds: 1),
        ),
      );
    } finally {
      isLoading(false);
    }
  }
}

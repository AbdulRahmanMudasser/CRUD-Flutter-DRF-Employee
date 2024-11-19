import 'package:frontend/services/employee_service.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController{
  var employees = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchEmployee();

    super.onInit();
  }

  // Fetch Employees
  void fetchEmployee() async {
    try {
      isLoading(true);

      var employeesList = await EmployeeService.getEmployees();

      employees.assignAll(employeesList);
    } finally {
      isLoading(false);
    }
  }
}
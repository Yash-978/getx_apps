import 'package:get/get.dart';

import '../UserModel/userModel.dart';


// class EmployeeController extends GetxController {
//   RxList<EmployeeDataModal> employeeList = <EmployeeDataModal>[].obs;
//
//   void addEmployeeData(Map employee) {
//     employeeList.add(
//       EmployeeDataModal.fromMap(employee),
//     );
//   }
//
//   void deleteEmployeeData(int index) {
//     employeeList.removeAt(index);
//   }
//
//   void updateEmployeeData(int index, Map employee) {
//     employeeList.removeAt(index);
//     employeeList.insert(index, EmployeeDataModal.fromMap(employee));
//   }
// }
class EmployeeController extends GetxController {
  RxList<EmployeeModal> employeeList = <EmployeeModal>[].obs;

  void addEmployeeData(Map employee) {
    employeeList.add(
      EmployeeModal.formJson(employee),
    );
  }

  void deleteEmployeeData(int index) {
    employeeList.removeAt(index);
  }

  void updateEmployeeData(int index, Map employee) {
    employeeList.removeAt(index);
    employeeList.insert(index, EmployeeModal.formJson(employee));
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/UserData/UserView/Screens/UserDataView.dart';

import '../UserModel/userModel.dart';

class EmployController extends GetxController {
  RxList<EmployeeDataModel> employDataList = <EmployeeDataModel>[].obs;

  void addEmployData(Map employee) {
    EmployeeDataModel employeeDataModel = EmployeeDataModel.fromMap(employee);
    employDataList.add(employeeDataModel);
  }

  void removeEmployee(int index) {
    employDataList.removeAt(index);
  }

  void updateEmployee(int index, Map updatedEmployee) {
    EmployeeDataModel updatedEmployeeModal =
        EmployeeDataModel.fromMap(updatedEmployee);
    employDataList[index] = updatedEmployeeModal;
  }
}
// class EmployController extends GetxController {
//   RxList<EmployeeDataModel> employDataList = <EmployeeDataModel>[].obs;
//
//   void addEmployData(Map employee) {
//     employDataList.add(EmployeeDataModel.fromMap(employee));
//   }
//
//   void saveEmployeeData(int index) {
//     employDataList[index].id = int.parse(txtId.text);
//     employDataList[index].name = txtName.text;
//     employDataList[index].designation = txtDesignation.text;
//     employDataList.refresh();
//   }
//
//   void removeEmployee(int index) {
//     employDataList.removeAt(index);
//   }
//
//   void updateEmployee(int index) {
//     txtId = TextEditingController(text: employDataList[index].id.toString());
//     txtDesignation =
//         TextEditingController(text: employDataList[index].designation);
//     txtName = TextEditingController(text: employDataList[index].name);
//   }
// }

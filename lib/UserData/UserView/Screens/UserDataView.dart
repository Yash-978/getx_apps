import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/UserData/UserController/userController.dart';

TextEditingController txtId = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtDesignation = TextEditingController();
EmployeeController employController = Get.put(EmployeeController());

class UserdataPage extends StatelessWidget {
  const UserdataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Employee Data',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: employeeController.employeeList.length,
            itemBuilder: (context, index) => Card(
              color: Colors.grey.shade300,
              child: ListTile(
                leading:
                    Text(employeeController.employeeList[index].id.toString()),
                title: Text(employeeController.employeeList[index].name),
                subtitle:
                    Text(employeeController.employeeList[index].designation),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Update Details'),
                            actions: [
                              inputDetails(
                                label: 'ID',
                                controller: txtId,
                              ),
                              inputDetails(
                                label: 'Name',
                                controller: txtName,
                              ),
                              inputDetails(
                                label: 'Designation',
                                controller: txtDesignation,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  employeeController.updateEmployeeData(index, {
                                    'id': txtId.text,
                                    'name': txtName.text,
                                    'designation': txtDesignation.text,
                                  });
                                  txtName.clear();
                                  txtId.clear();
                                  txtDesignation.clear();
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        employeeController.deleteEmployeeData(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Employ Data',
        splashColor: Colors.green,
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Form(
              key: formKey,
              child: AlertDialog(
                title: const Text('Enter Details'),
                actions: [

                  inputDetails(
                    label: 'Name',
                    controller: txtName,
                  ),
                  inputDetails(
                    label: 'ID',
                    controller: txtId,
                  ),
                  inputDetails(
                    label: 'Designation',
                    controller: txtDesignation,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          bool response = formKey.currentState!.validate();
                          if (response) {
                            employeeController.addEmployeeData({
                              'id': txtId.text,
                              'name': txtName.text,
                              'designation': txtDesignation.text,
                            });
                            txtName.clear();
                            txtId.clear();
                            txtDesignation.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

GlobalKey<FormState> formKey = GlobalKey();
// var txtId = TextEditingController();
// var txtName = TextEditingController();
// var txtDesignation = TextEditingController();
// var txtContact = TextEditingController();
final employeeController = Get.put(EmployeeController());

TextFormField inputDetails({
  required String label,
  required TextEditingController controller,
}) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'Required';
      } else {
        return null;
      }
    },
    controller: controller,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      label: Text(label),
      labelStyle: const TextStyle(color: Colors.black),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.black,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.black,
        ),
      ),
    ),
  );
}

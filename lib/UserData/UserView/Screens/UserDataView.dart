import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/UserData/UserController/userController.dart';

TextEditingController txtId = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtDesignation = TextEditingController();
EmployController employController = Get.put(EmployController());

class UserdataPage extends StatelessWidget {
  const UserdataPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(AlertDialog(
            title: Text('Add Employee Data'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: txtName,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                TextField(
                  controller: txtId,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Employee Id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                TextField(
                  controller: txtDesignation,
                  decoration: InputDecoration(
                      labelText: 'Designation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  final Map newEmployee = {
                    'name': txtName.text,
                    'designation': txtDesignation.text,
                    'id': int.parse(txtId.text),
                  };
                  employController.addEmployData(newEmployee);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  minimumSize: const Size(100, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: .75),
                ), // Button ka text
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  minimumSize: const Size(100, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: .75),
                ), // Button ka text
              ),
            ],
          ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Employees'),
      ),
      body: SizedBox(
        height: h*1,
        child: Obx(
          () => ListView.builder(
            itemCount: employController.employDataList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(employController.employDataList[index].name),
                  subtitle:
                      Text(employController.employDataList[index].designation),
                  leading:
                      Text(employController.employDataList[index].id.toString()),
                  trailing: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          txtName.text =
                              employController.employDataList[index].name;
                          txtId.text = employController.employDataList[index].id
                              .toString();
                          txtDesignation.text =
                              employController.employDataList[index].designation;
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          employController.removeEmployee(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

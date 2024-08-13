
class EmployeeDataModel {
  late String name, designation;
  late int id;

  EmployeeDataModel(
      {required this.name, required this.designation, required this.id});

  factory EmployeeDataModel.fromMap(Map m1) {
    return EmployeeDataModel(
        name: m1['name'], designation: m1['designation'], id: m1['id']);
  }
}

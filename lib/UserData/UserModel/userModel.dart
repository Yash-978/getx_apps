
// class EmployeeDataModal {
//   late String name, designation;
//   late int id;
//
//   EmployeeDataModal(
//       {required this.name, required this.designation, required this.id});
//
//   factory EmployeeDataModal.fromMap(Map m1) {
//     return EmployeeDataModal(
//         name: m1['name'], designation: m1['designation'], id: m1['id']);
//   }
// }
class EmployeeModal {
  late String id, name, designation;

  EmployeeModal(
      this.id,
      this.name,
      this.designation,
      );

  factory EmployeeModal.formJson(Map m1) {
    return EmployeeModal(
      m1['id'],
      m1['name'],
      m1['designation'],
    );
  }
}
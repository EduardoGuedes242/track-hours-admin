import 'package:panel_admin/src/home/employee/api/model.dart';
import 'package:panel_admin/src/home/employee/api/service.dart';

class EmployeeRepository {
  Future<List<EmployeeModel>> getEmployees() async {
    try {
      return await ApiEmployeeService().buscarFuncionarios();
    } catch (e) {
      print('Erro ao buscar despesas: $e');
      return [];
    }
  }

  Future<void> createNewEmployee({
    int? id,
    required String name,
    required String document,
    required DateTime dateOfBirth,
    required String password,
    required String status,
    required String position,
    required String contact,
  }) async {
    try {
      EmployeeModel employee = EmployeeModel(
        id: id,
        name: name,
        document: document,
        dateOfBirth: dateOfBirth,
        password: password,
        status: status,
        position: position,
        contact: contact,
      );

      await ApiEmployeeService().createNewEmployee(employee);
    } catch (e) {
      print('Erro ao criar novo Funcinario: $e');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:panel_admin/src/common/global.dart';
import 'package:panel_admin/src/home/employee/api/model.dart';

class ApiEmployeeService {
  Future<List<EmployeeModel>> buscarFuncionarios() async {
    final url = Uri.parse('$ulrBase/employee');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = json.decode(decodedBody);

      return data.map((json) => EmployeeModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao buscar despesas: ${response.statusCode}');
    }
  }

  Future<void> createNewEmployee(EmployeeModel employee) async {
    final url = Uri.parse('$ulrBase/employee');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = json.encode(employee.toJson());
    print(body);

    await http.post(url, headers: headers, body: body);
  }
}

import 'dart:convert';

import 'package:panel_admin/src/common/global.dart';
import 'package:http/http.dart' as http;
import 'package:panel_admin/src/home/menager_hours/api/model.dart';

class ApiMenagerHoursService {
  Future<MenagerHoursModel> menagerHoursForEmployee({
    required String idEmployee,
  }) async {
    final url = Uri.parse('$ulrBase/manege-hours/$idEmployee');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final dynamic data = json.decode(decodedBody);

      return MenagerHoursModel.fromJson(data);
    } else {
      throw Exception('Falha ao buscar despesas: ${response.statusCode}');
    }
  }
}

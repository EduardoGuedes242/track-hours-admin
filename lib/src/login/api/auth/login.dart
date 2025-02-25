import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panel_admin/src/common/global.dart';

Future<void> fetchToken({
  required String aEmail,
  required String aPassword,
}) async {
  final url = Uri.parse('$ulrBase/auth/user');

  final username = aEmail;
  final password = aPassword;
  final credentials = base64Encode(utf8.encode('$username:$password'));

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic $credentials',
  };

  final body = jsonEncode({});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    final token = response.body;
    print('Token: $token');
  } else {
    print('Erro na requisição: ${response.statusCode}');
    print('Resposta: ${response.body}');
  }
}

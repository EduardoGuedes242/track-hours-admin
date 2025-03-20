import 'package:intl/intl.dart'; // Importe o pacote intl para formatar datas

class EmployeeModel {
  final int? id;
  final int? tenantId;
  final String name;
  final String document;
  final DateTime dateOfBirth;
  final String password;
  final String status;
  final String position;
  final String contact;

  EmployeeModel({
    this.id,
    this.tenantId,
    required this.name,
    required this.document,
    required this.dateOfBirth,
    required this.password,
    required this.status,
    required this.position,
    required this.contact,
  });

  // Método para converter de JSON para EmployeeModel
  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      tenantId: json['tenantId'],
      name: json['name'],
      document: json['document'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      password: json['password'],
      status: json['status'],
      position: json['position'],
      contact: json['contact'],
    );
  }

  // Método para converter EmployeeModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenantId': tenantId,
      'name': name,
      'document': document,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'password': password,
      'status': status,
      'position': position,
      'contact': contact,
    };
  }

  // Método para formatar a data no formato DD/MM/AAAA
  String get formattedDateOfBirth {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateOfBirth);
  }
}

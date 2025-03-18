class EmployeeModel {
  int? id;
  int? tenantId;
  String? name;
  String? document;
  String? dateOfBirth;
  String? password;
  String? status;
  String? position;
  String? contact;

  EmployeeModel({
    this.id,
    this.tenantId,
    this.name,
    this.document,
    this.dateOfBirth,
    this.password,
    this.status,
    this.position,
    this.contact,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenantId'];
    name = json['name'];
    document = json['document'];
    dateOfBirth = json['dateOfBirth'];
    password = json['password'];
    status = json['status'];
    position = json['position'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenantId'] = this.tenantId;
    data['name'] = this.name;
    data['document'] = this.document;
    data['dateOfBirth'] = this.dateOfBirth;
    data['password'] = this.password;
    data['status'] = this.status;
    data['position'] = this.position;
    data['contact'] = this.contact;
    return data;
  }
}

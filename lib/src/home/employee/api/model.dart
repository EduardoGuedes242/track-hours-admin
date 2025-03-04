class EmployeeModel {
  int? id;
  int? tenantId;
  String? name;
  String? document;
  String? dateOfBirth;
  String? password;
  bool? active;

  EmployeeModel({
    this.id,
    this.tenantId,
    this.name,
    this.document,
    this.dateOfBirth,
    this.password,
    this.active,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenantId'];
    name = json['name'];
    document = json['document'];
    dateOfBirth = json['dateOfBirth'];
    password = json['password'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenantId'] = this.tenantId;
    data['name'] = this.name;
    data['document'] = this.document;
    data['dateOfBirth'] = this.dateOfBirth;
    data['password'] = this.password;
    data['active'] = this.active;
    return data;
  }
}

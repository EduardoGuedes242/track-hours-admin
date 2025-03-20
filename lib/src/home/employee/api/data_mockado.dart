import 'package:panel_admin/src/home/employee/api/model.dart';
import 'package:panel_admin/src/home/menager_hours/api/model.dart';

List<EmployeeModel> dataMockListEmployee = [
  EmployeeModel.fromJson({
    "id": 3,
    "tenantId": 7,
    "name": "Luana Guedes",
    "document": "180.951.217-46",
    "dateOfBirth": "1992-03-09T03:00:00.000+00:00",
    "password":
        "\$2a\$10\$GiseHkdvwOFr7A9KRWbeiOmg/PYPhWVjdm42puLfOzR/gIAQrsAGy",
    "status": "Aviso",
    "position": "Programador",
    "contact": "(27) 99284-1161",
  }),
  EmployeeModel.fromJson({
    "id": 10,
    "tenantId": 7,
    "name": "Joao Kleber",
    "document": "123.456.789-10",
    "dateOfBirth": "1992-03-10T00:00:00.000+00:00",
    "password": "password",
    "status": "Experiencia",
    "position": "Aux Administrativo",
    "contact": "(12) 97897-5478",
  }),
  EmployeeModel.fromJson({
    "id": 11,
    "tenantId": 7,
    "name": "Eduardo Melgaço",
    "document": "163.011.777-38",
    "dateOfBirth": "2002-02-14T00:00:00.000+00:00",
    "password": "3064",
    "status": "Experiencia",
    "position": "Secretaria",
    "contact": "(27) 99284-1161",
  }),
];

MenagerHoursModel mockModel = MenagerHoursModel(
  eplId: 3,
  eplName: "Luana Guedes",
  tmeEntryRecords: [
    TmeEntryRecords.fromJson({
      "tmeDate": "2025-01-09 00:00:00",
      "timeEntry1": "08:00:00",
      "timeEntry2": "23:00:00",
      "timeEntry3": null,
      "timeEntry4": null,
      "totalHours": "15:00",
    }),

    TmeEntryRecords.fromJson({
      "tmeDate": "2025-01-10 00:00:00",
      "timeEntry1": "08:00:00",
      "timeEntry2": "11:00:00",
      "timeEntry3": "12:00:00",
      "timeEntry4": "18:00:00",
      "totalHours": "09:00",
    }),
  ],
);

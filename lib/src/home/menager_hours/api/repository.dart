import 'package:panel_admin/src/home/menager_hours/api/model.dart';
import 'package:panel_admin/src/home/menager_hours/api/service.dart';

class MenagerHoursRepository {
  Future<MenagerHoursModel> menagerHoursForEmployeeRepository({
    required String idEmployee,
  }) async {
    try {
      return await ApiMenagerHoursService().menagerHoursForEmployee(
        idEmployee: idEmployee,
      );
    } catch (e) {
      print('Erro ao buscar despesas: $e');
      return MenagerHoursModel();
    }
  }
}

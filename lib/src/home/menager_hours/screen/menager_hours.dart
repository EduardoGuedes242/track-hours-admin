import 'package:flutter/material.dart';
import 'package:panel_admin/src/common/Cores.dart';
import 'package:panel_admin/src/home/menager_hours/api/model.dart';
import 'package:panel_admin/src/home/menager_hours/api/repository.dart';
import 'package:panel_admin/src/login/screen/login_page.dart';
import 'package:panel_admin/src/widgets/edit.dart';

class MenagerHoursPage extends StatefulWidget {
  const MenagerHoursPage({super.key});

  @override
  State<MenagerHoursPage> createState() => _MenagerHoursPageState();
}

class _MenagerHoursPageState extends State<MenagerHoursPage> {
  MenagerHoursModel employees = MenagerHoursModel();
  List<DataRow> itensDataRow = [];

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  Future<void> getEmployees() async {
    try {
      MenagerHoursModel allData = await MenagerHoursRepository()
          .menagerHoursForEmployeeRepository(idEmployee: '3');
      List<TmeEntryRecords> lista = allData.tmeEntryRecords!;
      setState(() {
        itensDataRow =
            lista.map((jornada) {
              return DataRow(
                cells: [
                  DataCell(LabelDataCellWidget(label: '01/02/2025')),
                  DataCell(LabelDataCellWidget(label: jornada.timeEntry1!)),
                  DataCell(LabelDataCellWidget(label: jornada.timeEntry2!)),
                  DataCell(LabelDataCellWidget(label: '13:00')),
                  DataCell(LabelDataCellWidget(label: '18:00')),
                  DataCell(LabelDataCellWidget(label: jornada.totalHours!)),
                  DataCell(LabelDataCellWidget(label: '02:00h')),
                ],
              );
            }).toList();
      });
    } catch (e) {
      print('Erro ao carregar funcionários: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 103,
          width: double.infinity,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0XFFFFFFFF),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 10,
            children: [
              EditInputDate(
                width: 160,
                title: 'Data Inicial',
                hintText: '14/02/2025',
                suffixIcon: Icon(Icons.calendar_month),
                controller: TextEditingController(),
              ),
              EditInputDate(
                width: 160,
                title: 'Data Final',
                hintText: '14/03/2025',
                suffixIcon: Icon(Icons.calendar_month),
                controller: TextEditingController(),
              ),
              Expanded(
                child: EditInputWithIcon(
                  title: 'Funcionario',
                  hintText: 'Pesquisa o nome do funcionario',
                  suffixIcon: Icon(Icons.search),
                  controller: TextEditingController(),
                ),
              ),

              ButtonProprio(
                title: 'Novo Funcionario',
                onClick: () {},
                width: 250,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFFFFFF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Funcionario: Bruno Eduardo Melgaço Guedes',
                  style: TextStyle(
                    color: PaletaCores.textoPreto,
                    fontFamily: 'Axiforma',
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      child: DataTable(
                        columnSpacing: 20,

                        columns: [
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Dia',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Marc 1',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Marc 2',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Marc 3',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Marc 4',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),

                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Normais',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Not.',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                        rows: itensDataRow,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LabelDataCellButtonWidget extends StatelessWidget {
  const LabelDataCellButtonWidget({
    super.key,
    required this.label,
    required this.onClick,
  });
  final String label;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Text(
        label,
        style: TextStyle(
          color: PaletaCores.azulPrimairo,
          fontFamily: 'Axiforma',
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
      ),
    );
  }
}

class LabelDataCellWidget extends StatelessWidget {
  const LabelDataCellWidget({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        label,
        style: TextStyle(
          color: PaletaCores.textoPreto,
          fontFamily: 'Axiforma',
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
      ),
    );
  }
}

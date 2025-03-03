import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panel_admin/src/common/Cores.dart';
import 'package:panel_admin/src/login/screen/login_page.dart';
import 'package:panel_admin/src/widgets/edit.dart';

class ListEmployeePage extends StatefulWidget {
  const ListEmployeePage({super.key});

  @override
  State<ListEmployeePage> createState() => _ListEmployeePageState();
}

class _ListEmployeePageState extends State<ListEmployeePage> {
  @override
  Widget build(BuildContext context) {
    var dataRow = DataRow(
      cells: [
        DataCell(LabelDataCellWidget(label: 'Bruno Eduardo Melgaço Guedes')),
        DataCell(LabelDataCellWidget(label: '163.011.777-38')),
        DataCell(LabelDataCellWidget(label: '14/02/2002')),
        DataCell(LabelDataCellWidget(label: 'Admitido')),
        DataCell(LabelDataCellButtonWidget(label: 'Ajustes', onClick: () {})),
      ],
    );
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
            children: [
              SizedBox(
                width: 400,
                child: EditInputWithIcon(
                  title: 'Pesquisa rapida de funcionarios',
                  hintText: 'Digite o nome do funcionario aqui',
                  suffixIcon: Icon(Icons.search),
                  controller: TextEditingController(),
                ),
              ),
              Spacer(),
              ButtonProprio(
                title: 'Novo Funcionario',
                onClick: () {
                  context.go('/employee-form');
                },
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
                  'Todos os Funcionarios',
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
                                'Nome',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Documento',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Nascimento',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Status',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Ações',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                        rows: [
                          dataRow,
                          dataRow,
                          dataRow,
                          dataRow,
                          dataRow,
                          dataRow,
                        ],
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
          fontSize: 13,
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
          fontSize: 13,
        ),
      ),
    );
  }
}

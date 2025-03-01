import 'package:flutter/material.dart';
import 'package:panel_admin/src/common/Cores.dart';

class ListDashoboardWidget extends StatelessWidget {
  const ListDashoboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: (MediaQuery.sizeOf(context).width - 300) / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 0),
            child: Text(
              'Titulo',
              style: TextStyle(
                color: PaletaCores.textoPreto,
                fontFamily: 'Axiforma',
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Nome',
                      style: TextStyle(
                        color: PaletaCores.textoNegrito,
                        fontFamily: 'Axiforma',
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(
                        color: PaletaCores.textoNegrito,
                        fontFamily: 'Axiforma',
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [DataCell(Text('Maria')), DataCell(Text('Ativo'))],
                  ),
                  DataRow(
                    cells: [DataCell(Text('Pedro')), DataCell(Text('Ativo'))],
                  ),
                  DataRow(
                    cells: [DataCell(Text('Lucas')), DataCell(Text('Inativo'))],
                  ),
                  DataRow(
                    cells: [DataCell(Text('Bruno')), DataCell(Text('Ativo'))],
                  ),
                  DataRow(
                    cells: [DataCell(Text('Maria')), DataCell(Text('Ativo'))],
                  ),
                  DataRow(
                    cells: [DataCell(Text('Pedro')), DataCell(Text('Ativo'))],
                  ),
                  DataRow(
                    cells: [DataCell(Text('Lucas')), DataCell(Text('Inativo'))],
                  ),
                  DataRow(
                    cells: [DataCell(Text('Bruno')), DataCell(Text('Ativo'))],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
                onClick: () {},
                width: 250,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

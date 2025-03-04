import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panel_admin/src/common/Cores.dart';
import 'package:panel_admin/src/home/employee/api/repository.dart';
import 'package:panel_admin/src/login/screen/login_page.dart';
import 'package:panel_admin/src/widgets/edit.dart';

class FormEmployeePage extends StatefulWidget {
  final String? employeeId;
  const FormEmployeePage({super.key, this.employeeId});

  @override
  State<FormEmployeePage> createState() => _FormEmployeePageState();
}

class _FormEmployeePageState extends State<FormEmployeePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.employeeId);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () => context.go('/employee'),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, color: PaletaCores.azulPrimairo),
                SizedBox(height: 5),
                Text(
                  'Voltar',
                  style: TextStyle(
                    color: PaletaCores.azulPrimairo,
                    fontFamily: 'Axiforma',
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0XFFFFFFFF),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.employeeId != null
                    ? 'Editar Funcionario'
                    : 'Novo Funcionario',
                style: TextStyle(
                  color: PaletaCores.textoPreto,
                  fontFamily: 'Axiforma',
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Column(
                  spacing: 20,

                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: EditInput(
                            title: 'Nome Completo',
                            hintText: 'Nome do funcionario',
                            controller: TextEditingController(),
                          ),
                        ),
                        Expanded(
                          child: EditInput(
                            title: 'CPF Funcionario',
                            hintText: 'Informe o CPF do funcionario',
                            controller: TextEditingController(),
                          ),
                        ),
                        Expanded(
                          child: EditInput(
                            title: 'Data Nascimento',
                            hintText: 'Data de nascimento do funcionario',
                            controller: TextEditingController(),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: EditInput(
                            title: 'Nome Completo',
                            hintText: 'Nome do funcionario',
                            controller: TextEditingController(),
                          ),
                        ),
                        Expanded(
                          child: EditInput(
                            title: 'CPF Funcionario',
                            hintText: 'Informe o CPF do funcionario',
                            controller: TextEditingController(),
                          ),
                        ),
                        Expanded(
                          child: EditInput(
                            title: 'Data Nascimento',
                            hintText: 'Data de nascimento do funcionario',
                            controller: TextEditingController(),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    ButtonProprio(
                      title: 'Salvar dados',
                      onClick: () {
                        EmployeeRepository().createNewEmployee(
                          id:
                              widget.employeeId != null
                                  ? int.parse(widget.employeeId!)
                                  : null,
                          name: 'Luana Guedes',
                          document: '163.011.777-38',
                          dateOfBirth: '1992-03-10',
                          password: 'password',
                          active: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

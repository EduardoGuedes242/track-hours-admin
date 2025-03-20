import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:panel_admin/src/common/Cores.dart';
import 'package:panel_admin/src/common/global.dart';
import 'package:panel_admin/src/home/employee/api/data_mockado.dart';
import 'package:panel_admin/src/home/employee/api/model.dart';
import 'package:panel_admin/src/home/employee/api/repository.dart';
import 'package:panel_admin/src/login/screen/login_page.dart';
import 'package:panel_admin/src/widgets/combobox.dart';
import 'package:panel_admin/src/widgets/edit.dart';
import 'package:quickalert/quickalert.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class FormEmployeePage extends StatefulWidget {
  final String? employeeId;
  const FormEmployeePage({super.key, this.employeeId});

  @override
  State<FormEmployeePage> createState() => _FormEmployeePageState();
}

class _FormEmployeePageState extends State<FormEmployeePage> {
  TextEditingController nameController = TextEditingController();
  String statusEmployee = '';
  String cargoEmployee = '';
  var documentController = MaskedTextController(mask: '000.000.000-00');
  TextEditingController passwordController = TextEditingController();
  var contactController = MaskedTextController(mask: '(00) 00000-0000');
  var dateOfBirthController = MaskedTextController(mask: '00/00/0000');

  bool isLoading = false;

  bool validateForm() {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunction(
          'Erro',
          'O campo Nome Completo é obrigatório.',
          ContentType.failure,
        ),
      );
      return false;
    }

    if (statusEmployee.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunction(
          'Erro',
          'O campo Status Atual é obrigatório.',
          ContentType.failure,
        ),
      );
      return false;
    }

    if (cargoEmployee.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunction(
          'Erro',
          'O campo Cargo/Função é obrigatório.',
          ContentType.failure,
        ),
      );
      return false;
    }

    if (documentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunction(
          'Erro',
          'O campo CPF é obrigatório.',
          ContentType.failure,
        ),
      );
      return false;
    }

    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunction(
          'Erro',
          'O campo Senha é obrigatório.',
          ContentType.failure,
        ),
      );
      return false;
    }

    if (contactController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunction(
          'Erro',
          'O campo Contato/Whatsapp é obrigatório.',
          ContentType.failure,
        ),
      );
      return false;
    }

    if (dateOfBirthController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunction(
          'Erro - Prencher campo',
          'O campo Data de Nascimento é obrigatório.',
          ContentType.failure,
        ),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingIndicator(
          indicatorType: Indicator.ballBeat,
          colors: [PaletaCores.azulPrimairo],
          backgroundColor: Colors.black38,
        )
        : Column(
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
                                hintText: 'Ex: Joao Candito',
                                controller: nameController,
                              ),
                            ),
                            Expanded(
                              child: ComboboxWidget(
                                title: 'Status Atual',
                                hintText: 'Selecione...',
                                options: [
                                  'Contratado',
                                  'Experiencia',
                                  'Demitido',
                                  'Aviso',
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    statusEmployee = value!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: ComboboxWidget(
                                title: 'Cargo/Função',
                                hintText: 'Selecione...',
                                options: [
                                  'Auxiliar ADM',
                                  'Secretaria',
                                  'CEO',
                                  'Programador',
                                  'Zelador',
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    cargoEmployee = value!;
                                  });
                                },
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
                                title: 'CPF',
                                hintText: 'Ex: 123.456.789-10',
                                controller: documentController,
                              ),
                            ),
                            Expanded(
                              child: EditInput(
                                title: 'Senha',
                                hintText: 'Ex: 4312',
                                controller: passwordController,
                                obscureText: true,
                              ),
                            ),
                            Expanded(
                              child: EditInput(
                                title: 'Contado/Whastapp',
                                hintText: 'Ex: (12) 91234-5678',
                                controller: contactController,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            EditInputDate(
                              width: 300,
                              title: 'Data Nascimento',
                              hintText: 'Ex: 14/02/2002',
                              controller: dateOfBirthController,
                              suffixIcon: Icon(Icons.calendar_month_outlined),
                            ),
                          ],
                        ),
                        ButtonProprio(
                          width: 250,
                          title: 'Salvar dados',
                          onClick: () async {
                            if (!validateForm()) {
                              return;
                            }

                            setState(() {
                              isLoading = true;
                            });

                            try {
                              await EmployeeRepository().createNewEmployee(
                                id:
                                    widget.employeeId != null
                                        ? int.parse(widget.employeeId!)
                                        : null,
                                name: nameController.text,
                                document: documentController.text,
                                dateOfBirth: parseDateFromString(
                                  dateOfBirthController.text,
                                ),
                                password: passwordController.text,
                                status: statusEmployee,
                                position: cargoEmployee,
                                contact: contactController.text,
                              );

                              setState(() {
                                isLoading = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                snackBarFunction(
                                  'Sucesso',
                                  'Funcionário salvo com sucesso!',
                                  ContentType.success,
                                ),
                              );

                              // Limpar os campos após o salvamento
                              nameController.clear();
                              statusEmployee = '';
                              cargoEmployee = '';
                              documentController.clear();
                              passwordController.clear();
                              contactController.clear();
                              dateOfBirthController.clear();
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  snackBarFunction(
                                    'Falha',
                                    'Ocorreu a seguinte falha ao tentar salvar dados do funcionário: $e',
                                    ContentType.failure,
                                  ),
                                );
                            }
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

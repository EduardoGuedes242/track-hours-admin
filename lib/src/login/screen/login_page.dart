import 'package:flutter/material.dart';
import 'package:panel_admin/src/common/Cores.dart';
import 'package:panel_admin/src/login/api/auth/login.dart';
import 'package:panel_admin/src/widgets/edit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF041643),
      body:
          !isLoading
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Colors.amber),
                  Container(
                    height: 350,
                    width: 450,
                    margin: EdgeInsets.only(right: 100, top: 100),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          EditInput(
                            title: 'Email',
                            hintText: 'name@email.com',
                            controller: emailController,
                          ),
                          EditInput(
                            title: 'Password',
                            hintText: 'Password',
                            obscureText: true,
                            controller: passwordController,
                          ),
                          Row(
                            children: [
                              Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                ' Sign up',
                                style: TextStyle(
                                  color: PaletaCores.textoNegrito,
                                  fontFamily: 'Axiforma',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  await fetchToken(
                                    aEmail: emailController.text,
                                    aPassword: passwordController.text,
                                  );

                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 126,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: PaletaCores.azulPrimairo,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: PaletaCores.textoButao,
                                        fontFamily: 'Axiforma',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
              : Center(child: CircularProgressIndicator()),
    );
  }
}

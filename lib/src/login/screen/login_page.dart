import 'package:flutter/material.dart';
import 'package:panel_admin/src/common/Cores.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF041643),
      body: Row(
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
                  EditInput(title: 'Email', hintText: 'name@email.com'),
                  EditInput(
                    title: 'Password',
                    hintText: 'Password',
                    obscureText: true,
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
                      Container(
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
                    ],
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

class EditInput extends StatelessWidget {
  const EditInput({
    super.key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
  });
  final String title;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: PaletaCores.textoLabel,
              fontFamily: 'Axiforma',
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          TextField(
            cursorColor: PaletaCores.azulPrimairo,
            obscureText: obscureText,
            decoration: InputDecoration(
              isDense: false,

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: PaletaCores.azulPrimairo),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: PaletaCores.textoBorder),
              ),
              hint: Text(
                hintText,
                style: TextStyle(
                  color: PaletaCores.textoLabel,
                  fontFamily: 'Axiforma',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

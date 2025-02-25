import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:panel_admin/src/common/Cores.dart';

class EditInput extends StatefulWidget {
  const EditInput({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  State<EditInput> createState() => _EditInputState();
}

class _EditInputState extends State<EditInput> {
  late bool isObscureText;

  @override
  void initState() {
    super.initState();
    isObscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: PaletaCores.textoLabel,
              fontFamily: 'Axiforma',
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          TextField(
            controller: widget.controller,
            cursorColor: PaletaCores.azulPrimairo,
            obscureText: isObscureText,
            style: const TextStyle(fontFamily: 'Axiforma', color: Colors.black),
            decoration: InputDecoration(
              isDense: false,
              suffixIcon:
                  widget.obscureText
                      ? IconButton(
                        onPressed: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        icon: SvgPicture.asset(
                          isObscureText
                              ? 'assets/icon/eye-closed.svg'
                              : 'assets/icon/eye-open.svg',
                          color: PaletaCores.textoLabel,
                        ),
                      )
                      : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: PaletaCores.azulPrimairo),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: PaletaCores.textoBorder),
              ),
              hint: Text(
                widget.hintText,
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

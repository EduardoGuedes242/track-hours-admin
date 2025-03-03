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
    this.width = double.infinity,
  });
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final double width;

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
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: PaletaCores.textoNegrito,
              fontFamily: 'Axiforma',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3),
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

class EditInputWithIcon extends StatefulWidget {
  const EditInputWithIcon({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.suffixIcon,
    this.width = double.infinity,
  });
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Widget suffixIcon;
  final double width;

  @override
  State<EditInputWithIcon> createState() => _EditInputWithIconState();
}

class _EditInputWithIconState extends State<EditInputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      width: double.infinity,
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
          SizedBox(height: 3),
          TextField(
            controller: widget.controller,
            cursorColor: PaletaCores.azulPrimairo,
            style: const TextStyle(fontFamily: 'Axiforma', color: Colors.black),

            decoration: InputDecoration(
              isDense: false,

              suffixIcon: widget.suffixIcon,

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

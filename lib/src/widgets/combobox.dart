import 'package:flutter/material.dart';
import 'package:panel_admin/src/common/Cores.dart';

class ComboboxWidget extends StatefulWidget {
  const ComboboxWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.options,
    this.width = double.infinity,
  });
  final String title;
  final String hintText;
  final double width;
  final List<String> options;

  @override
  State<ComboboxWidget> createState() => _ComboboxWidgetState();
}

class _ComboboxWidgetState extends State<ComboboxWidget> {
  String? selectedValue;

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
          const SizedBox(height: 3),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: PaletaCores.textoBorder),
            ),
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items:
                  widget.options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontFamily: 'Axiforma',
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
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

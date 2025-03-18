import 'package:flutter/material.dart';
import 'package:panel_admin/src/common/Cores.dart';

class ComboboxWidget extends StatefulWidget {
  const ComboboxWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.options,
    this.width = double.infinity,
    required this.onChanged,
  });
  final String title;
  final String hintText;
  final double width;
  final List<String> options;
  final Function(String?) onChanged;

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
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: PaletaCores.textoLabel),
            ),
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue; // Atualiza o valor selecionado
                });
                widget.onChanged(
                  newValue,
                ); // Chama o callback com o valor selecionado
              },
              items:
                  widget.options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontFamily: 'Axiforma',
                          color: PaletaCores.textoPreto,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: PaletaCores.textoLabel,
                  fontFamily: 'Axiforma',
                  fontSize: 14,
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

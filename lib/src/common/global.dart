import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String ulrBase = "http://localhost:8080";
String token = "homologacao";

String formatDateToIso8601(String date) {
  final DateFormat inputFormat = DateFormat('dd/MM/yyyy'); // Formato de entrada
  final DateFormat outputFormat = DateFormat('yyyy-MM-dd'); // Formato de saída

  // Converte a string para DateTime
  final DateTime dateTime = inputFormat.parse(date);

  // Converte o DateTime para o formato yyyy-MM-dd
  return outputFormat.format(dateTime);
}

DateTime parseDateFromString(String date) {
  final DateFormat inputFormat = DateFormat('dd/MM/yyyy'); // Formato de entrada
  return inputFormat.parse(date); // Converte a string para DateTime
}

SnackBar snackBarFunction(
  String title,
  String message,
  ContentType contentType,
) {
  return SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,

      contentType: contentType,
    ),
  );
}

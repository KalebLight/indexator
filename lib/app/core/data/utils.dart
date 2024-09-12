import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> verifToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return (sharedPreferences.getString('token') != null) ? true : false;
}

const snackBar = SnackBar(
  content: Text(
    'Algo de errado não está certo',
    textAlign: TextAlign.center,
  ),
  backgroundColor: Colors.red,
);

String getInitials(String input) {
  List<String> words = input.split(' ');
  String initials = words.map((word) {
    return word.isNotEmpty ? word[0].toUpperCase() : '';
  }).join('');

  return initials;
}

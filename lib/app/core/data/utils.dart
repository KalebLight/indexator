import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/colors_data.dart';
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

final boxShadowDefault_1 = BoxShadow(
  color: ColorsData.black_1.withOpacity(0.07),
  spreadRadius: 3,
  blurRadius: 3,
  offset: const Offset(0, 0),
);

Color darkenColor(Color color, [double amount = 0.2]) {
  final int red = (color.red * (1 - amount)).clamp(0, 255).toInt();
  final int green = (color.green * (1 - amount)).clamp(0, 255).toInt();
  final int blue = (color.blue * (1 - amount)).clamp(0, 255).toInt();

  return Color.fromARGB(color.alpha, red, green, blue);
}

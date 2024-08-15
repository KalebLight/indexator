import 'package:shared_preferences/shared_preferences.dart';

Future<bool> verifToken() async {
  print('VERIF TOKEN <- PASSOU');
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return (sharedPreferences.getString('token') != null) ? true : false;
}

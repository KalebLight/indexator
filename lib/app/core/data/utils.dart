import 'package:shared_preferences/shared_preferences.dart';

Future<bool> verifToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return (sharedPreferences.getString('token') != null) ? true : false;
}

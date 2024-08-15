import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userConfirmationPassword = TextEditingController();
  final dio = Dio();

  @observable
  StatusDefault state = StatusIdle();

// criar um arquivo repository pra isso aqui
// criar arquivo pra url da api
//tem que quebrar isso aqui da mesma do meu corban app
  Future<bool> login(String email, String password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      // 404
      print('passou por aqui');
      Response response = await dio.post('http://127.0.0.1:8000/api/login', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        // print(response.statusCode);
        await sharedPreferences.setString('token', "Token ${response.data['data']["token"]}");
        GoRouter.of(context).pushReplacement('/');
        return true;
      }
    } on DioException catch (e) {
      print("error:  ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return false;
  }

  final snackBar = SnackBar(
    content: Text(
      'Login Deu Errado',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );
}

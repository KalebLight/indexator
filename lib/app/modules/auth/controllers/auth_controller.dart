import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/modules/auth/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userConfirmationPassword = TextEditingController();
  final AuthRepository authRepository;

  AuthController(this.authRepository);

  @observable
  StatusDefault state = StatusIdle();

// criar um arquivo repository pra isso aqui
// criar arquivo pra url da api
//tem que quebrar isso aqui da mesma do meu corban app
  login(String email, String password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var res = await authRepository.login(userEmail.text, userPassword.text);
    res.fold(
      (l) {
        this.state = StatusError();
      },
      (r) async {
        await sharedPreferences.setString('token', "Token ${r!.data.token}");
        GoRouter.of(context).pushReplacement('/');
      },
    );
  }

  final snackBar = const SnackBar(
    content: Text(
      'Login Deu Errado',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );
}

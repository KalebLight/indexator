import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  login(String email, String password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var res = await authRepository.login(userEmail.text, userPassword.text);
    res.fold(
      (l) {
        state = const StatusError();
      },
      (r) async {
        await sharedPreferences.setString('token', "Token ${r!.data.token}");
        Modular.to.navigate('/home/');
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

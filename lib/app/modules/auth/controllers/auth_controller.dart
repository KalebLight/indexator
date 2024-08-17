import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/modules/auth/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();

  final AuthRepository authRepository;

  LoginController(this.authRepository);

  @observable
  StatusDefault state = StatusIdle();

  @action
  login(String email, String password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var res = await authRepository.login(userEmail.text, userPassword.text);
    res.fold(
      (l) {
        //Show Alert de erro!
        state = const StatusError();
      },
      (r) async {
        await sharedPreferences.setString('token', "Token ${r!.data.token}");
        Modular.to.navigate('/home/');
      },
    );
  }

  void goToSignUp() {
    Modular.to.pushNamed('sign-up');
  }
}

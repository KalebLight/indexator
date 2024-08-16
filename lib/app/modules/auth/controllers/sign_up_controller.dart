import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/modules/auth/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:indexator/app/core/data/utils.dart';

class SignUpController {
  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userConfirmationPassword = TextEditingController();
  final AuthRepository authRepository;

  SignUpController(this.authRepository);

  @observable
  StatusDefault state = StatusIdle();

  void dispose() {
    userName.clear();
    userEmail.clear();
    userPassword.clear();
    userConfirmationPassword.clear();
  }

  @action
  register(BuildContext context) async {
    var res =
        await authRepository.register(userName.text, userEmail.text, userPassword.text, userConfirmationPassword.text);
    res.fold(
      (l) {
        //Show Alert de erro!
        state = const StatusError();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      },
      (r) {
        //Show Alert de Cadastro efetuado com sucesso!
        dispose();
        Modular.to.navigate('/auth/');
        return;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/core/data/utils.dart';
import 'package:indexator/app/modules/auth/apis/google_sign_in_api.dart';
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
    state = StatusLoading();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var res = await authRepository.login(email, password);
    res.fold(
      (l) {
        state = const StatusError();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $l')),
        );
      },
      (r) async {
        await sharedPreferences.setString('token', r!.data.token);
        Modular.to.navigate('/home/');
        state = StatusIdle();
      },
    );
  }

  Future googleSignInAndroid(BuildContext context) async {
    try {
      final GoogleSignInAccount? user = await GoogleSignInApi.signIn();
      final GoogleSignInAuthentication? auth = await user?.authentication;
      final String? idToken = auth?.accessToken;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        //INTEGRAR COM BACKEND
        print('Rodando no android');
        print(idToken);
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future googleSignInWeb(BuildContext context) async {
    try {
      final user = await GoogleSignInApi.signIn();
      final GoogleSignInAuthentication? auth = await user?.authentication;
      final String? idToken = auth?.accessToken;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var res = await authRepository.loginGoogle(idToken!);
        res.fold(
          (l) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          (r) {
            print(r!.success);
            print(r!.data.token);
          },
        );
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  void logoutGoogle() async {
    await GoogleSignInApi.logout();
  }

  void goToSignUp() {
    Modular.to.pushNamed('sign-up');
  }

  void goToLogin() {
    Modular.to.pushNamed('/');
  }

  void goToHome() {
    Modular.to.navigate('/home/');
  }
}

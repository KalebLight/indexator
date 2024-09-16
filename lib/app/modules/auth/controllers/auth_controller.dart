import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/core/data/utils.dart';
import 'package:indexator/app/core/store/auth_store.dart';
import 'package:indexator/app/modules/auth/apis/google_sign_in_api.dart';
import 'package:indexator/app/modules/auth/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();

  final AuthRepository authRepository;
  final AuthStore authStore;

  _AuthControllerBase(this.authRepository, this.authStore);

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
        authStore.setUser(r.data);
        Modular.to.navigate('/home/');
        state = StatusIdle();
      },
    );
  }

  Future googleSignInAndroid(BuildContext context) async {
    state = StatusLoading();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      final GoogleSignInAccount? user = await GoogleSignInApi.signIn();
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
          (r) async {
            await sharedPreferences.setString('token', r!.data.token);
            authStore.setUser(r.data);
            Modular.to.navigate('/home/');
          },
        );
      }
    } catch (e, s) {
      //chamar error notify
    }
  }

  Future googleSignInWeb(BuildContext context) async {
    state = StatusLoading();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
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
          (r) async {
            await sharedPreferences.setString('token', r!.data.token);
            authStore.setUser(r.data);
            Modular.to.navigate('/home/');
          },
        );
      }
    } catch (e, s) {
      //chamar error notify
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

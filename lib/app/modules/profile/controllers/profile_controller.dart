import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/store/auth_store.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:indexator/app/modules/auth/apis/google_sign_in_api.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final UserStore userStore;
  final AuthStore authStore;
  _ProfileControllerBase(this.userStore, this.authStore);

  final userName = TextEditingController();
  final userEmail = TextEditingController();

  Future<bool> logout() async {
    Modular.to.navigate('/auth/');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    if (userStore.user!.googleToken != null) {
      await GoogleSignInApi.logout();
    }
    userStore.clear();
    if (userStore.user == null) {
      return false;
    }
    return true;
  }
}

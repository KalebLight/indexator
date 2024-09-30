import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/core/data/utils.dart';
import 'package:indexator/app/core/repositories/user_repository.dart';
import 'package:indexator/app/core/store/auth_store.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:indexator/app/modules/auth/apis/google_sign_in_api.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final UserStore userStore;
  final AuthStore authStore;
  final UserRepository userRepository;
  _ProfileControllerBase(this.userStore, this.authStore, this.userRepository);

  final userName = TextEditingController();
  final userEmail = TextEditingController();

  @observable
  StatusDefault state = StatusIdle();

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

  @action
  Future updateUser() async {
    state = StatusLoading();
    if ((userName.text == userStore.user?.name) && (userEmail.text == userStore.user?.email)) {
      return;
    }
    var res = await userRepository.updateUser(userName.text, userEmail.text);
    res.fold(
      (l) {
        showAlert('Error updating user data', ToastificationType.error);
        state = const StatusError();
      },
      (r) {
        showAlert('Data saved successfully', ToastificationType.success);
        state = StatusSuccess();

        userStore.reloadUserData();
      },
    );
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:indexator/app/modules/auth/apis/google_sign_in_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  final UserStore userStore;
  ProfileController(this.userStore);

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    if (userStore.user!.googleToken != null) {
      await GoogleSignInApi.logout();
    }
    Modular.to.navigate('/auth/');
    return true;
  }
}

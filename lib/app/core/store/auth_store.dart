import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/modules/auth/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  _AuthStoreBase() {
    loadUser();
  }

  @observable
  UserModel? user;

  @computed
  bool get isLogged => user != null;

  @action
  setUser(UserModel value) async {
    user = value;
    // Persistindo dados no SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', user!.name!);
    await prefs.setString('user_token', user!.token);
  }

  Future loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_token');
    String? name = prefs.getString('user_name');

    if (token != null) {
      // Reconstruindo o UserModel a partir dos dados persistidos
      UserModel user = UserModel(token: token, name: name);
      setUser(user);
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    clear();
  }

  clear() {
    user!.token = "";
    user!.name = "";
    user = null;
  }
}

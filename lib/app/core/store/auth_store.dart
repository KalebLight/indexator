import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/modules/auth/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  _AuthStoreBase();

  @observable
  UserModel? user;

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(UserModel value) {
    this.user = value;
  }

  // Future<Unit?> logout() async {
  // OneSignal.logout();
  // return await credentialService.clear(LocalStorageService.USER_MODEL);
  // }

  clear() {
    user!.token = "";
    // user!.expiresAt = null;
    // user!.refreshToken = null;
    user = null;
  }
}

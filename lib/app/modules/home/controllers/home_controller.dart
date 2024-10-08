import 'package:indexator/app/core/store/auth_store.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AuthStore authStore;
  final UserStore userStore;
  _HomeControllerBase(this.authStore, this.userStore);
}

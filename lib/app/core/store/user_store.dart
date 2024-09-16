import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/core/repositories/user_repository.dart';
import 'package:indexator/app/modules/auth/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final UserRepository userRepository;
  _UserStoreBase(this.userRepository) {
    if (user == null) getUserData();
  }

  @observable
  User? user;

  @observable
  StatusDefault state = StatusIdle();

  @action
  getUserData() async {
    state = StatusLoading();
    var res = await userRepository.getUserData();
    res.fold(
      (l) {
        state = StatusError();
      },
      (r) {
        user = r;
        state = StatusSuccess();
      },
    );
  }

  @action
  clear() {
    user = null;
  }
}

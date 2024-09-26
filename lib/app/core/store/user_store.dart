import 'dart:convert';

import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/core/repositories/user_repository.dart';
import 'package:indexator/app/modules/auth/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'dart:html';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final UserRepository userRepository;
  final Storage _localStorage = window.localStorage;
  _UserStoreBase(this.userRepository);

  @observable
  User? user;

  @observable
  StatusDefault state = StatusIdle();

  @action
  Future<void> getUserData() async {
    String? userData = window.localStorage['user'];
    if (userData != null) {
      user = User.fromMap(jsonDecode(userData));
    }

    if (user == null) {
      state = StatusLoading();
      var res = await userRepository.getUserData();
      res.fold(
        (l) {
          state = const StatusError();
        },
        (r) {
          user = r;
          window.localStorage['user'] = jsonEncode(user!.toMap());
          state = StatusSuccess();
        },
      );
    }
  }

  @action
  void clear() {
    user = null;
    window.localStorage.remove('user');
  }
}

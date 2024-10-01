import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/core/repositories/user_repository.dart';
import 'package:indexator/app/modules/auth/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final UserRepository userRepository;
  late Box userBox;
  _UserStoreBase(this.userRepository) {
    initHive();
  }

  @observable
  User? user;

  @observable
  StatusDefault state = StatusIdle();

  Future<void> initHive() async {
    userBox = Hive.box('userBox');
  }

  @action
  void clearData() {
    userBox.deleteAll(['user']);
    user = null;
    getUserData();
  }

  @action
  Future<void> getUserData() async {
    String? userData = userBox.get('user');
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
          userBox.put('user', jsonEncode(user!.toMap()));
          state = StatusSuccess();
        },
      );
    }
  }

  @action
  Future<void> reloadUserData() async {
    state = StatusLoading();
    var res = await userRepository.getUserData();
    res.fold(
      (l) {
        state = const StatusError();
      },
      (r) {
        user = r;
        userBox.put('user', jsonEncode(user!.toMap()));
        state = StatusSuccess();
      },
    );
  }

  @action
  void clear() {
    user = null;
    userBox.delete('user'); // Remove os dados do Hive
  }
}

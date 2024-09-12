// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStoreBase, Store {
  late final _$userAtom = Atom(name: '_UserStoreBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$stateAtom = Atom(name: '_UserStoreBase.state', context: context);

  @override
  StatusDefault get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StatusDefault value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('_UserStoreBase.getUserData', context: context);

  @override
  Future getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  @override
  String toString() {
    return '''
user: ${user},
state: ${state}
    ''';
  }
}

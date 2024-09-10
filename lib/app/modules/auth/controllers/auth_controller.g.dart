// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  late final _$stateAtom =
      Atom(name: '_AuthControllerBase.state', context: context);

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

  late final _$loginAsyncAction =
      AsyncAction('_AuthControllerBase.login', context: context);

  @override
  Future login(String email, String password, BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(email, password, context));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}

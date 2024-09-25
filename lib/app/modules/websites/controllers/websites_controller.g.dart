// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WebsitesController on WebsitesControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'WebsitesControllerBase.state', context: context);

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

  late final _$listSitesResponseAtom =
      Atom(name: 'WebsitesControllerBase.listSitesResponse', context: context);

  @override
  ListSitesResponse? get listSitesResponse {
    _$listSitesResponseAtom.reportRead();
    return super.listSitesResponse;
  }

  @override
  set listSitesResponse(ListSitesResponse? value) {
    _$listSitesResponseAtom.reportWrite(value, super.listSitesResponse, () {
      super.listSitesResponse = value;
    });
  }

  late final _$listSitesGSCAsyncAction =
      AsyncAction('WebsitesControllerBase.listSitesGSC', context: context);

  @override
  Future listSitesGSC() {
    return _$listSitesGSCAsyncAction.run(() => super.listSitesGSC());
  }

  late final _$addUrlAsyncAction =
      AsyncAction('WebsitesControllerBase.addUrl', context: context);

  @override
  Future addUrl() {
    return _$addUrlAsyncAction.run(() => super.addUrl());
  }

  @override
  String toString() {
    return '''
state: ${state},
listSitesResponse: ${listSitesResponse}
    ''';
  }
}

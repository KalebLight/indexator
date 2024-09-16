import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/core/store/auth_store.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:indexator/app/modules/websites/repositories/url_repository.dart';
import 'package:mobx/mobx.dart';

class WebsitesController {
  final UrlRepository urlRepository;
  final UserStore userStore;
  final AuthStore authStore;

  final newUrlController = TextEditingController();

  WebsitesController(this.urlRepository, this.userStore, this.authStore);

  @observable
  StatusDefault state = StatusIdle();

  @action
  addUrl() async {
    state = StatusLoading();
    var res = await urlRepository.addURL(newUrlController.text);
    res.fold(
      (l) {
        //TODO Show Alert de erro!
        state = const StatusError();

        return;
      },
      (r) {
        //TODO Show Alert de Cadastro efetuado com sucesso!
        state = StatusSuccess();

        Modular.to.pop();
        return;
      },
    );
  }
}

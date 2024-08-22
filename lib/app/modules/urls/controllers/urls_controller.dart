import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/modules/urls/repositories/url_repository.dart';
import 'package:mobx/mobx.dart';

class UrlsController {
  final UrlRepository urlRepository;
  final newUrlController = TextEditingController();

  UrlsController(this.urlRepository);

  @observable
  StatusDefault state = StatusIdle();

  @action
  addUrl() async {
    state = StatusLoading();
    var res = await urlRepository.addURL(newUrlController.text);
    res.fold(
      (l) {
        //Show Alert de erro!
        state = const StatusError();
        print(
            'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff');
        return;
      },
      (r) {
        //Show Alert de Cadastro efetuado com sucesso!
        state = StatusSuccess();
        print('eaeae');
        Modular.to.pop();
        return;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/status.dart';
import 'package:indexator/app/core/data/utils.dart';
import 'package:indexator/app/core/store/auth_store.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:indexator/app/modules/websites/repositories/sites_repository.dart';
import 'package:indexator/app/modules/websites/repositories/url_repository.dart';
import 'package:indexator/app/modules/websites/responses/list_sites_response.dart';
import 'package:mobx/mobx.dart';
import 'package:toastification/toastification.dart';

part 'websites_controller.g.dart';

class WebsitesController = WebsitesControllerBase with _$WebsitesController;

abstract class WebsitesControllerBase with Store {
  final UrlRepository urlRepository;
  final SitesRepository sitesRepository;
  final UserStore userStore;
  final AuthStore authStore;

  final newUrlController = TextEditingController();

  WebsitesControllerBase(this.urlRepository, this.userStore, this.authStore, this.sitesRepository);

  @observable
  StatusDefault state = StatusIdle();

  @observable
  ListSitesResponse? listSitesResponse;

  @action
  listSitesGSC() async {
    state = StatusLoading();
    var res = await sitesRepository.listSites();
    res.fold(
      (l) {
        state = const StatusError();
        print(l.message);
        return;
      },
      (r) {
        print(r!.sites);
      },
    );
  }

  @action
  addUrl() async {
    state = StatusLoading();
    var res = await urlRepository.addURL(newUrlController.text);
    res.fold(
      (l) {
        showAlert('Error saving URL', ToastificationType.error);
        state = const StatusError();
        return;
      },
      (r) {
        showAlert('URL saved successfully', ToastificationType.success);
        state = StatusSuccess();
        Modular.to.pop();
        return;
      },
    );
  }
}

import 'dart:async';
import 'package:flutter_prime/data/model/general_setting/general_setting_response_model.dart';
import 'package:flutter_prime/data/repo/home/home_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  String email = "";
  bool isLoading = false;
  String username = "";
  String siteName = "";
  String imagePath = "";
  String defaultCurrency = "";

  String defaultCurrencySymbol = "";
  GeneralSettingResponseModel generalSettingResponseModel = GeneralSettingResponseModel();

  Future<void> initialData({bool shouldLoad = true}) async {
    isLoading = shouldLoad ? true : false;
    update();

    loadData();
    isLoading = false;
    update();
  }

  Future<void> loadData() async {
    defaultCurrency = homeRepo.apiClient.getCurrencyOrUsername();
    username = homeRepo.apiClient.getCurrencyOrUsername(isCurrency: false);
    email = homeRepo.apiClient.getUserEmail();
    defaultCurrencySymbol = homeRepo.apiClient.getCurrencyOrUsername(isSymbol: true);
    generalSettingResponseModel = homeRepo.apiClient.getGSData();
    siteName = generalSettingResponseModel.data?.generalSetting?.siteName ?? "";
  }
}

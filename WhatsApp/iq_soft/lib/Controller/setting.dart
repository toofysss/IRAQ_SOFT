import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/root.dart';
import '../services/services.dart';

class SettingController extends GetxController {
  Locale? language;
  RxBool startAnimation = false.obs;

  MyServices myServices = Get.find();
  // تغيير اللغة
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Root.lang = langcode;
    Get.back();
    Get.updateLocale(locale);
  }

  // تغيير الوضع
  changeMode(bool langcode) {
    myServices.sharedPreferences.setBool("Mode", langcode);
    Root.themeMode = langcode ? ThemeMode.dark : ThemeMode.light;
    Root.mode = langcode ? "dark" : "light";
    Get.back();
    Get.forceAppUpdate();
  }

  @override
  void onInit() {
    animation();
    super.onInit();
  }

  animation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startAnimation.toggle();
      update();
    });
  }
}

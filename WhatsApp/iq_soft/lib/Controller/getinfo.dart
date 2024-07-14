import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/root.dart';
import '../services/services.dart';

class GetData extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  // get lang
  getlang() {
    String? lang = myServices.sharedPreferences.getString("lang") ??
        Get.deviceLocale!.languageCode;
    language = Locale(lang);
    Root.lang = lang;
  }

  getMode() {
    bool? devicemode = myServices.sharedPreferences.getBool("Mode") ?? true;
    Root.themeMode = devicemode ? ThemeMode.dark : ThemeMode.light;
    Root.mode = devicemode ? "dark" : "light";
  }

  getInfo() {
    Root.username = myServices.sharedPreferences.getString("username") ?? "";
    Root.startGroups =
        myServices.sharedPreferences.getString("startGroups") ?? "";
    Root.endGroups = myServices.sharedPreferences.getString("endGroups") ?? "";
    Root.phone = myServices.sharedPreferences.getString("phone") ?? "";
    Root.morningmessage =
        myServices.sharedPreferences.getString("morning") ?? "";
    Root.morningmessage =
        myServices.sharedPreferences.getString("beforeGroups") ?? "";
    Root.types = myServices.sharedPreferences.getString("types") ?? "";
  }

  getPhoneMembers() {
    Root.phonesMembers =
        myServices.sharedPreferences.getStringList("phoneMembers") ?? [];
  }

  @override
  void onInit() {
    getlang();
    getMode();
    getInfo();
    getPhoneMembers();
    super.onInit();
  }
}

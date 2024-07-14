import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/root.dart';
import '../services/services.dart';
import 'getinfo.dart';

class InfoPageController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController startGroup = TextEditingController();
  TextEditingController beforeGroup = TextEditingController();
  TextEditingController endGroup = TextEditingController();
  TextEditingController morning = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController types = TextEditingController();
  MyServices myServices = Get.find();
  @override
  void onInit() {
    username.text = Root.username;
    startGroup.text = Root.startGroups;
    beforeGroup.text = Root.beforeGroups;
    endGroup.text = Root.endGroups;
    morning.text = Root.morningmessage;
    phone.text = Root.phone;
    types.text = Root.types;
    super.onInit();
  }

  saveinfo() {
    myServices.sharedPreferences.setString("username", username.text);
    myServices.sharedPreferences.setString("startGroups", startGroup.text);
    myServices.sharedPreferences.setString("endGroups", endGroup.text);
    myServices.sharedPreferences.setString("phone", phone.text);
    myServices.sharedPreferences.setString("morning", morning.text);
    myServices.sharedPreferences.setString("beforeGroups", beforeGroup.text);
    myServices.sharedPreferences.setString("types", types.text);
    GetData().getInfo();
    Get.back();
  }
}

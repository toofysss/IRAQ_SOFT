import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool startAnimation = false.obs;

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

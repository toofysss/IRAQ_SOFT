import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../Controller/whatsapp.dart';
import '../../UI/bgdesign.dart';
import '../../UI/button.dart';
import '../../UI/loading.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ConnectPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("connect".tr),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ButtonIconDesign(
                  iconData: Icons.arrow_back, onTap: () => Get.back()),
            ),
          ),
          body: BgDesgin(
            page: Obx(
              () {
                if (controller.isloading.value) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: QrImageView(
                        backgroundColor: Colors.white,
                        data: controller.qrimage,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 25),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Loading());
                }
              },
            ),
          ),
        );
      },
    );
  }
}

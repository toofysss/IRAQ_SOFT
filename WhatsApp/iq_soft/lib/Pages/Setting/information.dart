import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/info.dart';
import '../../UI/bgdesign.dart';
import '../../UI/button.dart';
import '../../UI/textfiled.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("info".tr),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ButtonIconDesign(
              iconData: Icons.arrow_back, onTap: () => Get.back()),
        ),
      ),
      body: BgDesgin(
          page: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GetBuilder(
            init: InfoPageController(),
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                        controller: controller.username, hint: "info0".tr),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                        controller: controller.startGroup, hint: "info1".tr),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                        controller: controller.endGroup, hint: "info2".tr),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                        controller: controller.phone, hint: "info3".tr),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                        controller: controller.morning, hint: "info4".tr),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                        controller: controller.beforeGroup, hint: "info5".tr),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                        controller: controller.types, hint: "types".tr),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                        onPressed: () => controller.saveinfo(),
                        child: Text(
                          "Save".tr,
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                  )
                ],
              );
            }),
      )),
    );
  }
}

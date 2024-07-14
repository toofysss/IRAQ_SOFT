import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/member.dart';
import '../../UI/bgdesign.dart';
import '../../UI/button.dart';
import '../../UI/loading.dart';
import '../../UI/textfiled.dart';

class MembersIQ extends StatelessWidget {
  const MembersIQ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MembersIQController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Members".tr),
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
                  return const Center(child: Loading());
                } else {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: CustomTextField(
                                  focusNode: controller.searchFocusNode,
                                  controller: controller.phone,
                                  hint: "info3".tr),
                            ),
                            ButtonDesign(
                                onTap: () => controller
                                    .insertPhone(controller.phone.text),
                                title: "Save".tr),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: controller.phones.length,
                          itemBuilder: (context, index) {
                            var phones = controller.phones[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 25),
                                title: Text(phones),
                                trailing: GestureDetector(
                                  onTap: () {
                                    controller.removephone(phones, context);
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: const Icon(
                                    CupertinoIcons.trash_circle,
                                    size: 55,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}

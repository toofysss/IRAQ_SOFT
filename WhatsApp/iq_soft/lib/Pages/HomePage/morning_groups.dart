import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq_soft/UI/loading.dart';

import '../../Controller/morninggroup.dart';
import '../../UI/bgdesign.dart';
import '../../UI/button.dart';
import '../../UI/textfiled.dart';

class MorningGroups extends StatelessWidget {
  const MorningGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MorningGroupsController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ButtonIconDesign(
                    iconData: Icons.arrow_back, onTap: () => Get.back()),
              ),
              title: Text("H1".tr),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () => controller.sendMorning(),
                    style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(
                      EdgeInsets.all(15),
                    )),
                    child: controller.isSend.value
                        ? const Loading()
                        : Icon(
                            Icons.message_rounded,
                            size: 40,
                            color: Theme.of(context).iconTheme.color,
                          ),
                  ),
                )
              ],
            ),
            body: BgDesgin(page: Obx(() {
              if (controller.isloading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: controller.search,
                        hint: "SearchGroup".tr,
                        focusNode: controller.searchFocusNode,
                        onTap: (search) => controller.filterData(search),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: controller.groups.length,
                          itemBuilder: (context, index) {
                            var group = controller.groups[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 25),
                                title: Text(group.name ?? ""),
                                trailing: GestureDetector(
                                    onTap: () => controller.morninggroups(
                                        group.id!, context),
                                    child: const Icon(Icons.message_rounded,
                                        size: 55)),
                              ),
                            );
                          })
                    ],
                  ),
                );
              }
            })),
          );
        });
  }
}

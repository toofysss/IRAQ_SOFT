import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/endgroup.dart';
import '../../UI/bgdesign.dart';
import '../../UI/button.dart';
import '../../UI/loading.dart';
import '../../UI/textfiled.dart';

class EndGroups extends StatelessWidget {
  const EndGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EndGroupsController(),
        builder: (controller) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text("H2".tr),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ButtonIconDesign(
                      iconData: Icons.arrow_back, onTap: () => Get.back()),
                ),
              ),
              body: BgDesgin(page: Obx(() {
                if (controller.isloading.value) {
                  return const Center(child: Loading());
                } else {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Column(
                      children: [
                        CustomTextField(
                          focusNode: controller.searchFocusNode,
                          controller: controller.search,
                          hint: "SearchGroup".tr,
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
                                title: Text(group.name!),
                                trailing: GestureDetector(
                                  onTap: () =>
                                      controller.endgroups(group.id!, context),
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
              })));
        });
  }
}

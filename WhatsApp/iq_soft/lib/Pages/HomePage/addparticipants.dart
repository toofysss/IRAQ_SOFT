import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/participants.dart';
import '../../UI/bgdesign.dart';
import '../../UI/button.dart';
import '../../UI/loading.dart';
import '../../UI/textfiled.dart';

class Participants extends StatelessWidget {
  const Participants({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ParticipantsController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text("H3".tr),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ButtonIconDesign(
                      iconData: Icons.arrow_back, onTap: () => Get.back()),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () => controller.addAll(),
                      style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(
                        EdgeInsets.all(15),
                      )),
                      child: controller.isSend.value
                          ? const Loading()
                          : Icon(
                              Icons.add,
                              size: 40,
                              color: Theme.of(context).iconTheme.color,
                            ),
                    ),
                  )
                ],
              ),
              body: BgDesgin(
                page: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    children: [
                      CustomTextField(
                          focusNode: controller.searchFocusNode,
                          controller: controller.phone,
                          hint: "CustomerPohne".tr),
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
                                    controller.addpartetion(group.id!, context),
                                child: const Icon(
                                  CupertinoIcons.add_circled,
                                  size: 55,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}

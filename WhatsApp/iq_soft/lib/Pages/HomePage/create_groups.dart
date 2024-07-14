import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq_soft/Controller/creategroups.dart';
import 'package:iq_soft/constant/root.dart';

import '../../UI/bgdesign.dart';
import '../../UI/button.dart';
import '../../UI/textfiled.dart';

class CreateGroups extends StatelessWidget {
  const CreateGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateGroupsController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("H0".tr),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ButtonIconDesign(
                  iconData: Icons.arrow_back, onTap: () => Get.back()),
            ),
          ),
          body: BgDesgin(
            page: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: CustomTextField(
                            focusNode: controller.searchFocusNode,
                            controller: controller.customerPhone,
                            hint: "info3".tr),
                      ),
                      ButtonDesign(
                          onTap: () => controller.createGroup(),
                          title: "Save".tr),
                    ],
                  ),
                  ListView.builder(
                    itemCount: Root.phonesMembers.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = Root.phonesMembers[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          title: Text(item),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq_soft/UI/textfiled.dart';
import 'package:iq_soft/constant/root.dart';

class CreateGroupsController extends GetxController {
  RxBool notification = false.obs;
  TextEditingController customerPhone = TextEditingController();
  TextEditingController groupName = TextEditingController();
  List<String> phones = [];
  FocusNode searchFocusNode = FocusNode();

  @override
  void onInit() {
    phones.clear();
    phones == Root.phonesMembers;
    super.onInit();
  }

  confirmGroups() async {
    try {
      phones.add(customerPhone.text);
      await Root.connect!.chat
          .sendTextMessage(
              phone: customerPhone.text, message: Root.beforeGroups)
          .whenComplete(() async {
        var id = await Root.connect!.group
            .createGroup(groupName: "${groupName.text} /${Root.username}");
        await Root.connect!.group
            .addParticipants(groupId: id, phoneNumbers: phones)
            .whenComplete(() async => await Root.connect!.chat
                .sendTextMessage(phone: id, message: Root.startGroups));
        Get.back();
      });
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showGeneralDialog(
          context: Get.context!,
          barrierDismissible: true,
          barrierColor: Colors.black12,
          barrierLabel: "",
          pageBuilder: (context, animation, secondaryAnimation) => Container(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionBuilder: (context, a1, a2, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: .5, end: 1).animate(a1),
              child: FadeTransition(
                opacity: Tween<double>(begin: .5, end: 1).animate(a1),
                child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actionsAlignment: MainAxisAlignment.center,
                  content: Center(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                offset: const Offset(2, 2),
                                spreadRadius: .5,
                                color: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedItemColor!
                                    .withOpacity(.8))
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Under_maintenance".tr,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 75),
                      child: IconButton(
                          highlightColor: Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedItemColor!
                              .withOpacity(.1),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            FocusScope.of(context).unfocus();
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1.5,
                                    color: Theme.of(context).iconTheme.color!)),
                            child: Icon(
                              Icons.close,
                              size: MediaQuery.of(context).size.width / 14,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            );
          },
        );
      });
    }
  }

  createGroup() async {
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierColor: Colors.black12,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: .5, end: 1).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: .5, end: 1).animate(a1),
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actionsAlignment: MainAxisAlignment.center,
              content: Center(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            offset: const Offset(2, 2),
                            spreadRadius: .5,
                            color: Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor!
                                .withOpacity(.8))
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Under_maintenance".tr,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: CustomTextField(
                              controller: groupName, hint: "groupName".tr),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  style: const ButtonStyle(
                                      minimumSize: WidgetStatePropertyAll(
                                          Size(100, 75))),
                                  onPressed: () => confirmGroups(),
                                  child: Text(
                                    "Yes",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )),
                              ElevatedButton(
                                  style: const ButtonStyle(
                                      minimumSize:
                                          WidgetStatePropertyAll(Size(100, 75)),
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.red)),
                                  onPressed: () {
                                    Get.back();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Text(
                                    "No",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}

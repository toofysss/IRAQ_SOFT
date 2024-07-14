import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Module/groups.dart';
import '../constant/root.dart';

class ParticipantsController extends GetxController {
  RxBool isloading = true.obs, notification = false.obs, isSend = false.obs;
  TextEditingController phone = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  RxList<GetAllGroupsResult> groups = <GetAllGroupsResult>[].obs;
  RxList<GetAllGroupsResult> filteredGroups = <GetAllGroupsResult>[].obs;

  @override
  void onInit() {
    getGroups();
    super.onInit();
  }

  addpartetion(String id, context) {
    showGeneralDialog(
      context: context,
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
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Warning".tr,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: const ButtonStyle(
                                    padding: WidgetStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10)),
                                    minimumSize:
                                        WidgetStatePropertyAll(Size(100, 75))),
                                onPressed: () => confirm(id),
                                child: Text(
                                  "Yes",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
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

  confirm(String id) async {
    await Root.connect!.group
        .addParticipants(groupId: id, phoneNumbers: [phone.text]);
  }

  addAll() async {
    if (isSend.value == false) {
      isSend.toggle();
      update();
      for (int i = 0; i < groups.length; i++) {
        await Root.connect!.group.addParticipants(
            groupId: groups[i].id!, phoneNumbers: [phone.text]);
      }
    }
  }

  Future<void> getGroups() async {
    try {
      String jsonResponse = await Root.connect!.group.getAllGroups();
      List<dynamic> parsedList = jsonDecode(jsonResponse);

      List<GetAllGroupsResult> groupsList = parsedList
          .where((e) =>
              e['name'].toString().contains(Root.username) &&
              e['name'] != null &&
              e['labels'] is List &&
              e['labels'].contains(Root.types))
          .map((json) => GetAllGroupsResult.fromJson(json))
          .toList();
      groups.assignAll(groupsList);
      filteredGroups.assignAll(groupsList);
      isloading.toggle();
      update();
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

  filterData(String search) {
    groups.assignAll(filteredGroups
        .where((group) =>
            group.name!.toLowerCase().startsWith(search.toLowerCase()))
        .toList());
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/root.dart';
import '../services/services.dart';
import 'getinfo.dart';

class MembersIQController extends GetxController {
  RxBool isloading = true.obs;
  TextEditingController phone = TextEditingController();
  List<String> phones = [];
  FocusNode searchFocusNode = FocusNode();
  MyServices myServices = Get.find();

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  getdata() {
    phones = Root.phonesMembers;
    isloading.toggle();
    update();
  }

  removephone(String id, context) {
    FocusScope.of(context).unfocus();
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
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
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
                                  onPressed: () => confirm(id),
                                  child: Text(
                                    "Yes",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )),
                              ElevatedButton(
                                  style: const ButtonStyle(
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
  }

  confirm(String id) async {
    phones.remove(id);
    myServices.sharedPreferences.remove("phoneMembers");
    myServices.sharedPreferences.setStringList("phoneMembers", phones);
    update();
    Get.back();
    GetData().getPhoneMembers();
  }

  insertPhone(String id) async {
    phones.add(id);
    myServices.sharedPreferences.remove("phoneMembers");
    myServices.sharedPreferences.setStringList("phoneMembers", phones);
    update();
    phone.clear();

    GetData().getPhoneMembers();
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_bot_flutter/whatsapp_bot_flutter.dart';
import '../constant/root.dart';

class ConnectPageController extends GetxController {
  String qrimage = "";
  RxBool isloading = false.obs;
  @override
  void onInit() {
    connectWhatsapp();
    super.onInit();
  }

  connectWhatsapp() async {
    if (Root.connect != null) {
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
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Whatsapp_warning".tr,
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
    } else {
      WhatsappBotUtils.enableLogs(true);
      WhatsappClient? client = await WhatsappBotFlutter.connect(
          qrCodeWaitDurationSeconds: 300,
          onConnectionEvent: (event) {
            if (event.toString() == "ConnectionEvent.connected") {
              showGeneralDialog(
                context: Get.context!,
                barrierDismissible: true,
                barrierColor: Colors.black12,
                barrierLabel: "",
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Container(),
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Whatsapp_success".tr,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color!)),
                                  child: Icon(
                                    Icons.close,
                                    size:
                                        MediaQuery.of(context).size.width / 14,
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
          },
          onQrCode: (String qr, Uint8List? imageBytes) {
            qrimage = qr;
            isloading.toggle();
            update();
          });
      Root.connect = client;
    }
  }
}

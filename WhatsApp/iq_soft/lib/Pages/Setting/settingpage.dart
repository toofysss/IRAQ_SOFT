import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq_soft/UI/button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Controller/setting.dart';
import '../../Route/routes.dart';
import '../../UI/bgdesign.dart';
import '../../constant/root.dart';

class SettingItem {
  final Function()? onTap;
  final IconData leading;
  final IconData trailing;
  final String title;

  SettingItem(
      {required this.leading,
      required this.onTap,
      required this.title,
      required this.trailing});
}

final List<SettingItem> settinglist = [
  SettingItem(
      leading: CupertinoIcons.person_alt_circle,
      onTap: () => Get.toNamed(AppRouting.infoPage),
      title: "info",
      trailing: Icons.arrow_forward_ios_sharp),
  SettingItem(
      leading: Icons.headset_mic_rounded,
      onTap: () => Get.toNamed(AppRouting.members),
      title: "Members",
      trailing: Icons.arrow_forward_ios_sharp),
  SettingItem(
      leading: CupertinoIcons.phone_circle_fill,
      onTap: () => Get.toNamed(AppRouting.connectPage),
      title: "connect",
      trailing: Icons.arrow_forward_ios_sharp),
  SettingItem(
      leading: CupertinoIcons.moon_circle,
      onTap: () => showGeneralDialog(
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
                            CheckboxListTile(
                                title: Text("Dark".tr),
                                value: Root.mode == 'dark',
                                onChanged: (bool? value) =>
                                    SettingController().changeMode(true)),
                            CheckboxListTile(
                                title: Text("Light".tr),
                                value: Root.mode == 'light',
                                onChanged: (bool? value) =>
                                    SettingController().changeMode(false)),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 75),
                        child: IconButton(
                            highlightColor: Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor!
                                .withOpacity(.1),
                            onPressed: () => Navigator.pop(context),
                            icon: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1.5,
                                      color:
                                          Theme.of(context).iconTheme.color!)),
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
          ),
      title: "Theme",
      trailing: Icons.arrow_forward_ios_sharp),
  SettingItem(
      leading: Icons.language,
      onTap: () => showGeneralDialog(
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
                            CheckboxListTile(
                                title: Text("Arabic".tr),
                                value: Root.lang == "ar",
                                onChanged: (bool? value) =>
                                    SettingController().changeLang("ar")),
                            CheckboxListTile(
                                title: Text("English".tr),
                                value: Root.lang == "en",
                                onChanged: (bool? value) =>
                                    SettingController().changeLang("en")),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 75),
                        child: IconButton(
                            highlightColor: Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor!
                                .withOpacity(.1),
                            onPressed: () => Navigator.pop(context),
                            icon: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1.5,
                                      color:
                                          Theme.of(context).iconTheme.color!)),
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
          ),
      title: "Language",
      trailing: Icons.arrow_forward_ios_sharp),
  SettingItem(
      leading: Icons.info,
      onTap: () => launchUrl(Uri.parse(Root.webcv)),
      title: "Contact",
      trailing: Icons.arrow_forward_ios_sharp),
];

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SettingController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text("Setting".tr),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ButtonIconDesign(
                    iconData: Icons.arrow_back, onTap: () => Get.back()),
              ),
            ),
            body: BgDesgin(
                page: ListView.builder(
                    itemCount: settinglist.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var setting = settinglist[index];
                      return AnimatedContainer(
                        height: 170,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 300 + (index * 200)),
                        transform: Matrix4.translationValues(0,
                            controller.startAnimation.value ? 0 : Get.width, 0),
                        child: Card(
                          child: ListTile(
                            splashColor: Colors.transparent,
                            onTap: setting.onTap,
                            leading: Icon(setting.leading,
                                color: Theme.of(context).primaryColor),
                            title: Text(setting.title.tr),
                            trailing: Icon(setting.trailing,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      );
                    })),
          );
        });
  }
}

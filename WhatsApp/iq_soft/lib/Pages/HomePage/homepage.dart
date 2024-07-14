import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/home.dart';
import '../../Controller/homescreen.dart';
import '../../Route/routes.dart';
import '../../UI/bgdesign.dart';
import '../../UI/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text("AppName".tr),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ButtonIconDesign(
                    iconData: Icons.settings,
                    onTap: () => Get.toNamed(AppRouting.setting),
                  ),
                )
              ],
            ),
            body: BgDesgin(
              page: GridView.builder(
                  shrinkWrap: true,
                  itemCount: homelist.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (_, index) {
                    var item = homelist[index];
                    return AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 300 + (index * 200)),
                      transform: Matrix4.translationValues(0,
                          controller.startAnimation.value ? 0 : Get.width, 0),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(item.route),
                        child: Card(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.title.tr,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}

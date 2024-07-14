import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Controller/getinfo.dart';
import 'Route/routes.dart';
import 'constant/root.dart';
import 'constant/theme.dart';
import 'Transition/Transition.dart';
import 'services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GetData(),
      builder: (controller) {
        return GetMaterialApp(
          theme: lightTheme(context),
          darkTheme: darkTheme(context),
          themeMode: Root.themeMode,
          locale: controller.language,
          debugShowCheckedModeBanner: false,
          translations: MyTransition(),
          getPages: routes,
        );
      },
    );
  }
}

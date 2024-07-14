import 'package:flutter/material.dart';

class ThemeRoot {
  static const Color buttondark = Color(0xff5DB1FF);
  static const Color buttonlight = Color(0xff008163);
  static const Color textlight = Colors.black;
  static const Color textdark = Colors.white;
  static const Color checkdark = Colors.white;
  static const Color bgdark = Color(0xff131620);
  static const Color bglight = Color(0xfff7f5ff);
}

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: ThemeRoot.bglight,
    checkboxTheme: CheckboxThemeData(
        checkColor: const WidgetStatePropertyAll(ThemeRoot.checkdark),
        fillColor: const WidgetStatePropertyAll(ThemeRoot.buttonlight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: Colors.transparent),
        splashRadius: 15),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: MediaQuery.of(context).size.width / 20,
        fontWeight: FontWeight.bold,
        color: ThemeRoot.textlight,
      ),
      labelLarge: TextStyle(
        fontSize: MediaQuery.of(context).size.width / 20,
        fontWeight: FontWeight.bold,
        color: ThemeRoot.textlight,
      ),
    ),
    radioTheme: const RadioThemeData(
        fillColor: WidgetStatePropertyAll(ThemeRoot.buttonlight),
        splashRadius: 0),
    appBarTheme: AppBarTheme(
        toolbarHeight: 150,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 16,
          fontWeight: FontWeight.bold,
          color: ThemeRoot.textlight,
        ),
        shadowColor: Colors.transparent),
    cardTheme: CardTheme(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(width: 1.5, color: ThemeRoot.buttonlight)),
        surfaceTintColor: ThemeRoot.bglight,
        shadowColor: ThemeRoot.buttonlight,
        color: ThemeRoot.bglight),
    primaryColor: ThemeRoot.buttonlight,
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 20,
          fontWeight: FontWeight.bold,
          color: ThemeRoot.textlight),
    ),
    iconTheme: IconThemeData(
        color: ThemeRoot.buttonlight,
        size: MediaQuery.of(context).size.width / 15),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor:
            WidgetStatePropertyAll(ThemeRoot.buttonlight.withOpacity(.1)),
        iconSize:
            WidgetStatePropertyAll(MediaQuery.of(context).size.width / 13),
        foregroundColor: const WidgetStatePropertyAll(ThemeRoot.buttonlight),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        modalElevation: 0, backgroundColor: Colors.transparent, elevation: 0),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ThemeRoot.buttonlight,
        backgroundColor: ThemeRoot.bglight,
        unselectedItemColor: Colors.grey),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(width: 1.5, color: ThemeRoot.buttonlight))),
        elevation: const WidgetStatePropertyAll(10),
        backgroundColor: WidgetStateProperty.all(ThemeRoot.bglight),
        shadowColor: const WidgetStatePropertyAll(ThemeRoot.buttonlight),
      ),
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: ThemeRoot.bgdark,
    checkboxTheme: CheckboxThemeData(
        checkColor: const WidgetStatePropertyAll(ThemeRoot.checkdark),
        fillColor: const WidgetStatePropertyAll(ThemeRoot.buttondark),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: Colors.transparent),
        splashRadius: 15),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ThemeRoot.textdark,
      ),
      labelLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: ThemeRoot.textdark,
      ),
    ),
    radioTheme: const RadioThemeData(
        fillColor: WidgetStatePropertyAll(ThemeRoot.buttondark),
        splashRadius: 0),
    appBarTheme: const AppBarTheme(
        toolbarHeight: 130,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 80,
          fontWeight: FontWeight.bold,
          color: ThemeRoot.textdark,
        ),
        shadowColor: Colors.transparent),
    cardTheme: CardTheme(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(width: 1.5, color: ThemeRoot.buttondark)),
        surfaceTintColor: ThemeRoot.bgdark,
        shadowColor: ThemeRoot.buttondark,
        color: ThemeRoot.bgdark),
    primaryColor: ThemeRoot.buttondark,
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        fontSize: MediaQuery.of(context).size.width / 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
        color: ThemeRoot.buttondark,
        size: MediaQuery.of(context).size.width / 15),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor:
            WidgetStatePropertyAll(ThemeRoot.buttondark.withOpacity(.1)),
        iconSize:
            WidgetStatePropertyAll(MediaQuery.of(context).size.width / 13),
        foregroundColor: const WidgetStatePropertyAll(ThemeRoot.buttondark),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        modalElevation: 0, backgroundColor: Colors.transparent, elevation: 0),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ThemeRoot.buttondark,
        backgroundColor: ThemeRoot.bgdark,
        unselectedItemColor: Colors.grey),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(width: 1.5, color: ThemeRoot.buttondark))),
        elevation: const WidgetStatePropertyAll(10),
        backgroundColor: WidgetStateProperty.all(ThemeRoot.bgdark),
        shadowColor: const WidgetStatePropertyAll(ThemeRoot.buttondark),
      ),
    ),
  );
}

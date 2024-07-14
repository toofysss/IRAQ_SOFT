import 'package:flutter/material.dart';
import 'package:whatsapp_bot_flutter/whatsapp_bot_flutter.dart';

class Root {
  static String lang = "";
  // Img
  static String imgloc = "images";
  static String bgimg = "$imgloc/bg.riv";
  // Size
  static double textsize = 14;
  static double iconsize = 25;
  // Theme
  static ThemeMode themeMode = ThemeMode.system;
  static String mode = "";
  static WhatsappClient? connect;

  // Web Link
  static String webcv = "https://mustafa--cv.web.app/";
  // Info
  static String username = "";
  static String endGroups = "";
  static String startGroups = "";
  static String beforeGroups = "";
  static String morningmessage = "";
  static String phone = "";
  static String types = "";
  static List<String> phonesMembers = [];
}

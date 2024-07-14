import 'package:get/get.dart';
import 'package:iq_soft/Pages/HomePage/addparticipants.dart';
import 'package:iq_soft/Pages/HomePage/create_groups.dart';
import 'package:iq_soft/Pages/HomePage/end_groups.dart';
import 'package:iq_soft/Pages/HomePage/homepage.dart';
import 'package:iq_soft/Pages/HomePage/morning_groups.dart';
import 'package:iq_soft/Pages/Setting/information.dart';
import 'package:iq_soft/Pages/Setting/member_iq.dart';
import 'package:iq_soft/Pages/Setting/settingpage.dart';
import 'package:iq_soft/Pages/Setting/whatsapp_page.dart';

class AppRouting {
  static String onboarding = "/OnBoarding";
  static String setting = "/setting";
  static String homepage = "/home";
  static String addParticipants = "/addParticipants";
  static String connectPage = "/connectPage";
  static String infoPage = "/infoPage";
  static String members = "/members";

  // Home Page
  static String createGroups = "/create_groups";
  static String endGroups = "/end_group";
  static String morningGroups = "/morning_group";
  static String botTelegramPrivate = "/bot_telegram_private";
  static String botTelegramPublic = "/bot_telegram_public";
}

List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: () => const HomeScreen()),
  GetPage(name: AppRouting.setting, page: () => const SettingPage()),
  GetPage(name: AppRouting.connectPage, page: () => const ConnectPage()),
  GetPage(name: AppRouting.endGroups, page: () => const EndGroups()),
  GetPage(name: AppRouting.morningGroups, page: () => const MorningGroups()),
  GetPage(name: AppRouting.infoPage, page: () => const InfoPage()),
  GetPage(name: AppRouting.members, page: () => const MembersIQ()),
  GetPage(name: AppRouting.createGroups, page: () => const CreateGroups()),
  GetPage(name: AppRouting.addParticipants, page: () => const Participants()),
];

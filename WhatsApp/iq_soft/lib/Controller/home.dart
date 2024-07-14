import '../Module/homemodule.dart';
import '../Route/routes.dart';

List<HomeModule> homelist = [
  HomeModule(title: "H0", route: AppRouting.createGroups),
  HomeModule(title: "H1", route: AppRouting.morningGroups),
  HomeModule(title: "H2", route: AppRouting.endGroups),
  HomeModule(title: "H3", route: AppRouting.addParticipants),
  // HomeModule(title: "H3", route: AppRouting.botTelegramPrivate),
  // HomeModule(title: "H4", route: AppRouting.botTelegramPublic),
];

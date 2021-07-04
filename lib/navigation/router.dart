import 'package:auto_route/auto_route.dart';
import 'package:trickle/pages/flows/flows_page.dart';
import 'package:trickle/pages/init/init_page.dart';
import 'package:trickle/pages/login/login_page.dart';
import 'package:trickle/pages/flow_builder/flow_builder_page.dart';
import 'package:trickle/pages/now_playing/now_playing_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: InitPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: NowPlayingPage),
    AutoRoute(page: FlowBuilderPage),
    AutoRoute(page: FlowsPage),
  ],
)
class $AppRouter {}

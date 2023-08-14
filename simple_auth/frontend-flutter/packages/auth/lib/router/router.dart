import 'package:auto_route/auto_route.dart';

export 'package:auto_route/auto_route.dart';

export 'router.gr.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
        ),
      ];
}

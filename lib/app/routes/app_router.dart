import 'package:auto_route/auto_route.dart';
import 'package:blink/app/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page,initial: true),
    AutoRoute(page: ProductRoute.page,),
    AutoRoute(page: ProductDetailRoute.page,),
    AutoRoute(page: CartRoute.page,),
    AutoRoute(page: OrderRoute.page,),
    AutoRoute(page: ProductSearchRoute.page,),
  ];

  @override
  List<AutoRouteGuard> get guards => [
  ];
}
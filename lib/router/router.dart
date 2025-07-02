import 'package:flutter/widgets.dart';
import 'package:get_it_scope_study/environment/getit/getit.dart';
import 'package:get_it_scope_study/presentation/detail/detail_screen.dart';
import 'package:get_it_scope_study/presentation/detail/view_model/detail_view_model.dart';
import 'package:get_it_scope_study/presentation/home/home_screen.dart';
import 'package:get_it_scope_study/presentation/home/view_model/home_view_model.dart';
import 'package:get_it_scope_study/presentation/splash/splash_screen.dart';
import 'package:get_it_scope_study/presentation/splash/view_model/splash_view_model.dart';
import 'package:get_it_scope_study/router/router_observer.dart';
import 'package:get_it_scope_study/router/router_path.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Widget _fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(opacity: animation, child: child);
}

CustomTransitionPage buildFadeTransitionPage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: _fadeTransition,
  );
}

@module
abstract class GoRouterModule {
  @singleton
  GoRouter get router => GoRouter(
    navigatorKey: navigatorKey,
    observers: [locator<RouterObserver>()],
    initialLocation: '/${RouterPath.splash}',

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Container(),
        routes: [
          GoRoute(
            path: RouterPath.splash,
            name: RouterPath.splash,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state: state,
                child: SplashScreen(viewModel: locator<SplashViewModel>()),
              );
            },
          ),
          GoRoute(
            path: RouterPath.home,
            name: RouterPath.home,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state: state,
                child: HomeScreen(viewModel: locator<HomeViewModel>()),
              );
            },
            routes: [
              GoRoute(
                path: RouterPath.detail,
                name: RouterPath.detail,
                pageBuilder: (context, state) {
                  return buildFadeTransitionPage(
                    state: state,
                    child: DetailScreen(viewModel: locator<DetailViewModel>()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

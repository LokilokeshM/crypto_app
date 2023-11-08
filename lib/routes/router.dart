// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gweiland_project/features/ui/dashboard/presentation/dashboard.dart';

import '../features/ui/login/login_page.dart';
import 'navigation_provider.dart';
import 'router_path.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  bool isDuplicate = false;
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    refreshListenable: notifier,
    redirect: (context, state) {
      final isLoggedIn = notifier.isLoggedIn;
      final isGoingToLogin = state.name == RouterPath.LOGIN;

      if (!isLoggedIn && !isGoingToLogin && !isDuplicate) {
        isDuplicate = true;
        return '/login';
      }
      if (isGoingToLogin && isGoingToLogin && !isDuplicate) {
        isDuplicate = true;
        return '/';
      }

      if (isDuplicate) {
        isDuplicate = false;
      }

      return null;
    },
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/login',
        name: "LOGIN",
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) =>
              Container(key: state.pageKey, child: child),
          routes: [
            GoRoute(
              path: '/',
              name: RouterPath.DASHBOARD,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: Dashboard(
                  key: state.pageKey,
                ));
              },
            ),
          ])
    ],
    errorBuilder: (context, state) => Container(
      // errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});

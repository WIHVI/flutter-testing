import 'package:flutter/material.dart';
import 'package:flutter_testing/config/router/app_routes.dart';
import 'package:flutter_testing/screens/error_screen.dart';
import 'package:flutter_testing/screens/onboarding_screen.dart';
import 'package:flutter_testing/screens/post_details_screen.dart';
import 'package:flutter_testing/screens/post_list_screen.dart';

import 'package:go_router/go_router.dart';

class AppRouter {
  final bool showOnboarding;

  AppRouter({required this.showOnboarding});

  get router => _router;

  late final _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: <RouteBase>[
      /// Onboarding route
      GoRoute(
        name: AppRoutes.onboarding.routePath,
        path: AppRoutes.onboarding.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),

      /// Post list routes
      GoRoute(
        name: AppRoutes.postList.routeName,
        path: AppRoutes.postList.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return const PostListScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            name: AppRoutes.postDetails.routeName,
            path: AppRoutes.postDetails.routePath,
            builder: (BuildContext context, GoRouterState state) {
              return PostDetailsScreen(
                id: state.pathParameters['id']!,
                title: state.uri.queryParameters['title']!,
                body: state.uri.queryParameters['body']!,
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
    redirect: (context, state) {
      /* final String onboardingPath = state.namedLocation(
        AppRoutes.onboarding.routeName,
      ); */
      print('redirect');
      print(showOnboarding);

      bool isOnboarding =
          state.matchedLocation == AppRoutes.onboarding.routePath;
      print(isOnboarding);

      if (showOnboarding) {
        return isOnboarding ? null : AppRoutes.onboarding.routePath;
      }

      return null;
    },
  );
}

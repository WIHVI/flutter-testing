// Enum routes
enum AppRoutes {
  onboarding,
  postList,
  postDetails,
}

extension AppRoutesExtension on AppRoutes {
// Path for routes
  String get routePath {
    switch (this) {
      case AppRoutes.onboarding:
        return "/onboarding";

      case AppRoutes.postList:
        return "/";

      case AppRoutes.postDetails:
        return "post-details/:id";

      default:
        return "/";
    }
  }

// Named routes
  String get routeName {
    switch (this) {
      case AppRoutes.onboarding:
        return "ONBOARDING";

      case AppRoutes.postList:
        return "POST-LIST";

      case AppRoutes.postDetails:
        return "POST-DETAILS";

      default:
        return "POST-LIST";
    }
  }
}

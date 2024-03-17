import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateProvider with ChangeNotifier {
  AppStateProvider() {
    checkOnboardingStatus();
  }

  bool _showOnboarding = false;
  bool get showOnboarding => _showOnboarding;
  set showOnboarding(bool value) {
    _showOnboarding = value;
    notifyListeners();
  }

  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;

    _showOnboarding = !onboardingCompleted;

    notifyListeners();
  }
}

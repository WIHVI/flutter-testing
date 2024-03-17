import 'package:flutter/material.dart';
import 'package:flutter_testing/providers/app_state_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  // void _completeOnboarding() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('onboarding_completed', true);
  // }

  @override
  Widget build(BuildContext context) {
    final appStateProvider = Provider.of<AppStateProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              appStateProvider.showOnboarding = false;
              // _completeOnboarding();
              context.go('/');
            },
            child: const Text('Continue'),
          )
        ],
      ),
    );
  }
}

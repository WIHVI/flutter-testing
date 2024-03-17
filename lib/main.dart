import 'package:flutter/material.dart';
import 'package:flutter_testing/config/router/app_router.dart';
import 'package:flutter_testing/providers/app_state_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppStateProvider()),
        ProxyProvider<AppStateProvider, AppRouter>(
          update: (context, appStateProvider, _) => AppRouter(
            showOnboarding: appStateProvider.showOnboarding,
          ),
        ),
      ],
      child: Builder(
        builder: ((context) {
          final GoRouter router = Provider.of<AppRouter>(context).router;

          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}

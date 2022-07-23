import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today/router/routes.dart';
import 'package:today/ui/login/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globalSharedPreferences = await SharedPreferences.getInstance();
  // turn off the # in the URLs on the web
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  var initialized = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (initialized) {
        return;
      }
      // TODO Add Authorization code
      initialized = true;
    });
    final router = ref.watch(routeProvider).router;
    initDatabase();
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Today',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          canvasColor: startGradientColor,
      ),
    );
  }

  // TODO Add Database Initialization code
  void initDatabase() async {
  }
}

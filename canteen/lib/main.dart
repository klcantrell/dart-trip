import 'package:canteen/providers/providers.dart';
import 'package:canteen/screens/login/login.dart';
import 'package:canteen/screens/main_tabs.dart';
import 'package:canteen/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VRouter(
      initialUrl: Routes.root.name,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ProximaNova',
      ),
      routes: [
        VGuard(
          beforeEnter: ((vRedirector) async {
            final loggedIn = ref.read(loggedInProvider);
            if (loggedIn) {
              return;
            }
            return vRedirector.to(Routes.login.name);
          }),
          stackedRoutes: [mainTabs],
        ),
        loginScreens,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

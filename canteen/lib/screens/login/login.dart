import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import '../../providers/providers.dart';
import '../screens.dart';

final loginScreens = VWidget(
  path: Routes.login.name,
  widget: const Scaffold(
    body: LoginPage(),
  ),
  transitionDuration: const Duration(milliseconds: 0),
);

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Center(
        child: TextButton(
          onPressed: () {
            ref.read(loggedInProvider.state).state = true;
            context.vRouter.to(Routes.root.name);
          },
          child: const Text('Log in'),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import '../providers/providers.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: context.vRouter.path == '/' ? 0 : 1,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Workflow',
            icon: Icon(CupertinoIcons.drop),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            context.vRouter.to(Routes.root.name);
          } else {
            context.vRouter.to(Routes.workflow.name);
          }
        },
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            TextButton(
              child: const Text('Log out'),
              onPressed: () {
                ref.read(loggedInProvider.state).state = false;
                context.vRouter.to(Routes.login.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum Routes {
  root('/'),
  login('/login'),
  workflow('/workflow'),
  workflowStepsRoot('/workflow/steps'),
  workflowStep1('/workflow/steps/1'),
  workflowStep2('/workflow/steps/2');

  const Routes(this.name);
  final String name;
}

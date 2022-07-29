import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loggedInProvider = StateProvider((ref) => false);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VRouter(
      initialUrl: '/',
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
            return vRedirector.to('/login');
          }),
          stackedRoutes: [
            VNester(
              widgetBuilder: (child) => MainPage(child: child),
              path: '/',
              nestedRoutes: [
                VWidget(
                  path: null,
                  widget: const HomePage(),
                  transitionDuration: const Duration(milliseconds: 0),
                ),
                VWidget(
                  path: '/workflow',
                  widget: const WorkflowPage(),
                  aliases: const ['/workflow/step1', '/workflow/step2'],
                  transitionDuration: const Duration(milliseconds: 0),
                ),
              ],
              stackedRoutes: [
                VWidget(
                  path: '/workflow/step1',
                  widget: const WorkflowStep1Page(),
                  buildTransition: (animation, secondaryAnimation, child) {
                    final tween =
                        Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                            .chain(CurveTween(curve: Curves.ease));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                  stackedRoutes: [
                    VWidget(
                      path: '/workflow/step2',
                      widget: const WorkflowStep2Page(),
                      // buildTransition: (animation, secondaryAnimation, child) {
                      //   if (animation.status == AnimationStatus.reverse) {
                      //     final tween = Tween(
                      //             begin: const Offset(0.0, 1.0),
                      //             end: Offset.zero)
                      //         .chain(CurveTween(curve: Curves.ease));
                      //     return SlideTransition(
                      //       position: animation.drive(tween),
                      //       child: child,
                      //     );
                      //   } else {
                      //     final tween = Tween(
                      //             begin: const Offset(1.0, 0.0),
                      //             end: Offset.zero)
                      //         .chain(CurveTween(curve: Curves.ease));
                      //     return SlideTransition(
                      //       position: animation.drive(tween),
                      //       child: child,
                      //     );
                      //   }
                      // },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        VWidget(
          path: '/login',
          widget: const Scaffold(
            body: LoginPage(),
          ),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

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
            context.vRouter.to('/');
          } else {
            context.vRouter.to('/workflow');
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
                context.vRouter.to('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Center(
        child: TextButton(
          onPressed: () {
            ref.read(loggedInProvider.state).state = true;
            context.vRouter.to('/');
          },
          child: const Text('Log in'),
        ),
      ),
    );
  }
}

class WorkflowPage extends StatelessWidget {
  const WorkflowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Workflow'),
          TextButton(
            child: const Text('Do it'),
            onPressed: () {
              context.vRouter.to('/workflow/step1');
            },
          ),
        ],
      ),
    );
  }
}

class WorkflowStep1Page extends StatelessWidget {
  const WorkflowStep1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: IconButton(
                onPressed: () {
                  context.vRouter.to('/workflow', isReplacement: true);
                },
                icon: const Icon(
                  Icons.close,
                  size: 35,
                ),
              ),
            ),
            Column(
              children: [
                const Center(
                  child: Text('Step 1'),
                ),
                TextButton(
                  onPressed: () {
                    context.vRouter.to('/workflow/step2');
                  },
                  child: const Text('Next'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WorkflowStep2Page extends StatelessWidget {
  const WorkflowStep2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: IconButton(
                onPressed: () {
                  context.vRouter.to('/workflow', isReplacement: true);
                },
                icon: const Icon(
                  Icons.close,
                  size: 35,
                ),
              ),
            ),
            Column(
              children: [
                const Center(
                  child: Text('Step 1'),
                ),
                TextButton(
                  onPressed: () {
                    context.vRouter.historyGo(-1);
                  },
                  child: const Text('Previous'),
                ),
                TextButton(
                  onPressed: () {
                    context.vRouter.to('/workflow', isReplacement: true);
                  },
                  child: const Text('Done'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

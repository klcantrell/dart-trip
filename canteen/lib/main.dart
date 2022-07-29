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
                widgetBuilder: (child) => MyHomePage(child: child),
                path: '/',
                nestedRoutes: [
                  VWidget(
                    path: null,
                    widget: const TodayPage(),
                    transitionDuration: const Duration(milliseconds: 0),
                  ),
                  VWidget(
                    path: '/history',
                    widget: const HistoryPage(),
                    aliases: const ['/history/details'],
                    transitionDuration: const Duration(milliseconds: 0),
                  ),
                ],
                stackedRoutes: [
                  VWidget(
                    fullscreenDialog: false,
                    path: '/history/details',
                    widget: const HistoryDetailsPage(),
                    buildTransition: (animation, secondaryAnimation, child) {
                      final tween =
                          Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.ease));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  )
                ]),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: context.vRouter.path == '/' ? 0 : 1,
        items: const [
          BottomNavigationBarItem(
            label: 'Today',
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: Icon(CupertinoIcons.drop),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            context.vRouter.to('/');
          } else {
            context.vRouter.to('/history');
          }
        },
      ),
    );
  }
}

class TodayPage extends ConsumerWidget {
  const TodayPage({Key? key}) : super(key: key);

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

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('History'),
          TextButton(
            child: const Text('See more'),
            onPressed: () {
              context.vRouter.to('/history/details');
            },
          ),
        ],
      ),
    );
  }
}

class HistoryDetailsPage extends StatelessWidget {
  const HistoryDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: IconButton(
                onPressed: () {
                  context.vRouter.historyBack();
                },
                icon: const Icon(
                  Icons.close,
                  size: 35,
                ),
              ),
            ),
            const Center(
              child: Text('History details'),
            ),
          ],
        ),
      ),
    );
  }
}

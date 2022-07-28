import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

final loggedInProvider = StateProvider((ref) => true);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedIn = ref.watch(loggedInProvider);

    final loggedInRoutes = RouteMap(routes: {
      '/': (route) => const CupertinoTabPage(
            child: MyHomePage(),
            paths: ['/home', '/history'],
          ),
      '/home': (route) => MaterialPage(
            child: Scaffold(
              appBar: AppBar(title: const Text('Home')),
              body: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const Text('Home'),
                      TextButton(
                        child: const Text('Log out'),
                        onPressed: () {
                          ref.read(loggedInProvider.state).state = false;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      '/history': (route) => MaterialPage(
            child: Scaffold(
              appBar: AppBar(title: const Text('History')),
              body: const SafeArea(
                child: Center(
                  child: Text('History'),
                ),
              ),
            ),
          )
    });

    final loggedOutRoutes = RouteMap(routes: {
      '/home': (route) => TransitionPage(
            pushTransition: PageTransition.none,
            child: Scaffold(
              appBar: AppBar(title: const Text('Logged out!')),
              body: SafeArea(
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      ref.read(loggedInProvider.state).state = true;
                    },
                    child: const Text('Log in'),
                  ),
                ),
              ),
            ),
          ),
    });

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ProximaNova',
      ),
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) => loggedIn ? loggedInRoutes : loggedOutRoutes,
      ),
      routeInformationParser: const RoutemasterParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final tabState = CupertinoTabPage.of(context);

    return CupertinoTabScaffold(
      tabBuilder: tabState.tabBuilder,
      tabBar: CupertinoTabBar(
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
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var toggle = 0;

  @override
  Widget build(BuildContext context) {
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
                        child: const Text('Toggle'),
                        onPressed: () {
                          setState(() {
                            toggle = toggle == 1 ? 0 : 1;
                          });
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
      '/home': (route) => MaterialPage(
            child: Scaffold(
              appBar: AppBar(title: const Text('Toggle is 1')),
              body: const SafeArea(
                child: Center(
                  child: Text('Toggle is 1'),
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
        routesBuilder: (context) =>
            toggle == 0 ? loggedInRoutes : loggedOutRoutes,
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

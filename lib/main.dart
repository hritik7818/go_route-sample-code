import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MyRouter.goRouter,
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(MyRouteConstants.secondPageRouteName);
          },
          child: const Text('go to second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: const Center(child: Text('Second Screen')),
    );
  }
}

class MyRouter {
  static GoRouter goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) {
          return const Screen();
        },
      ),
      GoRoute(
        path: '/second',
        name: 'second',
        builder: (context, state) {
          return const SecondScreen();
        },
      ),
    ],
  );
}

class MyRouteConstants {
  static const String homeRouteName = 'home';
  static const String secondPageRouteName = 'second';
}

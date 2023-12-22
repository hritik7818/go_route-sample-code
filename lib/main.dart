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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(MyRouteConstants.secondPageRouteName);
              },
              child: const Text('go to second Screen'),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  MyRouteConstants.thirdPageRouteName,
                  pathParameters: {"data": "sample data"},
                );
              },
              child: const Text('go to third Screen'),
            ),
          ],
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

class ThirdScreen extends StatelessWidget {
  final String data;
  const ThirdScreen({required this.data, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdScreen'),
      ),
      body: Center(
        child: Text('ThirdScreen : $data'),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Screen'),
      ),
      body: const Center(
        child: Text('Error 404'),
      ),
    );
  }
}

class MyRouter {
  static GoRouter goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: MyRouteConstants.homeRouteName,
        builder: (context, state) {
          return const Screen();
        },
      ),
      GoRoute(
        path: '/second',
        name: MyRouteConstants.secondPageRouteName,
        builder: (context, state) {
          return const SecondScreen();
        },
      ),
      GoRoute(
        path: '/third/:data',
        name: MyRouteConstants.thirdPageRouteName,
        builder: (context, state) {
          return ThirdScreen(
            data: state.pathParameters['data']!,
          );
        },
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}

class MyRouteConstants {
  static const String homeRouteName = 'home';
  static const String secondPageRouteName = 'second';
  static const String thirdPageRouteName = 'third';
}

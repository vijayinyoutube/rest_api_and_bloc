import 'package:flutter/material.dart';

class RouteGenerator {
  final HomepageBloc _homePageBloc = HomepageBloc(HomePageRepo());

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomepageBloc>.value(
            value: _homePageBloc,
            child: const HomePage(),
          ),
        );

      case '/dashboard':
        final arg = settings.arguments as List<HomePageMode>;
        if (arg.isNotEmpty) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<DashboardBloc>.value(
              value: _dashboardBloc,
              child: DashboardPage(
                animals: arg,
              ),
            ),
          );
        } else {
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

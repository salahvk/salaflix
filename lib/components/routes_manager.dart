import 'package:flutter/material.dart';
import 'package:salafix/screens/home_page.dart';
import 'package:salafix/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homePage = '/hompage';
  // static const String searchedMovie = '/searchedMovie';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const Splash());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      // case Routes.searchedMovie:
      //   return MaterialPageRoute(builder: (_) => const SearchedMovie());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No Route Found"),
        ),
        body: const Center(
          child: Text("No Route Found"),
        ),
      ),
    );
  }
}

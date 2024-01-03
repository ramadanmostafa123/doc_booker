import 'package:doc_booker/core/routing/routes.dart';
import 'package:doc_booker/faetures/on_boarding/ui/on_boarding.dart';
import 'package:doc_booker/faetures/login/ui/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRote(RouteSettings settings) {
    //
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No Routes define for ${settings.name}')),
                ));
    }
  }
}

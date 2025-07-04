import 'package:flutter/cupertino.dart';
import 'package:simple_post_app/cors/routes/routes_name.dart';
import 'package:simple_post_app/presentation/views/parent_screen/parent_screen.dart';
import 'package:simple_post_app/presentation/views/splash_screen/splash_screen.dart';

import '../../presentation/views/home/screen/home_screen.dart';

class AppRoutes {
  static const String initialRoute = RouteNames.splashScreen;

  static final Map<String, WidgetBuilder> routes = {
    RouteNames.homeScreen: (context) => const HomeScreen(),
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.parentScreen: (context) => const ParentScreen(),

  };
}
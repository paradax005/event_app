import 'package:event_app/features/home_tab/home_tab.dart';
import 'package:event_app/features/login/presentation/login_page.dart';
import 'package:event_app/features/register/presentation/register_page.dart';
import 'package:event_app/global/views/page_under_construction.dart';
import 'package:flutter/material.dart';

const String splashScreen = '/';
const String settingsPage = 'settings';
const String loginPage = '/';
const String registerPage = 'register';
const String forgotPassword = 'forgot-password';
const String homePage = 'homePage';
const String eventPage = 'eventPage';

// controller function with switch statement to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return _pageBuilder(
        (_) => const LoginPage(),
        settings: settings,
      );
    case registerPage:
      return _pageBuilder(
        (_) => const RegisterPage(),
        settings: settings,
      );
    case homePage:
      return _pageBuilder(
        (_) => const MainScreen(),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}

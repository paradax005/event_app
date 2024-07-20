import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/features/login/presentation/login_ui.dart';
import 'package:event_app/global/views/gradient_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _autoValidate = false;

  void setPasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: LoginUi(
              emailController: emailController,
              passwordController: passwordController,
              obscurePassword: _obscureText,
              setVisibility: setPasswordVisibility,
              autoValidate: _autoValidate,
              formKey: formKey,
              login: () => _login(context),
              goToForgotPassword: () => _navigateToForgotPassword(context),
              goToRegister: () => _navigateToRegister(context),
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    setState(() {
      _autoValidate = true;
    });
    if (formKey.currentState?.validate() ?? false) {
      final email = emailController.text;
      final password = passwordController.text;

      if (kDebugMode) {
        print('email value here : $email');
        print('password value here : $password');
      }

      // GO TO HOME SCREEN FOR NOW
    }
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.of(context).pushNamed(registerPage);
  }

  void _navigateToForgotPassword(BuildContext context) {
    Navigator.of(context).pushNamed(forgotPassword);
  }
}

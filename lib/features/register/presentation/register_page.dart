import 'package:event_app/features/register/presentation/widgets/register_ui.dart';
import 'package:event_app/global/views/gradient_background.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late PageController _pageController;
  late TextEditingController _userNameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  final firstFormKey = GlobalKey<FormState>();
  final secondFormKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _autoValidateFirstForm = false;
  bool _autoValidateSecondForm = false;

  void setPasswordVisibility(int index) {
    if (index == 0) {
      setState(() {
        _obscurePassword = !_obscurePassword;
      });
    } else {
      setState(() {
        _obscureConfirmPassword = !_obscureConfirmPassword;
      });
    }
  }

  void next() {
    setState(() {
      _autoValidateFirstForm = true;
    });
  }

  void confirmButton() {
    setState(() {
      _autoValidateSecondForm = true;
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    _userNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Expanded(
                  child: RegisterUi(
                    pageController: _pageController,
                    userNameController: _userNameController,
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    emailController: _emailController,
                    nextButton: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease,
                      );
                    },
                    firstFormKey: firstFormKey,
                    firstAutoValidate: _autoValidateFirstForm,
                    passwordController: _passwordController,
                    showPassword: _obscurePassword,
                    confirmPasswordController: _confirmPasswordController,
                    showConfirmPassword: _obscureConfirmPassword,
                    confirmButton: confirmButton,
                    secondFormKey: secondFormKey,
                    autoValidateSecondForm: _autoValidateSecondForm,
                    setVisibility: setPasswordVisibility,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

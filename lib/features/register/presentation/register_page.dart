import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/features/register/presentation/widgets/registration_first_section.dart';
import 'package:event_app/features/register/presentation/widgets/registration_second_section.dart';
import 'package:event_app/global/translation/generated/locale_keys.g.dart';
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
    final theme = Theme.of(context);
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
                const SizedBox(height: 30),
                Align(
                  child: Text(
                    LocaleKeys.auth_sign_up.tr(),
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      RegistrationFirstSection(
                        userNameController: _userNameController,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        emailNameController: _emailController,
                        autoValidate: _autoValidateFirstForm,
                        nextButton: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        formKey: firstFormKey,
                      ),
                      RegistrationSecondSection(
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        confirmButton: () {},
                        formKey: secondFormKey,
                        autoValidate: _autoValidateSecondForm,
                        showPassword: _obscurePassword,
                        showConfirmPassword: _obscureConfirmPassword,
                        setVisibility: setPasswordVisibility,
                      ),
                    ],
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

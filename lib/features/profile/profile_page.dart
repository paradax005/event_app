import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/features/profile/widgets/logout_button.dart';
import 'package:event_app/features/profile/widgets/personal_details.dart';
import 'package:event_app/features/profile/widgets/profile_header.dart';
import 'package:event_app/global/utils/const.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController birthDateController;

  @override
  void initState() {
    fullNameController = TextEditingController(text: fullName);
    emailController = TextEditingController(text: email);
    phoneNumberController = TextEditingController(text: phoneNumber);
    birthDateController = TextEditingController(text: birthDate);
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: Column(
              children: [
                const ProfileHeader(),
                const SizedBox(height: 30),
                PersonalDetails(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  phoneNumberController: phoneNumberController,
                  birthDateController: birthDateController,
                ),
                LogoutButton(
                  logout: () {
                    Navigator.of(context).pushReplacementNamed(loginPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

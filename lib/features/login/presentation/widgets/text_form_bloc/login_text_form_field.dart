import 'package:event_app/global/theme/theme.dart';
import 'package:flutter/material.dart';

class LoginTextForm extends StatelessWidget {
  const LoginTextForm({
    required this.hint,
    required this.controller,
    required this.validateData,
    super.key,
    this.isNotEmail = true,
    this.obscureText = false,
    this.isPassword = false,
    this.setVisibility,
    this.prefixIcon,
  });
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validateData;
  final bool obscureText;
  final bool isNotEmail;
  final bool? isPassword;
  final VoidCallback? setVisibility;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: theme.textTheme.headlineSmall,
      cursorColor: geryTextLoginInputColor,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: geryInputLoginBackGroundColor,
        // Background color
        hintText: hint,
        // Placeholder text
        hintStyle: theme.textTheme.headlineSmall
            ?.copyWith(color: geryHintLoginInputColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: geryInputLoginBorderColor,
          ),
        ),
        helperText: ' ',
        helperStyle: theme.textTheme.headlineSmall?.copyWith(
          color: Colors.transparent,
          height: 0.5,
        ),

        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: geryInputLoginBorderColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: geryTextLoginInputColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: redErrorLoginInputColor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: redErrorLoginInputColor,
          ),
        ),
        errorStyle: theme.textTheme.headlineSmall?.copyWith(
          color: redErrorLoginInputColor,
          height: 0.5,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: (isPassword ?? false)
            ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye,
                ),
                color: theme.highlightColor,
                onPressed: setVisibility,
              )
            : null,
      ),
      validator: validateData,
      obscureText: obscureText,
      keyboardType:
          isNotEmail ? TextInputType.text : TextInputType.emailAddress,
      controller: controller,
      textCapitalization: isNotEmail == true
          ? TextCapitalization.words
          : TextCapitalization.sentences,
    );
  }
}

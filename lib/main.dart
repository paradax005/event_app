import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/core/routes/app_routes.dart' as route;
import 'package:event_app/global/theme/theme.dart';
import 'package:event_app/global/translation/generated/codegen_loader.g.dart';
import 'package:event_app/global/translation/generated/locale_keys.g.dart';
import 'package:event_app/global/translation/supported_languages.dart';
import 'package:event_app/global/utils/const.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: translationPath,
      supportedLocales: [
        Locale(SupportedLanguageEasyLocalization.en.name),
        Locale(SupportedLanguageEasyLocalization.fr.name),
      ],
      fallbackLocale: Locale(SupportedLanguageEasyLocalization.en.name),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LocaleKeys.app_name.tr(),
      theme: appGlobalTheme,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      onGenerateRoute: route.controller,
    );
  }
}

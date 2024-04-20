import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/countryselection_controller.dart';
import 'controllers/terms_controller.dart';
import 'core/constants/app_theme.dart';
import 'view/onboarding/onboarding_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TermsController(),
    ),
    ChangeNotifierProvider(
      create: (context) => CountrySelectionController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const OnboardingScreen(),
      ),
    );
  }
}

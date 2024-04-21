import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/otp_controller.dart';
import 'package:provider/provider.dart';
import 'controllers/countryselection_controller.dart';
import 'controllers/phone_number_controller.dart';
import 'controllers/terms_controller.dart';
import 'view/onboarding/onboarding_screen.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TermsController(),
    ),
    ChangeNotifierProvider(
      create: (context) => CountrySelectionController(),
    ),
    ChangeNotifierProvider(
      create: (context) => OTPController(),
    ),
    ChangeNotifierProvider(
      create: (context) => PhoneNumberController(),
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
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const OnboardingScreen(),
      ),
    );
  }
}

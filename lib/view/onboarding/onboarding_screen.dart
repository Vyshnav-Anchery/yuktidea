import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/country%20selection/country_screen.dart';
import '../../core/constants/app_theme.dart';
import '../terms&conditions/terms_screen.dart';
import 'widgets/onboarding_optionbutton.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.sizeOf(context).height / 2;

    return Scaffold(
      body: Stack(
        children: [
          // Bg imgage
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: cardHeight,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/scholar.jpg"),
                        fit: BoxFit.cover)),
              )),
          // Banner
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: cardHeight - 30,
              child: Container(
                  height: cardHeight,
                  decoration: AppTheme.cardDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Welcome to Study Lancer",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Text("Please select your role to get registered"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OnboardingButton(
                            imgPath: "assets/images/student.png",
                            text: "Student",
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CountrySelectionScreen(
                                            isStudent: true))),
                          ),
                          OnboardingButton(
                            imgPath: "assets/images/agent.png",
                            text: "Agent",
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CountrySelectionScreen(
                                            isStudent: false))),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("By continuing you agree to our"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TermsAndConditionScreen(),
                                    ));
                              },
                              child: Text(
                                "Terms and Conditions",
                                style:
                                    TextStyle(color: AppTheme.appPrimaryColor),
                              ))
                        ],
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}

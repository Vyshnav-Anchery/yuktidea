import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import 'widgets/login_formfiled.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "FarmerEats",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Welcome back!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text("New here?"),
                    TextButton(
                        onPressed: () {}, child: const Text("Create account"))
                  ],
                ),
                const SizedBox(height: 50),
                Form(
                    child: Column(
                  children: [
                    const LoginFormField(
                        hintText: "Email Address",
                        prefixIcon: Icon(Icons.alternate_email)),
                    const SizedBox(height: 20),
                    LoginFormField(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        sufixIcon: TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ForgotPasswordScreen()));
                            },
                            child: const Text("Forgot?"))),
                    const SizedBox(height: 30),
                    // Login Button
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor),
                            fixedSize: MaterialStatePropertyAll(
                                Size(screenWidth / 1.5, 50))),
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )),
                const SizedBox(height: 30),
                const Center(
                    child: Text(
                  "or login with",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                )),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child:
                            Image.asset(AppConstants.googleLogo, height: 20)),
                    ElevatedButton(
                        onPressed: () {},
                        child: Image.asset(AppConstants.appleLogo, height: 20)),
                    ElevatedButton(
                        onPressed: () {},
                        child: Image.asset(AppConstants.fbLogo, height: 20)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

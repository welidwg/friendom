import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:friendom/components/ActionButton.dart';
import 'package:friendom/components/Input.dart';
import 'package:friendom/constants/colors.dart';
import 'package:friendom/pages/sign_up_screen.dart';
import 'package:friendom/pages/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double bottom =MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      resizeToAvoidBottomInset: true,
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushNamed(SplashScreen.id);
          // print("test");
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "images/friendom_main.png",
                    fit: BoxFit.contain,
                    height: 160,
                  )
                      .animate()
                      .fade(duration: 800.ms)
                      .move(duration: 800.ms, curve: Curves.linear),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(13.0),
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Exo",
                                fontSize: 26,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                Input(
                                  label: "Email",
                                  is_Password: false,
                                  onChange: (value) {},
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email';
                                    } else if (!EmailValidator.validate(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                Input(
                                  label: "Password",
                                  is_Password: true,
                                  onChange: (value) {},
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'testest';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ActionButton(
                          label: "Log in",
                          textColor: kPrimaryColor,
                          color: kSecondaryColor,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 10,),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                          height: 16.0,
                        ),

                        SizedBox(height: 10,),

                        Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "You don't have an account? ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, SignUpScreen.id);                                },
                                  child: const Text(
                                    "Sign up  ",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ).animate().fade(duration: 800.ms, delay: 400.ms),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

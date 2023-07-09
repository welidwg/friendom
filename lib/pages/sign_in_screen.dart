import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:friendom/components/ActionButton.dart';
import 'package:friendom/components/Input.dart';
import 'package:friendom/constants/colors.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "sign_in_screen";

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Exo",
                            fontSize: 26,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Input(
                            label: "Name",
                            is_Password: false,
                            onChange: (value) {},
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'testest';
                            //   }
                            //   return null;
                            // },
                          ),
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
                    SizedBox(
                      height: 8,
                    ),
                    ActionButton(
                      label: "Start your experience",
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
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      height: 16.0,
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account ? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: Go to login
                          },
                          child: const Text(
                            "Log in ",
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
    );
  }
}

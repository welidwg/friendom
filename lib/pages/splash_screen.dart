import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:friendom/components/ActionButton.dart';
import 'package:friendom/constants/colors.dart';
import 'package:friendom/pages/LoginScreen.dart';
import 'package:friendom/pages/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
   static final String id="splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()async{
          return false;
        },
        child: Container(
          color: kPrimaryColor,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(
                      "images/friendom_main.png",
                      fit: BoxFit.contain,
                    )
                        .animate()
                        .fade(duration: 800.ms)
                        .move(duration: 800.ms, curve: Curves.linear)),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Center(
                              child: const Text(
                                "Find new friends !",
                                style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 32,
                                    fontFamily: "Exo",
                                    fontWeight: FontWeight.w900,
                                    wordSpacing: 2),
                                textAlign: TextAlign.center,
                              ).animate().fade(delay: 400.ms, duration: 800.ms),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: const Text(
                                "Friendom will match you with a random person.\n Have fun and don't be toxic.",
                                style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 14,
                                    fontFamily: "Exo",
                                    wordSpacing: 2),
                                textAlign: TextAlign.center,
                              ).animate().fade(delay: 400.ms, duration: 1000.ms),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ActionButton(
                              color: Colors.white,
                              icon: Icons.arrow_forward_ios_rounded,
                              label: "Get started",
                              textColor: kPrimaryColor,
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         SignInScreen(), // Provide the target screen widget
                                //   ),
                                // );
                                Navigator.pushNamed(context, SignUpScreen.id);
                              },
                            ).animate().fade(delay: 800.ms, duration: 800.ms),

                            SizedBox(
                              height: 9,
                            ),
                            ActionButton(
                              color: kSecondaryColor,
                              label: "I already have an account",
                              textColor: kPrimaryColor,
                              onPressed: () {
                                Navigator.pushNamed(context, LoginScreen.id);

                              },
                            ).animate().fade(delay: 800.ms, duration: 800.ms)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

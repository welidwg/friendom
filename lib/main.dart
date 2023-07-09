import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friendom/pages/home.dart';
import 'package:friendom/pages/sign_in_screen.dart';
import 'package:friendom/pages/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Friendom',
        themeMode: ThemeMode.system,
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home:  const Scaffold(
          body: SplashScreen(),
        ),
      initialRoute: SplashScreen.id,
      routes: {
        SignInScreen.id: (context) => const SignInScreen(),
      },
    );

  }
}

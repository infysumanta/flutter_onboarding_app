import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubeblog/screens/onboarding_screens.dart';
import 'package:youtubeblog/screens/signup_screens.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seenOnboard = prefs.getBool('seenOnboard') ?? false;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        home: seenOnboard == true
            ? const SignUnScreen()
            : const OnboardingScreen());
  }
}

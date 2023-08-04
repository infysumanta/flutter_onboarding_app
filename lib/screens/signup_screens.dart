import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubeblog/main.dart';
import 'package:youtubeblog/screens/onboarding_screens.dart';

class SignUnScreen extends StatefulWidget {
  const SignUnScreen({super.key});

  @override
  State<SignUnScreen> createState() => _SignUnScreenState();
}

class _SignUnScreenState extends State<SignUnScreen> {
  Future setSeenOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
          onPressed: () {
            setSeenOnboard();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            );
          },
          child: const Text("BACK TO ONBOARDING")),
    ));
  }
}

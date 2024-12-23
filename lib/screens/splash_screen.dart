import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Aenzbi Wallet',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

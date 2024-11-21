import 'package:flutter/material.dart';
//import 'package:stellar/theme/colors.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: ,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/png/onboarding3.png'
              ),
              fit: BoxFit.cover
            )
        )
      ),
    );
  }
}
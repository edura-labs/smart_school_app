import 'package:flutter/material.dart';
//import 'package:stellar/theme/colors.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: ,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/png/onboarding1.png'
              ),
              fit: BoxFit.cover
            )
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
//import 'package:stellar/theme/colors.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE7D6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mark Homework as completed",
            style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stellar/theme/colors.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFd4f5ff), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Rectify your\n",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: "Attendance",
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Placeholder image
            Image.asset(
              "assets/images/png/placeholder_image.png",
            ),

            const SizedBox(height: 80),

            // Circular Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                // Navigation logic here
              },
              child: Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: kTextWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
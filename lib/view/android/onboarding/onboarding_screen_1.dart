import 'package:flutter/material.dart';
import 'package:stellar/theme/colors.dart';

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
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Mark Homework\n",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: "as completed",
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


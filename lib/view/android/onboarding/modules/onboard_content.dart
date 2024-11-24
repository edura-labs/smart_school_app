import 'package:stellar/constants/assets.dart';
import 'package:stellar/models/auth/onboard_model.dart';
import 'package:stellar/theme/colors.dart';

class OnboardContent {
  List<OnboardModel> items = [
    OnboardModel(
      title: "Your Learning Tools, Anytime!",
      description:
          "Download handouts and textbooks directly to your mobile device, making study time smarter and easier.",
      image: Assets.onboard1Svg,
      backgroundColor: kPrimaryColor.withOpacity(.4),
    ),
    OnboardModel(
      title: "Stay on Top of Your Grades!",
      description:
          "Easily check your results anytime, anywhere, and track your progress like a pro.",
      image: Assets.onboard2Svg,
      backgroundColor: kPrimaryColor.withOpacity(.6),
    ),
    OnboardModel(
      title: "Payments Made Simple and Secure!",
      description:
          "Handle school-related fees easily through our safe and seamless payment system.",
      image: Assets.onboard3Svg,
      backgroundColor: kPrimaryColor.withOpacity(.8),
    ),
    OnboardModel(
      title: "Your Profile, One Tap Away!",
      description:
          "Access and manage your student profile effortlessly—all in one app.",
      image: Assets.onboard4Svg,
      backgroundColor: kPrimaryColor.withOpacity(.94),
    ),
  ];
}

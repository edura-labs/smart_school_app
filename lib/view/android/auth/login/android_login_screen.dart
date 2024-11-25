import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/assets.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/login_controller.dart';
import 'package:stellar/theme/colors.dart';
import 'package:stellar/utils/buttons/android/android_elevated_button.dart';
import 'package:stellar/utils/text_form_fields/android/android_textformfield.dart';

class AndroidLoginScreen extends GetView<LoginController> {
  const AndroidLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: Scaffold(
            backgroundColor: colorScheme.primary,
            body: Stack(
              children: [
                backgroundImage(size),
                SafeArea(
                  child: Column(
                    children: [
                      topSection(size, colorScheme),
                      formSection(colorScheme, controller),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  formSection(ColorScheme colorScheme, LoginController controller) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(32),
            ),
          ),
        ),
        child: ListView(
          children: [
            20.toHeight,
            Obx(() {
              return loginForm(controller, colorScheme);
            }),
          ],
        ),
      ),
    );
  }

  loginForm(LoginController controller, ColorScheme colorScheme) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AndroidTextFormField(
            controller: controller.emailEC,
            focusNode: controller.emailFN,
            prefixIcon: Icon(
              Icons.email,
              color: colorScheme.inversePrimary,
            ),
            keyboardType: TextInputType.emailAddress,
            labelText: "Email",
            hintText: "Enter your email address",
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              return null;
            },
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: .4,
                color: colorScheme.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: colorScheme.primary,
              ),
            ),
          ),
          20.toHeight,
          AndroidTextFormField(
            controller: controller.passwordEC,
            focusNode: controller.passwordFN,
            obscureText: controller.passwordIsHidden.value,
            obscuringCharacter: "*",
            prefixIcon: Icon(
              Icons.password,
              color: colorScheme.inversePrimary,
            ),
            suffixIcon: IconButton(
              onPressed: controller.togglePasswordVisibility,
              icon: Icon(
                controller.passwordIsHidden.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: colorScheme.inversePrimary,
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            hintText: "Enter your password",
            labelText: "Password",
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              return null;
            },
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: .4,
                color: colorScheme.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: colorScheme.primary,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.center,
                style: defaultTextStyle(
                  color: colorScheme.inversePrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          40.toHeight,
          AndroidElevatedButton(
            title: "Sign In",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  topSection(Size size, ColorScheme colorScheme) {
    return SizedBox(
      height: size.height / 3.6,
      width: size.width,
      // color: colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            height: 100,
            width: 100,
            Assets.appIconSvg,
          ),
          10.toHeight,
          Text(
            "Stellar",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          20.toHeight,
          Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: kTextWhiteColor,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  backgroundImage(Size size) {
    return Image.asset(
      Assets.atomIconPng,
      color: kLightGreyColor.withOpacity(.06),
      height: size.height / 1.2,
      width: size.width,
      fit: BoxFit.cover,
    );
  }
}

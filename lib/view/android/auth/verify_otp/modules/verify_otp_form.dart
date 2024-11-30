import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/verify_otp_controller.dart';

import '../../../../../utils/text_form_fields/android/android_textformfield.dart';

androidVerifyOTPForm(
  VerifyOTPController controller,
  BuildContext context,
) {
  return Form(
    key: controller.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: AndroidTextFormField(
            controller: controller.pin1EC,
            focusNode: controller.pin1FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onChanged: (value) {
              controller.pin1Onchanged(value, context);
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              return null;
            },
          ),
        ),
        10.toWidth,
        Flexible(
          child: AndroidTextFormField(
            controller: controller.pin2EC,
            focusNode: controller.pin2FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              controller.pin2Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        10.toWidth,
        Flexible(
          child: AndroidTextFormField(
            controller: controller.pin3EC,
            focusNode: controller.pin3FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              controller.pin3Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        10.toWidth,
        Flexible(
          child: AndroidTextFormField(
            controller: controller.pin4EC,
            focusNode: controller.pin4FN,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              controller.pin4Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        10.toWidth,
        Flexible(
          child: AndroidTextFormField(
            controller: controller.pin5EC,
            focusNode: controller.pin5FN,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onFieldSubmitted: controller.onSubmitted,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              controller.pin5Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        10.toWidth,
        Flexible(
          child: AndroidTextFormField(
            controller: controller.pin6EC,
            focusNode: controller.pin6FN,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onFieldSubmitted: controller.onSubmitted,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              controller.pin6Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        10.toWidth,
      ],
    ),
  );
}

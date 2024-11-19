// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/theme/colors.dart';

class AndroidTextFormField extends StatelessWidget {
  final String? hintText, obscuringCharacter;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final dynamic onSaved;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final TextCapitalization textCapitalization;

  final Function(String)? onFieldSubmitted, onChanged;
  final Widget? label, prefix, suffix, prefixIcon, suffixIcon;
  final TextStyle? helperStyle, prefixStyle, suffixStyle;
  final String? labelText, helperText, suffixText, prefixText;
  final Color? prefixIconColor, suffixIconColor;
  final bool? enabled,
      readOnly,
      alignLabelWithHint,
      autoCorrect,
      obscureText,
      filled;
  final InputBorder? inputBorder, focusedBorder, enabledBorder;

  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final int? maxLines, minLines, maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;

  const AndroidTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.onSaved,
    required this.textInputAction,
    required this.focusNode,
    this.hintText,
    required this.textCapitalization,
    this.onChanged,
    this.onFieldSubmitted,
    this.label,
    this.labelText,
    this.alignLabelWithHint,
    this.enabled,
    this.readOnly,
    this.inputFormatters,
    this.onTap,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.helperStyle,
    this.prefixStyle,
    this.suffixStyle,
    this.helperText,
    this.suffixText,
    this.prefixText,
    this.prefixIconColor,
    this.suffixIconColor,
    this.autoCorrect,
    this.obscureText,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.maxLengthEnforcement,
    this.maxLength,
    this.obscuringCharacter,
    this.filled,
    this.inputBorder,
    this.focusedBorder,
    this.enabledBorder,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      enabled: enabled,
      readOnly: readOnly ?? false,
      cursorOpacityAnimates: true,
      enableIMEPersonalizedLearning: true,
      mouseCursor: SystemMouseCursors.text,
      onTap: onTap,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onChanged: onChanged,
      textInputAction: textInputAction,
      textAlign: TextAlign.start,
      cursorColor: colorScheme.inversePrimary,
      autocorrect: autoCorrect ?? true,
      enableSuggestions: true,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      obscureText: obscureText ?? false,
      obscuringCharacter: obscuringCharacter ?? "•",
      keyboardAppearance: Get.isDarkMode ? Brightness.dark : Brightness.light,
      style: defaultTextStyle(
        fontSize: 16.0,
        color: kFormFieldTextColor,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        helperText: helperText,
        helperStyle: helperStyle,
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixStyle: prefixStyle,
        prefixIconColor: prefixIconColor,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        suffixText: suffixText,
        suffixStyle: suffixStyle,
        hintText: hintText,
        label: label,
        alignLabelWithHint: alignLabelWithHint,
        labelText: labelText,
        filled: filled ?? false,
        fillColor: colorScheme.surface,
        focusColor: const Color(0xFFF6F6F7),
        labelStyle: defaultTextStyle(
          fontSize: 16.0,
          color: kFormFieldLabelTextColor,
          fontWeight: FontWeight.normal,
        ),
        hintStyle: defaultTextStyle(
          fontSize: 16.0,
          color: kFormFieldLabelTextColor,
          fontWeight: FontWeight.normal,
        ),
        // errorStyle: const TextStyle(color: Colors.red),
        border: inputBorder ?? InputBorder.none,
        enabledBorder: enabledBorder ?? InputBorder.none,
        focusedBorder: focusedBorder ?? InputBorder.none,
      ),
    );
  }
}

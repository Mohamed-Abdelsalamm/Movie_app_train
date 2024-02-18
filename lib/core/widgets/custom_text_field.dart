import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sql_train/core/utils/colors_styles.dart';
import 'package:sql_train/core/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.prefixIcon,
    this.closeOnTapOutside = false,
    this.maxLines = 1,
    this.horizontalContentPadding = 16,
    this.verticalContentPadding = 10,
    this.suffixIcon, this.controller,
    this.onChanged,
    this.hintStyle,
    this.borderSide = BorderSide.none,
    this.fillColor = const Color(0xfff8f8f8),
    this.borderRadius = 8,
    this.focusBorderColor = ColorStyles.grey,
    this.inputFormatters,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool closeOnTapOutside;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final int? maxLines;
  final double horizontalContentPadding;
  final double verticalContentPadding;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final Color? fillColor;
  final Color? focusBorderColor;
  final BorderSide? borderSide;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles().textStyle14regular.copyWith(color: ColorStyles.black),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      obscureText: obscureText,
      onChanged: onChanged,
      cursorColor: ColorStyles.black,
      onTapOutside: (event) {
        closeOnTapOutside ? FocusManager.instance.primaryFocus?.unfocus() : null;
      },
      inputFormatters: inputFormatters ?? [FilteringTextInputFormatter.allow(RegExp(r"""[a-zA-Z\s\-\._,@0-9!?]""")),],
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        suffixIconColor: ColorStyles.grey.withOpacity(0.6),
        contentPadding: EdgeInsets.symmetric(horizontal: horizontalContentPadding ,vertical: horizontalContentPadding ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ?? TextStyles().textStyle14regular.copyWith(color: ColorStyles.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: borderSide!,),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: ColorStyles.lightGery)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide:  BorderSide(color: focusBorderColor!)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: ColorStyles.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: ColorStyles.red)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: ColorStyles.lightGery)),
      ),
    );
  }
}
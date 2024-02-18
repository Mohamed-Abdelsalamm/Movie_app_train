import 'package:flutter/material.dart';
import 'package:sql_train/core/utils/colors_styles.dart';
import 'package:sql_train/core/utils/text_styles.dart';

void showCustomSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyles().textStyle14regular.copyWith(color: ColorStyles.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
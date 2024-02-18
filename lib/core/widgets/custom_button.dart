import 'package:flutter/material.dart';
import 'package:sql_train/core/utils/colors_styles.dart';
import 'package:sql_train/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, this.onPressed}) : super(key: key);

  final String title;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        overlayColor: MaterialStatePropertyAll(Colors.white12),
        fixedSize: MaterialStatePropertyAll(Size(390, 48,),),
        backgroundColor: MaterialStatePropertyAll(ColorStyles.selectedGreen),
      ),
      child: Text(
        title,
        style: TextStyles().textStyle18Bold.copyWith(color: ColorStyles.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
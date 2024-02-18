import 'package:flutter/material.dart';
import 'package:sql_train/core/utils/text_styles.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Home View",
        style: TextStyles().textStyle32Bold,
      ),
    );
  }
}
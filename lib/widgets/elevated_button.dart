import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class QappButton extends StatelessWidget {
  const QappButton({
    required this.text,
    required this.onPressed,
    this.color = QColors.green,
    this.disabledColor = Colors.transparent,
    this.paddingLeft = 25.0,
    this.paddingRight = 25.0,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
  });

  final Color color;
  final Color disabledColor;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final String text;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),
          ),
          fixedSize: Size(Get.width - 50, 48),
          primary: color,
          onPrimary: Colors.white,
          side: const BorderSide(
            color: QColors.green,
          ),
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Text(text),
      ));
}

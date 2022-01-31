import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meritas/constants/colors.dart';

class MeritasButton extends StatelessWidget {
  const MeritasButton({
    this.color = QColors.green,
    this.disabledColor = Colors.transparent,
    this.paddingLeft = 25.0,
    this.paddingRight = 25.0,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
    required this.text,
    required this.onPressed,
  });

  final Color color;
  final Color disabledColor;
  final double paddingLeft, paddingRight, paddingTop, paddingBottom;
  final String text;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          fixedSize: Size(Get.width - 50, 48),
          primary: color,
          onPrimary: Colors.white,
          side: BorderSide(
            width: 1.0,
            color: QColors.green,
          ),
          elevation: 5,
        ),
        onPressed: () {
          onPressed;
        },
        child: Text(text),
      ));
}

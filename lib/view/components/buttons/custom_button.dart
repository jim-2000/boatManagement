// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final TextStyle textStyle;
  final double cornerRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final double width;
  final Color bgColor;
  final bool isElevated;
  const CustomButton({Key? key, required this.text, required this.press, this.textStyle = semiBoldMediumLarge, this.cornerRadius = Dimensions.mediumRadius, this.width = 1, this.horizontalPadding = 35, this.verticalPadding = 18, this.bgColor = MyColor.colorBlack, this.isElevated = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isElevated
        ? ElevatedButton(
            onPressed: press,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(cornerRadius),
                ),
              ),
              backgroundColor: bgColor,
            ),
            child: Text(
              text.tr,
              style: textStyle,
            ),
          )
        : ZoomTapAnimation(
            onTap: press,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
                color: bgColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              child: Center(
                child: Text(
                  text.tr,
                  style: textStyle,
                ),
              ),
            ),
          );
  }
}

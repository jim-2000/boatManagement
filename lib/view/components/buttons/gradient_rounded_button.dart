import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/style.dart';

import '../../../core/utils/dimensions.dart';
import '../../../core/utils/my_color.dart';

class GradientRoundedButton extends StatelessWidget {
  final String text;
  final bool showLoadingIcon;
  final VoidCallback press;
  final Color? textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double cornerRadius;

  const GradientRoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.textColor = MyColor.colorWhite,
    this.showLoadingIcon = false,
    this.horizontalPadding = 10,
    this.verticalPadding = 18,
    this.cornerRadius = Dimensions.mediumRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 7),
            blurRadius: 12,
            color: Color.fromRGBO(29, 111, 251, 0.20),
          ),
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFF2176FF), Color(0xFF0A55EB)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (!showLoadingIcon) {
            press();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showLoadingIcon)
              SizedBox(
                width: Dimensions.fontExtraLarge + 3,
                height: Dimensions.fontExtraLarge + 3,
                child: CircularProgressIndicator(color: textColor, strokeWidth: 2),
              )
            else
              Text(
                text,
                style: regularDefault.copyWith(color: textColor, fontSize: Dimensions.fontMediumLarge),
              ),
            const SizedBox(width: 10),
            // Add any additional child widgets here
          ],
        ),
      ),
    );
  }
}

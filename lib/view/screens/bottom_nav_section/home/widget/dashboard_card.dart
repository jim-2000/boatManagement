import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/core/utils/util.dart';
import 'package:flutter_prime/view/components/column_widget/card_column.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/data/controller/home/home_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DashBoardCard extends StatelessWidget {
  String name, description, iconName;
  bool? isSvg;
  Function ontap;
  DashBoardCard({Key? key, required this.ontap, this.isSvg = false, required this.name, required this.description, required this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => ZoomTapAnimation(
        onTap: () => ontap(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: Dimensions.space5),
          padding: const EdgeInsets.symmetric(
            vertical: Dimensions.space15,
            horizontal: Dimensions.space10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
            color: MyColor.getCardBgColor(),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 7),
                blurRadius: 3,
                color: MyColor.borderColor,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: MyColor.iconBG,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  iconName,
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(width: Dimensions.space10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: boldDefault.copyWith(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description,
                      style: lightSmall.copyWith(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

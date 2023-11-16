import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/core/utils/util.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/image/my_image_widget.dart';
import 'package:get/get.dart';

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space10),
      margin: const EdgeInsets.symmetric(vertical: Dimensions.space10),
      decoration: BoxDecoration(
        color: MyColor.getCardBgColor(),
        borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
        boxShadow: MyUtils.getShadow2(blurRadius: 14),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const MyImageWidget(
                imageUrl: "https://www.countryflags.com/wp-content/uploads/united-kingdom-flag-png-large.png",
                height: 20,
                width: 30,
                radius: 0,
              ),
              const SizedBox(
                width: Dimensions.space10,
              ),
              Text(
                "United States",
                style: regularMediumLarge.copyWith(color: MyColor.primaryColor),
              )
            ],
          ),
          const SizedBox(
            height: Dimensions.space20,
          ),
          Row(
            children: [
              const MyImageWidget(
                imageUrl: "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                height: 60,
                width: 60,
                radius: 4,
              ),
              const SizedBox(
                width: Dimensions.space10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Doe",
                    style: heading.copyWith(),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Dimensions.space2),
                        decoration: const BoxDecoration(color: MyColor.primaryColor, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.place,
                          color: MyColor.colorWhite,
                          size: 12,
                        ),
                      ),
                      const SizedBox(
                        width: Dimensions.space5,
                      ),
                      const Text("Turkey"),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: Dimensions.space10,
          ),
          Container(
            decoration: const BoxDecoration(
                // color: MyColor.borderColor,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyStrings.position,
                      style: regularDefault,
                    ),
                    Text(
                      MyStrings.captaion,
                      style: boldDefault,
                    ),
                  ],
                ),
                CustomButton(
                  text: MyStrings.viewProfile,
                  press: () {},
                  textStyle: regularDefault.copyWith(color: MyColor.colorWhite),
                  isElevated: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_prime/core/helper/date_converter.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/core/utils/util.dart';
import 'package:get/get.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.jobDetailsScreen, arguments: "1");
      },
      child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Job Title",
                  style: title.copyWith(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Dimensions.space5),
                Text(
                  DateConverter.estimatedDate(DateTime.now()),
                  style: title.copyWith(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: Dimensions.space10),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              style: regularSmall.copyWith(color: MyColor.bodyTextColor),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: Dimensions.space15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      MyStrings.expenseType.tr,
                      style: boldSmall.copyWith(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: Dimensions.space10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10, vertical: Dimensions.space2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColor.bodyTextColor.withOpacity(0.7),
                      ),
                      child: Text(
                        "Card",
                        style: boldDefault.copyWith(
                          color: MyColor.colorWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space5),
                        decoration: BoxDecoration(color: MyColor.transparentColor, borderRadius: BorderRadius.circular(Dimensions.defaultRadius), border: Border.all(color: MyColor.primaryColor)),
                        child: Text(
                          MyStrings.delete,
                          style: regularDefault.copyWith(color: MyColor.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Dimensions.space10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space5),
                        decoration: BoxDecoration(color: MyColor.colorBlack, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                        child: Text(
                          MyStrings.edit,
                          style: regularDefault.copyWith(color: MyColor.colorWhite),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

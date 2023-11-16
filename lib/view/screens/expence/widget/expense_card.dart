import 'package:flutter/material.dart';
import 'package:flutter_prime/core/helper/date_converter.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/core/utils/util.dart';
import 'package:get/get.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.expenceDetailsScreen, arguments: "1");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space10),
        margin: const EdgeInsets.symmetric(vertical: Dimensions.space10),
        decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.mediumRadius), boxShadow: MyUtils.getShadow2(blurRadius: 11)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expnse Title",
                        style: title.copyWith(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: Dimensions.space5),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                        style: regularSmall.copyWith(color: MyColor.bodyTextColor),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: Dimensions.space7),
                    ],
                  ),
                ),
                const SizedBox(
                  width: Dimensions.space20,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        DateConverter.estimatedDate(DateTime.now()),
                        style: title.copyWith(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: Dimensions.space5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            MyStrings.amount.tr,
                            style: title.copyWith(),
                          ),
                          Text(
                            "250\$",
                            style: boldExtraLarge.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Dimensions.space15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.space7),
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
                      child: Text("Card",
                          style: boldDefault.copyWith(
                            color: MyColor.colorWhite,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.editExpenseScreen, arguments: [
                          "0",
                          {"name": "card"}
                        ]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space2),
                        decoration: BoxDecoration(color: MyColor.colorBlack, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                        child: Text(
                          MyStrings.edit,
                          style: regularDefault.copyWith(color: MyColor.colorWhite),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Dimensions.space5,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("DELETE >>>>>>>>>> ");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space2),
                        decoration: BoxDecoration(color: MyColor.colorRed, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                        child: Text(
                          MyStrings.delete,
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

import 'package:flutter/material.dart';
import 'package:flutter_prime/core/helper/date_converter.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/core/utils/util.dart';
import 'package:flutter_prime/data/controller/expense/expense_controller.dart';
import 'package:flutter_prime/data/repo/expense/expense_repo.dart';
import 'package:flutter_prime/data/services/api_service.dart';
import 'package:flutter_prime/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/buttons/rounded_button.dart';
import 'package:flutter_prime/view/components/image/custom_svg_picture.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/screens/expence/widget/expense_card.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ExpenceScreen extends StatefulWidget {
  const ExpenceScreen({super.key});

  @override
  State<ExpenceScreen> createState() => _ExpenceScreenState();
}

class _ExpenceScreenState extends State<ExpenceScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ExpenseRepo(apiClient: Get.find()));
    Get.put(ExpenseController(repo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.getScreenBgColor(),
      appBar: _appbar(context),
      body: GetBuilder<ExpenseController>(builder: (controller) {
        return SingleChildScrollView(
          padding: Dimensions.screenPaddingHV,
          child: Column(
            children: [
              const SizedBox(height: Dimensions.space50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderText(text: MyStrings.expenceList),
                      Text(
                        MyStrings.manageYourBoat,
                        style: regularDefault.copyWith(),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: MyStrings.addExpense,
                    press: () {
                      Get.toNamed(RouteHelper.addExpenseScreen);
                    },
                    textStyle: semiBoldDefault.copyWith(color: MyColor.colorWhite),
                    isElevated: true,
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.space40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.space30, vertical: Dimensions.space30),
                    decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.mediumRadius), boxShadow: MyUtils.getShadow2(blurRadius: 11)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          MyStrings.cardBalance.tr,
                          style: title.copyWith(),
                        ),
                        Text(
                          "250\$",
                          style: boldExtraLarge.copyWith(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.space30, vertical: Dimensions.space30),
                    decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.mediumRadius), boxShadow: MyUtils.getShadow2(blurRadius: 11)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          MyStrings.cardBalance.tr,
                          style: title.copyWith(),
                        ),
                        Text(
                          "250\$",
                          style: boldExtraLarge.copyWith(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.space20),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  text: MyStrings.addBalance,
                  press: () {
                    Get.toNamed(RouteHelper.addExpenseBalanceScreen);
                  },
                  textStyle: semiBoldDefault.copyWith(color: MyColor.colorWhite),
                  isElevated: true,
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.allExpense.tr,
                    style: boldLarge.copyWith(),
                  ),
                  GestureDetector(
                    onTap: () {
                      CustomBottomSheet(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            children: List.generate(
                              controller.filter.length,
                              (index) => ZoomTapAnimation(
                                onTap: () {
                                  print(controller.filter[index]);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space10),
                                  decoration: BoxDecoration(
                                    border: controller.filter.length - 1 == index
                                        ? null
                                        : const Border(
                                            bottom: BorderSide(color: MyColor.borderColor, width: .5),
                                          ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.filter[index],
                                        style: semiBoldDefault.copyWith(),
                                      ),
                                      const CustomSvgPicture(
                                        image: Myicons.arrowRight,
                                        color: MyColor.colorBlack,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ).customBottomSheet(context);
                    },
                    child: const CustomSvgPicture(
                      image: Myicons.filter,
                      color: MyColor.colorBlack,
                    ),
                  )
                ],
              ),
              const SizedBox(height: Dimensions.space20),
              Column(
                children: List.generate(3, (index) => const ExpenseCard()),
              )
            ],
          ),
        );
      }),
    );
  }

  PreferredSize _appbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(context.width, 200),
      child: ClipPath(
        // clipper: CurveClipper(),
        child: Container(
          height: 200, // Adjust the height of the curve
          width: context.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColor.primaryColor, MyColor.primaryColor],
            ),
          ),
        ),
      ),
    );
  }
}

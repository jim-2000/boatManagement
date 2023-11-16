import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/dashboard_card.dart';
import 'package:get/get.dart';

class YatchDashBoard extends StatelessWidget {
  const YatchDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.getScreenBgColor(),
      appBar: CustomAppBar(title: MyStrings.yatchDashBoard),
      body: SingleChildScrollView(
        padding: Dimensions.screenPaddingHV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimensions.space30),
            const HeaderText(text: MyStrings.yatchDashBoard),
            Text(
              MyStrings.manageYourBoat,
              style: regularDefault.copyWith(),
            ),
            const SizedBox(height: Dimensions.space30),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: DashBoardCard(
                      ontap: () {
                        Get.toNamed(RouteHelper.taskListScreen);
                      },
                      name: MyStrings.task,
                      description: MyStrings.asignTasksToyourCrewinstantly,
                      iconName: Myicons.todo,
                    ),
                  ),
                  Expanded(
                    child: DashBoardCard(
                      ontap: () {
                        Get.toNamed(RouteHelper.expenceScreen);
                      },
                      name: MyStrings.expense,
                      description: MyStrings.trackAndMangeExpence,
                      iconName: Myicons.money,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimensions.space30),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: DashBoardCard(
                      ontap: () {
                        Get.toNamed(RouteHelper.jobScreen);
                      },
                      name: MyStrings.job,
                      description: MyStrings.addAjob,
                      iconName: Myicons.briefcase,
                    ),
                  ),
                  Expanded(
                    child: DashBoardCard(
                      ontap: () {},
                      name: MyStrings.expense,
                      description: MyStrings.trackAndMangeExpence,
                      iconName: Myicons.money,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimensions.space30),
            Row(
              children: [
                Expanded(
                  child: DashBoardCard(
                    ontap: () {},
                    name: MyStrings.task,
                    description: MyStrings.asignTasksToyourCrewinstantly,
                    iconName: Myicons.todo,
                  ),
                ),
                Expanded(
                  child: DashBoardCard(
                    ontap: () {},
                    name: MyStrings.expense,
                    description: MyStrings.trackAndMangeExpence,
                    iconName: Myicons.money,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.space30),
          ],
        ),
      ),
    );
  }
}

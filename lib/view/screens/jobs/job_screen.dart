import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/core/utils/util.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/image/my_image_widget.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/screens/jobs/widget/application_card.dart';
import 'package:flutter_prime/view/screens/jobs/widget/job_card.dart';
import 'package:get/get.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  int selectedIndex = 0;

  List<String> tabList = [MyStrings.jobPosting, MyStrings.applicants];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: MyStrings.job,
        isTitleCenter: true,
      ),
      body: SingleChildScrollView(
        padding: Dimensions.screenPaddingHV,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderText(text: MyStrings.findCrew),
                    Text(
                      MyStrings.findBoatCrew.tr,
                      style: regularDefault.copyWith(),
                    ),
                  ],
                ),
                CustomButton(
                  text: MyStrings.findCrew,
                  press: () {
                    Get.toNamed(RouteHelper.newJobScreen);
                  },
                  textStyle: semiBoldDefault.copyWith(color: MyColor.colorWhite),
                  isElevated: true,
                ),
              ],
            ),
            const SizedBox(height: Dimensions.space40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: Dimensions.space10),
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      tabList.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: Dimensions.space10),
                          decoration: const BoxDecoration(),
                          child: Text(
                            tabList[index],
                            style: regularDefault.copyWith(
                              color: index == selectedIndex ? MyColor.primaryColor : MyColor.bodyTextColor,
                              decoration: index == selectedIndex ? TextDecoration.underline : TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.space20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: MyStrings.all, style: boldDefault.copyWith()),
                      TextSpan(text: " ${MyStrings.jobs}", style: regularDefault.copyWith()),
                    ],
                  ),
                ),
                const SizedBox(height: Dimensions.space20),
                Builder(
                  builder: (_) {
                    if (selectedIndex == 0) {
                      return Column(
                        children: List.generate(10, (index) => const JobCard()),
                      );
                    } else {
                      return Column(
                        children: List.generate(
                          10,
                          (index) => const ApplicationCard(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: Dimensions.space20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

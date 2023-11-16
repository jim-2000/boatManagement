import 'package:flutter/material.dart';
import 'package:flutter_prime/core/helper/date_converter.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/core/utils/util.dart';
import 'package:flutter_prime/data/controller/task/task_controller.dart';
import 'package:flutter_prime/data/repo/task/task_repo.dart';
import 'package:flutter_prime/data/services/api_service.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/buttons/rounded_button.dart';
import 'package:flutter_prime/view/components/column_widget/card_column.dart';
import 'package:flutter_prime/view/components/image/custom_svg_picture.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/screens/task/widget/task_card.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(TaskRepo(apiClient: Get.find()));
    Get.put(TaskController(repo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.getScreenBgColor(),
      appBar: CustomAppBar(
        title: MyStrings.task,
        isTitleCenter: true,
      ),
      body: GetBuilder<TaskController>(builder: (controller) {
        return SingleChildScrollView(
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
                      const HeaderText(text: MyStrings.taskList),
                      Text(
                        MyStrings.manageYourBoat,
                        style: regularDefault.copyWith(),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: MyStrings.addtask,
                    press: () {
                      Get.toNamed(RouteHelper.addTaskScreen);
                    },
                    textStyle: semiBoldDefault.copyWith(color: MyColor.colorWhite),
                    isElevated: true,
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.space30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.alltask.tr,
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
              const SizedBox(height: Dimensions.space30),
              Column(
                children: List.generate(
                  3,
                  (index) => GestureDetector(
                    onTap: () {
                      //changed: if finished go to completed task page
                      //changed: if inpogress || waiting go to task details page
                      if (index == 2) {
                        Get.toNamed(RouteHelper.taskFinisheDetailsScreen);
                      } else {
                        Get.toNamed(
                          RouteHelper.taskDetailsScreen,
                          arguments: index,
                        );
                      }
                    },
                    child: TaskCard(
                      isComplete: index.toString(),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

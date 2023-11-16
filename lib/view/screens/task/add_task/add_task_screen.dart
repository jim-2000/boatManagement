import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/task/task_controller.dart';
import 'package:flutter_prime/data/repo/task/task_repo.dart';
import 'package:flutter_prime/data/services/api_service.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/buttons/rounded_button.dart';
import 'package:flutter_prime/view/components/custom_drop_down_button_with_text_field.dart';
import 'package:flutter_prime/view/components/image/custom_svg_picture.dart';
import 'package:flutter_prime/view/components/text-form-field/custom_drop_down_button_with_text_field2.dart';
import 'package:flutter_prime/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:flutter_prime/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/components/text/label_text.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
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
        title: MyStrings.createNewtask,
        isTitleCenter: true,
      ),
      body: GetBuilder<TaskController>(builder: (controller) {
        return SingleChildScrollView(
          padding: Dimensions.screenPaddingHV,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(text: MyStrings.addtask),
              Text(
                MyStrings.addtaskBoat.tr,
                style: regularDefault.copyWith(),
              ),
              const SizedBox(height: Dimensions.space30),
              CustomTextField(
                labelText: MyStrings.jobName,
                hintText: MyStrings.jobName,
                needOutlineBorder: true,
                onChanged: (v) {},
                controller: controller.taskNameController,
                focusNode: controller.taskNameFocusNode,
                nextFocus: controller.detailsFocusNode,
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                labelText: MyStrings.jobDescription,
                hintText: MyStrings.jobDescription,
                needOutlineBorder: true,
                onChanged: (v) {},
                maxLines: 5,
                radius: Dimensions.defaultRadius,
                controller: controller.descriptionController,
                focusNode: controller.detailsFocusNode,
              ),
              const SizedBox(height: Dimensions.space15),
              const LabelText(text: MyStrings.photo),
              ZoomTapAnimation(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space30),
                  margin: const EdgeInsets.only(top: Dimensions.space5),
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
                    color: MyColor.borderColor.withOpacity(0.3),
                  ),
                  child: Column(
                    children: [
                      CustomSvgPicture(image: Myicons.copy, color: MyColor.colorGrey.withOpacity(0.5)),
                      Text(
                        MyStrings.chooseFile.tr,
                        style: regularSmall.copyWith(color: MyColor.colorGrey.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space15),
              const LabelText(text: MyStrings.taskType),
              const SizedBox(height: Dimensions.space5),
              CustomDropDownWithTextField(
                list: controller.taskType,
                selectedValue: controller.selectedTaskType,
                onChanged: (val) {
                  controller.selectTask(val);
                },
              ),
              const SizedBox(height: Dimensions.space15),
              const LabelText(text: MyStrings.doneBy),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space20),
                width: context.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: List.generate(
                      controller.taskDoneByList.length,
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: controller.taskDoneBy == controller.taskDoneByList[index] ? true : false,
                                onChanged: (p) {
                                  controller.changeDoneBy(controller.taskDoneByList[index]);
                                },
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.defaultRadius))),
                                activeColor: MyColor.primaryColor,
                              ),
                              Text(
                                controller.taskDoneByList[index].toUpperCase(),
                                style: semiBoldDefault.copyWith(
                                  color: controller.taskDoneBy.toLowerCase() == controller.taskDoneByList[index].toLowerCase() ? MyColor.colorBlack : MyColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space30),
              CustomButton(
                text: MyStrings.createtask,
                press: () {},
                textStyle: regularMediumLarge.copyWith(color: MyColor.colorWhite),
              )
            ],
          ),
        );
      }),
    );
  }
}

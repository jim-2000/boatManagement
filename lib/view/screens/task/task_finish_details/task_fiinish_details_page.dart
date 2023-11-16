import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/task/task_controller.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/components/image/my_image_widget.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:get/get.dart';

class TaskFinisheDetailsScreen extends StatefulWidget {
  const TaskFinisheDetailsScreen({super.key});

  @override
  State<TaskFinisheDetailsScreen> createState() => _TaskFinisheDetailsScreenState();
}

class _TaskFinisheDetailsScreenState extends State<TaskFinisheDetailsScreen> {
  @override
  void initState() {
    Get.find<TaskController>().getTaskDetails(Get.arguments.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Dynamic Task Title",
        isTitleCenter: true,
      ),
      body: GetBuilder<TaskController>(builder: (controller) {
        return SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimensions.space20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.screenPaddingH),
                child: HeaderText(text: MyStrings.taskDetails),
              ),
              const SizedBox(height: Dimensions.space20),
              MyImageWidget(
                width: context.width,
                height: context.height / 4,
                imageUrl: "https://images.unsplash.com/photo-1524522173746-f628baad3644?q=80&w=1831&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                radius: 0,
              ),
              const SizedBox(height: Dimensions.space15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.screenPaddingH),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Major Price reduction on 60.4m ROCK.IT",
                      style: heading.copyWith(),
                      maxLines: 2,
                    ),
                    const SizedBox(height: Dimensions.space5),
                    Text(
                      "Customisable, clean looking bottom floating navbar. FloatingNavBar comes with multiple customization options - colors, page indicators, etc. This can be used as an alternative to the default BottomNavigationBar Customisable, clean looking bottom floating navbar. FloatingNavBar comes with multiple customization options  FloatingNavBar comes with multiple customization options - colors, page indicators, etc. This can be used as an alternative to the default BottomNavigationBar Customisable, clean looking bottom floating navbar. FloatingNavBar comes with multiple customization options - colors, page indicators, etc. This can be used as an alternative to the default BottomNavigationBar",
                      style: regularDefault.copyWith(color: MyColor.bodyTextColor),
                    ),
                    const SizedBox(height: Dimensions.space15),
                    Text(
                      MyStrings.taskcompletersNote.tr,
                      style: heading.copyWith(fontWeight: FontWeight.w700),
                      maxLines: 2,
                    ),
                    const CustomDivider(space: Dimensions.space5),
                    Text(
                      "Customisable, clean looking bottom floating navbar. FloatingNavBar comes with multiple customization options - colors, page indicators, etc. This can be used as an alternative to the default BottomNavigationBar Customisable, clean looking bottom floating navbar. FloatingNavBar comes with multiple customization options  FloatingNavBar comes with multiple customization options - colors, page indicators, etc.",
                      style: regularDefault.copyWith(color: MyColor.getTextColor()),
                    ),
                    const SizedBox(height: Dimensions.space15),
                    Text(
                      MyStrings.taskType.tr,
                      style: title.copyWith(),
                      maxLines: 2,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: Dimensions.space10, top: Dimensions.space5),
                      child: Text(
                        "Preventive".tr,
                        style: semiBoldDefault.copyWith(fontStyle: FontStyle.italic, color: MyColor.bodyTextColor),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: Dimensions.space15),
                    Text(
                      MyStrings.doneBy.tr,
                      style: title.copyWith(),
                      maxLines: 2,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: Dimensions.space10),
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
                                Checkbox(
                                  value: controller.taskDoneBy == controller.taskDoneByList[index] ? true : false,
                                  onChanged: (p) {},
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
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimensions.space15),
                    Text(
                      MyStrings.status.tr,
                      style: title.copyWith(),
                      maxLines: 2,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: Dimensions.space10, top: Dimensions.space5),
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.space5, horizontal: Dimensions.space10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.mediumRadius), color: MyColor.greenSuccessColor),
                      width: 100,
                      child: Center(
                        child: Text(
                          MyStrings.finish,
                          style: semiBoldDefault.copyWith(fontStyle: FontStyle.italic, color: MyColor.colorWhite),
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimensions.space30),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

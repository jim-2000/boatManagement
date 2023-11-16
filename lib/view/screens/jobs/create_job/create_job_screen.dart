import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/job/job_controller.dart';
import 'package:flutter_prime/data/repo/job/job_repo.dart';
import 'package:flutter_prime/data/services/api_service.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/custom_drop_down_button_with_text_field.dart';
import 'package:flutter_prime/view/components/image/custom_svg_picture.dart';
import 'package:flutter_prime/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/components/text/label_text.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CreateJobScreen extends StatefulWidget {
  const CreateJobScreen({super.key});

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(JobRepo(apiClient: Get.find()));
    Get.put(JobController(repo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: MyStrings.creatJobPost,
        isTitleCenter: true,
      ),
      body: GetBuilder<JobController>(builder: (controller) {
        return SingleChildScrollView(
          padding: Dimensions.screenPaddingHV,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(text: MyStrings.findCrew),
              Text(
                MyStrings.findCrewSubTitle.tr,
                style: regularDefault.copyWith(),
              ),
              const SizedBox(height: Dimensions.space50),
              CustomTextField(
                labelText: MyStrings.name,
                hintText: MyStrings.taskname,
                needOutlineBorder: true,
                onChanged: (v) {},
                controller: controller.nameController,
                focusNode: controller.nameFocusNode,
                nextFocus: controller.descriptionFocusNode,
                inputAction: TextInputAction.next,
                fillColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                labelText: MyStrings.description,
                hintText: MyStrings.description,
                needOutlineBorder: true,
                onChanged: (v) {},
                maxLines: 5,
                radius: Dimensions.defaultRadius,
                controller: controller.descriptionController,
                focusNode: controller.descriptionFocusNode,
                inputAction: TextInputAction.next,
                fillColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              const LabelText(text: MyStrings.boatType),
              const SizedBox(height: Dimensions.space5),
              CustomDropDownWithTextField(
                list: controller.boatType,
                onChanged: (val) {
                  controller.selectBoatType(val);
                },
                selectedValue: controller.selectedBoatType,
                bgColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              const LabelText(text: MyStrings.position),
              const SizedBox(height: Dimensions.space5),
              CustomDropDownWithTextField(
                list: controller.positions,
                onChanged: (val) {
                  controller.selectPosition(val);
                },
                selectedValue: controller.selectedposition,
                bgColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                labelText: MyStrings.flag,
                hintText: "Turkey",
                needOutlineBorder: true,
                onChanged: (v) {},
                radius: Dimensions.defaultRadius,
                controller: controller.flagController,
                focusNode: controller.flagFocusNode,
                inputAction: TextInputAction.done,
                fillColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                labelText: MyStrings.country,
                hintText: "United Kingdom",
                needOutlineBorder: true,
                onChanged: (v) {},
                radius: Dimensions.defaultRadius,
                controller: controller.countryController,
                focusNode: controller.countryFocusNode,
                nextFocus: controller.flagFocusNode,
                inputAction: TextInputAction.next,
                fillColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              const LabelText(text: MyStrings.jobImage),
              const SizedBox(height: Dimensions.space5),
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
              const SizedBox(height: Dimensions.space30),
              CustomButton(
                text: MyStrings.findCrew,
                textStyle: boldLarge.copyWith(color: MyColor.colorWhite),
                press: () {
                  Get.back();
                },
              )
            ],
          ),
        );
      }),
    );
  }
}

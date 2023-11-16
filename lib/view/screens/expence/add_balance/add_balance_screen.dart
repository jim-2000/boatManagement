import 'package:flutter/material.dart';
import 'package:flutter_prime/core/helper/date_converter.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/expense/expense_controller.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/components/text/label_text.dart';
import 'package:get/get.dart';

class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ExpenseController>().expenseCurrencyController.text = "";
      Get.find<ExpenseController>().expenseAmountController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ExpenseController>(builder: (controller) {
        return SingleChildScrollView(
          padding: Dimensions.screenPaddingHV,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimensions.space50),
              const HeaderText(text: MyStrings.addBalance),
              Text(
                MyStrings.trackyourBalance.tr,
                style: regularDefault.copyWith(),
              ),
              const SizedBox(height: Dimensions.space50),
              CustomTextField(
                labelText: MyStrings.currency,
                hintText: "Dollar",
                needOutlineBorder: true,
                onChanged: (v) {},
                radius: Dimensions.defaultRadius,
                controller: controller.expenseCurrencyController,
                focusNode: controller.expenseCurrencyFocusNode,
                nextFocus: controller.expenseAmountFocusNode,
                inputAction: TextInputAction.next,
                fillColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                labelText: MyStrings.amount,
                hintText: "25",
                needOutlineBorder: true,
                onChanged: (v) {},
                radius: Dimensions.defaultRadius,
                controller: controller.expenseAmountController,
                focusNode: controller.expenseAmountFocusNode,
                inputAction: TextInputAction.done,
                fillColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              const LabelText(text: MyStrings.expenseType),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: 0),
                width: context.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: List.generate(
                      controller.balanceType.length,
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: controller.selectedBalanceType == controller.balanceType[index] ? true : false,
                            onChanged: (p) {
                              controller.selectBalanceType(controller.expenseType[index]);
                            },
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.defaultRadius))),
                            activeColor: MyColor.primaryColor,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          Text(
                            controller.balanceType[index].toUpperCase(),
                            style: semiBoldDefault.copyWith(
                              color: controller.selectedBalanceType.toLowerCase() == controller.balanceType[index].toLowerCase() ? MyColor.colorBlack : MyColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space40),
              CustomButton(
                text: MyStrings.addBalance,
                textStyle: boldLarge.copyWith(color: MyColor.colorWhite),
                press: () {},
              )
            ],
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_prime/core/helper/date_converter.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/expense/expense_controller.dart';
import 'package:flutter_prime/view/components/buttons/custom_button.dart';
import 'package:flutter_prime/view/components/checkbox/custom_check_box.dart';
import 'package:flutter_prime/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/components/text/label_text.dart';
import 'package:get/get.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ExpenseController>().expenseCurrencyController.text = "";
    Get.find<ExpenseController>().expenseAmountController.text = "";
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
              const HeaderText(text: MyStrings.addExpense),
              Text(
                MyStrings.addyournewExpence.tr,
                style: regularDefault.copyWith(),
              ),
              const SizedBox(height: Dimensions.space50),
              CustomTextField(
                labelText: MyStrings.name,
                hintText: MyStrings.taskname,
                needOutlineBorder: true,
                onChanged: (v) {},
                controller: controller.expenseNameController,
                focusNode: controller.expenseNameFocusNode,
                nextFocus: controller.expenseDescriptionFocusNode,
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
                controller: controller.expenseDescriptionController,
                focusNode: controller.expenseDescriptionFocusNode,
                nextFocus: controller.expenseCurrencyFocusNode,
                inputAction: TextInputAction.next,
                fillColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
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
                      controller.expenseType.length,
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: controller.selectedExpenseType == controller.expenseType[index] ? true : false,
                            onChanged: (p) {
                              controller.selectExpenseType(controller.expenseType[index]);
                            },
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.defaultRadius))),
                            activeColor: MyColor.primaryColor,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          Text(
                            controller.expenseType[index].toUpperCase(),
                            style: semiBoldDefault.copyWith(
                              color: controller.selectedExpenseType.toLowerCase() == controller.expenseType[index].toLowerCase() ? MyColor.colorBlack : MyColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space15),
              const LabelText(text: MyStrings.expenseDate),
              const SizedBox(height: Dimensions.space5),
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2022),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    controller.selectExpenseDateTime(picked);
                  }
                },
                child: Container(
                  width: context.width,
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(color: MyColor.inputFill, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                  child: Text(
                    DateConverter.estimatedDateOnly(controller.expenseDateTime),
                    style: regularDefault.copyWith(color: MyColor.colorGrey),
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                labelText: MyStrings.spender,
                hintText: MyStrings.name,
                needOutlineBorder: true,
                onChanged: (v) {},
                radius: Dimensions.defaultRadius,
                controller: controller.expenseSpenderController,
                focusNode: controller.expenseSpenderFocusNode,
                inputAction: TextInputAction.done,
                fillColor: MyColor.inputFill,
              ),
              const SizedBox(height: Dimensions.space15),
              const SizedBox(height: Dimensions.space40),
              CustomButton(
                text: MyStrings.addExpense,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/helper/string_format_helper.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/controller/home/home_controller.dart';
import 'package:flutter_prime/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:flutter_prime/view/components/column_widget/card_column.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/components/text/bottom_sheet_header_text.dart';

class LatestTransactionBottomSheet extends StatelessWidget {
  final int index;
  const LatestTransactionBottomSheet({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomSheetHeaderText(text: MyStrings.details),
              BottomSheetCloseButton()
            ],
          ),
          const CustomDivider(space: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.transactionId,
                body:   "",
              ),
              CardColumn(
                alignmentEnd: true,
                header: MyStrings.wallet,
                body:  "",
              )
            ],
          ),
          const SizedBox(height: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.beforeCharge,
                body: "",
              ),
              CardColumn(
                alignmentEnd: true,
                header: MyStrings.charge,
                body: ""
              )
            ],
          ),
          const SizedBox(height: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.remainingBalance,
                body: "",
              ),
            ],
          )
        ],
      ),
    );
  }
}

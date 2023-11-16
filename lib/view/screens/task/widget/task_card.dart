import 'package:flutter/material.dart';
import 'package:flutter_prime/core/helper/date_converter.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/core/utils/util.dart';
import 'package:flutter_prime/view/components/column_widget/card_column.dart';

class TaskCard extends StatelessWidget {
  final String isComplete;
  const TaskCard({super.key, this.isComplete = "0"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space10),
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.space5, vertical: Dimensions.space10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
        color: MyColor.getCardBgColor(),
        boxShadow: MyUtils.getShadow2(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardColumn(
            header: MyStrings.taskName,
            headerTextDecoration: boldDefault.copyWith(),
            space: Dimensions.space2,
            body: "Complete Placement",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(vertical: Dimensions.space2, horizontal: Dimensions.space5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  border: Border.all(
                    color: isComplete == "0"
                        ? MyColor.colorGrey
                        : isComplete == "2"
                            ? MyColor.greenSuccessColor
                            : MyColor.pendingColor,
                    width: .5,
                  ),
                ),
                child: Text(
                  isComplete == "0"
                      ? MyStrings.waiting
                      : isComplete == "2"
                          ? MyStrings.finish
                          : MyStrings.inProgress,
                  style: boldSmall.copyWith(
                    color: isComplete == "0"
                        ? MyColor.colorGrey
                        : isComplete == "2"
                            ? MyColor.greenSuccessColor
                            : MyColor.pendingColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.space5,
              ),
              Text(
                DateConverter.estimatedDate(DateTime.now()),
                style: regularDefault.copyWith(fontStyle: FontStyle.italic, color: MyColor.getTextColor(), fontSize: Dimensions.fontSmall),
              )
            ],
          ),
        ],
      ),
    );
  }
}

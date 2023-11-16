import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/image/my_image_widget.dart';
import 'package:get/get.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.getScreenBgColor(),
      appBar: CustomAppBar(
        title: "Dynamic job Title ",
        isTitleCenter: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyImageWidget(
              width: context.width,
              height: context.height / 4,
              imageUrl: "https://images.unsplash.com/photo-1524522173746-f628baad3644?q=80&w=1831&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              radius: 0,
            ),
            const SizedBox(height: Dimensions.space15),
            Text(
              "Major Price reduction on 60.4m ROCK.IT",
              style: heading.copyWith(),
              maxLines: 2,
            ),
            const SizedBox(height: Dimensions.space5),
          ],
        ),
      ),
    );
  }
}

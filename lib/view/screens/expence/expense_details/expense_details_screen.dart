import 'package:flutter/material.dart';
import 'package:flutter_prime/core/helper/date_converter.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/view/components/column_widget/card_column.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class ExpenseDetailsScreen extends StatelessWidget {
  const ExpenseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      backgroundColor: MyColor.getScreenBgColor(),
      body: SingleChildScrollView(
        padding: Dimensions.screenPaddingHV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimensions.space50 * 10),
            const HeaderText(text: MyStrings.expenseDetails),
            const SizedBox(height: Dimensions.space40),
            Text(
              "Expense Name",
              style: boldExtraLarge.copyWith(),
            ),
            const SizedBox(height: Dimensions.space20),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              style: regularDefault.copyWith(color: MyColor.bodyTextColor),
            ),
            const SizedBox(height: Dimensions.space20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardColumn(
                    header: MyStrings.amount,
                    body: "250\$",
                    headerTextDecoration: title,
                    bodyTextDecoration: boldLarge.copyWith(fontSize: 25),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        MyStrings.expenseType.tr,
                        style: title.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: Dimensions.space10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10, vertical: Dimensions.space2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColor.bodyTextColor.withOpacity(0.7),
                        ),
                        child: Text("Card",
                            style: boldDefault.copyWith(
                              color: MyColor.colorWhite,
                            )),
                      ),
                    ],
                  ),
                  CardColumn(
                    header: MyStrings.spender,
                    body: "John Doe",
                    headerTextDecoration: title,
                    bodyTextDecoration: boldLarge.copyWith(fontSize: 26),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimensions.space10),
            Text(
              "${MyStrings.date}:${DateConverter.estimatedDate(DateTime.now())}",
              style: regularDefault,
            ),
            const SizedBox(height: Dimensions.space50 * 10),
          ],
        ),
      ),
    );
  }

  PreferredSize _appbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(context.width, 200),
      child: ClipPath(
        clipper: CurveClipper(),
        child: Container(
          height: 200, // Adjust the height of the curve
          width: context.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColor.primaryColor, MyColor.primaryColor],
            ),
          ),
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    var firstControlPoint = Offset(size.width / 2, size.height + 70);
    var firstEndPoint = Offset(size.width / 4, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 2, size.height);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 0);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Define the curve using Bezier curves
    path.moveTo(0, 0);
    path.cubicTo(size.width / 4, size.height / 2, size.width / 2, 0, size.width * 3 / 4, size.height / 2);
    path.cubicTo(size.width, size.height / 2, size.width - size.width / 4, 0, size.width, 0);

    return path;
  }

  bool shouldRepaint(CustomClipper<Path> oldDelegate) => true;
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double amplitude;
  final double frequency;
  final double phase;

  WaveClipper({
    this.amplitude = 20.0,
    this.frequency = 0.2,
    this.phase = 0.0,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    for (double x = 0.0; x < size.width; x += 1.0) {
      final y = size.height / 2.0 + amplitude * math.sin(2.0 * math.pi * frequency * x + phase);
      path.lineTo(x, y);
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

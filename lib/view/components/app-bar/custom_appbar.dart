import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_prime/core/route/route.dart';

import 'package:flutter_prime/core/utils/my_color.dart';

import 'package:flutter_prime/core/utils/style.dart';

import 'package:flutter_prime/data/services/api_service.dart';

import 'package:flutter_prime/view/components/app-bar/action_button_icon_widget.dart';

import 'package:flutter_prime/view/components/dialog/exit_dialog.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String title;

  final bool isShowBackBtn;

  final VoidCallback? backButtonOnPress;

  final Color bgColor;

  final bool isTitleCenter;

  final bool fromAuth;

  final bool isProfileCompleted;

  final dynamic actionIcon;

  final List<Widget>? action;

  final VoidCallback? actionPress;

  final bool isActionIconAlignEnd;

  final String actionText;

  final bool isActionImage;

  TextStyle? titleStyle;

  Color? iconColor;

  final bool isForceBackHome;

  double? elevation;

  double? height;


  CustomAppBar({

    Key? key,

    this.isProfileCompleted = false,

    this.fromAuth = false,

    this.isTitleCenter = false,

    this.bgColor = MyColor.colorWhite,

    this.isShowBackBtn = true,

    required this.title,

    this.actionText = '',

    this.actionIcon,

    this.backButtonOnPress,

    this.actionPress,

    this.isActionIconAlignEnd = false,

    this.isActionImage = true,

    this.action,

    this.titleStyle,

    this.isForceBackHome = false,

    this.iconColor = MyColor.colorBlack,

    this.elevation = 0.0,

    this.height = 100,

  }) : super(key: key);


  @override

  State<CustomAppBar> createState() => _CustomAppBarState();


  @override

  Size get preferredSize => const Size(double.maxFinite, 50);

}


class _CustomAppBarState extends State<CustomAppBar> {

  bool hasNotification = false;

  @override

  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));

    super.initState();

  }


  @override

  Widget build(BuildContext context) {

    return widget.isShowBackBtn

        ? PreferredSize(

            preferredSize: Size(MediaQuery.of(context).size.width, widget.height!),

            child: Container(

              // padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),

              decoration: BoxDecoration(

                color: MyColor.colorWhite,

                boxShadow: [

                  BoxShadow(

                    color: Colors.grey.shade200,

                    offset: const Offset(0, 2.0),

                    blurRadius: 4.0,

                  )

                ],

              ),

              child: AppBar(

                elevation: widget.elevation,

                scrolledUnderElevation: 0,

                shadowColor: MyColor.transparentColor,

                titleSpacing: 0,

                leading: widget.isShowBackBtn

                    ? IconButton(

                        onPressed: () {

                          if (widget.backButtonOnPress == null) {

                            if (widget.fromAuth) {

                              Get.offAllNamed(RouteHelper.loginScreen);

                            } else {

                              String previousRoute = Get.previousRoute;

                              if (previousRoute == RouteHelper.loginScreen || widget.isForceBackHome == true) {

                                Get.offAndToNamed(RouteHelper.loginScreen);

                              } else {

                                Get.back();

                              }

                            }

                          } else {

                            widget.backButtonOnPress!();

                          }

                        },

                        icon: Icon(Icons.arrow_back_ios_new_outlined, color: widget.iconColor, size: 20),

                      )

                    : const SizedBox.shrink(),

                backgroundColor: widget.bgColor,

                title: Text(

                  widget.title.tr,

                  style: widget.titleStyle ?? heading.copyWith(color: MyColor.getTextColor()),

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                ),

                centerTitle: widget.isTitleCenter,

                actions: widget.action,

              ),

            ),

          )

        : PreferredSize(

            preferredSize: Size(MediaQuery.of(context).size.width, widget.height!),

            child: Container(

              decoration: BoxDecoration(

                color: MyColor.colorWhite,

                boxShadow: [

                  BoxShadow(

                    color: Colors.grey.shade200,

                    offset: const Offset(0, 2.0),

                    blurRadius: 4.0,

                  )

                ],

              ),

              child: AppBar(

                titleSpacing: 0,

                shadowColor: MyColor.appBarColor,

                elevation: widget.elevation,

                backgroundColor: widget.bgColor,

                centerTitle: widget.isTitleCenter,

                scrolledUnderElevation: 0,

                title: Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 8.0),

                  child: Text(

                    widget.title.tr,

                    style: widget.titleStyle ??

                        heading.copyWith(

                          color: MyColor.getTextColor(),

                        ),

                  ),

                ),

                actions: widget.action,

                automaticallyImplyLeading: false,

              ),

            ),

          );

  }

}


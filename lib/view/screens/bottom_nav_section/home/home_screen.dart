import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/my_icons.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/data/controller/home/home_controller.dart';
import 'package:flutter_prime/data/repo/home/home_repo.dart';
import 'package:flutter_prime/data/services/api_service.dart';
import 'package:flutter_prime/view/components/custom_loader/custom_loader.dart';
import 'package:flutter_prime/view/components/will_pop_widget.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/dashboard_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(HomeRepo(apiClient: Get.find()));
    Get.put(HomeController(homeRepo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => WillPopWidget(
        nextRoute: "",
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.initialData(shouldLoad: false);
            },
            child: Scaffold(
              backgroundColor: MyColor.getScreenBgColor(),
              body: controller.isLoading
                  ? const CustomLoader()
                  : SingleChildScrollView(
                      padding: Dimensions.screenPaddingHV,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // TopSection(),
                          SizedBox(height: context.height * 0.3),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DashBoardCard(
                                    name: MyStrings.yatch,
                                    description: MyStrings.quickaccesstoYatchManagement,
                                    iconName: Myicons.ship,
                                    ontap: () {
                                      Get.toNamed(RouteHelper.yatchDashboard);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: DashBoardCard(
                                    name: MyStrings.jobList,
                                    description: MyStrings.crewCareerCenter,
                                    iconName: Myicons.boat,
                                    ontap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Dimensions.space20),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DashBoardCard(
                                    name: MyStrings.weather,
                                    description: MyStrings.checkWeatherNow,
                                    iconName: Myicons.shipRun,
                                    ontap: () {},
                                  ),
                                ),
                                Expanded(
                                  child: DashBoardCard(
                                    name: MyStrings.suppliers,
                                    description: MyStrings.suppliersCollaborationHub,
                                    iconName: Myicons.anchor,
                                    ontap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

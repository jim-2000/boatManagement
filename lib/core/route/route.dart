import 'package:flutter_prime/view/components/bottom-nav-bar/bottom_nav_bar.dart';


import 'package:flutter_prime/view/screens/Profile/profile_screen.dart';


import 'package:flutter_prime/view/screens/account/change-password/change_password_screen.dart';


import 'package:flutter_prime/view/screens/auth/email_verification_page/email_verification_screen.dart';


import 'package:flutter_prime/view/screens/auth/forget_password/forget_password/forget_password.dart';


import 'package:flutter_prime/view/screens/auth/forget_password/reset_password/reset_password_screen.dart';


import 'package:flutter_prime/view/screens/auth/forget_password/verify_forget_password/verify_forget_password_screen.dart';


import 'package:flutter_prime/view/screens/auth/kyc/kyc.dart';


import 'package:flutter_prime/view/screens/auth/login/login_screen.dart';


import 'package:flutter_prime/view/screens/auth/profile_complete/profile_complete_screen.dart';


import 'package:flutter_prime/view/screens/auth/registration/registration_screen.dart';


import 'package:flutter_prime/view/screens/auth/sms_verification_page/sms_verification_screen.dart';


import 'package:flutter_prime/view/screens/auth/two_factor_screen/two_factor_verification_screen.dart';


import 'package:flutter_prime/view/screens/edit_profile/edit_profile_screen.dart';


import 'package:flutter_prime/view/screens/expence/add_balance/add_balance_screen.dart';


import 'package:flutter_prime/view/screens/expence/add_expense/add_expense_screen.dart';


import 'package:flutter_prime/view/screens/expence/edti_expense/edit_expense_screen.dart';


import 'package:flutter_prime/view/screens/expence/expence_screen.dart';


import 'package:flutter_prime/view/screens/expence/expense_details/expense_details_screen.dart';


import 'package:flutter_prime/view/screens/jobs/create_job/create_job_screen.dart';


import 'package:flutter_prime/view/screens/jobs/job_details/job_details_screen.dart';


import 'package:flutter_prime/view/screens/jobs/job_screen.dart';


import 'package:flutter_prime/view/screens/privacy_policy/privacy_policy_screen.dart';


import 'package:flutter_prime/view/screens/splash/splash_screen.dart';


import 'package:flutter_prime/view/screens/task/add_task/add_task_screen.dart';


import 'package:flutter_prime/view/screens/task/complete_task/complete_task_screen.dart';


import 'package:flutter_prime/view/screens/task/task_details/task_details_screen.dart';


import 'package:flutter_prime/view/screens/task/task_finish_details/task_fiinish_details_page.dart';


import 'package:flutter_prime/view/screens/task/task_list_screen.dart';


import 'package:flutter_prime/view/screens/transaction/transactions_screen.dart';


import 'package:flutter_prime/view/screens/yatch/yatch_dashboard_screen.dart';


import 'package:get/get.dart';


import '../../view/screens/deposits/deposit_webview/my_webview_screen.dart';


import '../../view/screens/deposits/deposits_screen.dart';


import '../../view/screens/deposits/new_deposit/new_deposit_screen.dart';


import '../../view/screens/withdraw/add_withdraw_screen/add_withdraw_method_screen.dart';


import '../../view/screens/withdraw/confirm_withdraw_screen/withdraw_confirm_screen.dart';


import '../../view/screens/withdraw/withdraw_history/withdraw_screen.dart';


class RouteHelper {

  static const String splashScreen = "/splash_screen";


  static const String onboardScreen = "/onboard_screen";


  static const String loginScreen = "/login_screen";


  static const String forgotPasswordScreen = "/forgot_password_screen";


  static const String changePasswordScreen = "/change_password_screen";


  static const String registrationScreen = "/registration_screen";


  static const String bottomNavBar = "/bottom_nav_bar";


  static const String myWalletScreen = "/my_wallet_screen";


  static const String addMoneyHistoryScreen = "/add_money_history_screen";


  static const String profileCompleteScreen = "/profile_complete_screen";


  static const String emailVerificationScreen = "/verify_email_screen";


  static const String smsVerificationScreen = "/verify_sms_screen";


  static const String verifyPassCodeScreen = "/verify_pass_code_screen";


  static const String twoFactorScreen = "/two-factor-screen";


  static const String resetPasswordScreen = "/reset_pass_screen";


  static const String transactionHistoryScreen = "/transaction_history_screen";


  static const String notificationScreen = "/notification_screen";


  static const String profileScreen = "/profile_screen";


  static const String editProfileScreen = "/edit_profile_screen";


  static const String kycScreen = "/kyc_screen";


  static const String privacyScreen = "/privacy-screen";


  static const String withdrawScreen = "/withdraw-screen";


  static const String addWithdrawMethodScreen = "/withdraw-method";


  static const String withdrawConfirmScreenScreen = "/withdraw-preview-screen";


  static const String depositsScreen = "/deposits";


  static const String depositsDetailsScreen = "/deposits_details";


  static const String newDepositScreenScreen = "/deposits_money";


  static const String depositWebViewScreen = '/deposit_webView';


  static const String yatchDashboard = '/yatch_dashboard_screen';


  static const String taskListScreen = '/task_list_screen';


  static const String addTaskScreen = '/add_task_screen';


  static const String completeTaskScreen = '/complete_task_screen';


  static const String taskDetailsScreen = '/task_details_screen';


  static const String taskFinisheDetailsScreen = '/task_finish_details_screen';


  static const String expenceScreen = '/expence_screen';


  static const String expenceDetailsScreen = '/expence_details_screen';


  static const String addExpenseScreen = '/add_expence_screen';


  static const String addExpenseBalanceScreen = '/add_expence_balance_screen';


  static const String editExpenseScreen = '/edit_expence_screen';


  static const String editExpenseBalanceScreen = '/edit_expence_balance_screen';


  static const String jobScreen = '/job_screen';


  static const String newJobScreen = '/new_job_screen';


  static const String jobDetailsScreen = '/job_details_screen';


  // static const String jobDetailsScreen = '/job_details_screen';


  List<GetPage> routes = [

    GetPage(name: splashScreen, page: () => const SplashScreen()),


    GetPage(name: loginScreen, page: () => const LoginScreen()),


    GetPage(name: forgotPasswordScreen, page: () => const ForgetPasswordScreen()),


    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),


    GetPage(name: registrationScreen, page: () => const RegistrationScreen()),


    GetPage(name: profileCompleteScreen, page: () => const ProfileCompleteScreen()),


    GetPage(name: bottomNavBar, page: () => const BottomNavBar()),


    GetPage(name: withdrawScreen, page: () => const WithdrawScreen()),


    GetPage(name: addWithdrawMethodScreen, page: () => const AddWithdrawMethod()),


    GetPage(name: withdrawConfirmScreenScreen, page: () => const WithdrawConfirmScreen()),


    GetPage(name: profileScreen, page: () => const ProfileScreen()),


    GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),


    GetPage(name: transactionHistoryScreen, page: () => const TransactionsScreen()),


    GetPage(name: kycScreen, page: () => const KycScreen()),


    GetPage(name: depositWebViewScreen, page: () => MyWebViewScreen(redirectUrl: Get.arguments)),


    GetPage(name: depositsScreen, page: () => const DepositsScreen()),


    GetPage(name: newDepositScreenScreen, page: () => const NewDepositScreen()),


    GetPage(

        name: emailVerificationScreen,

        page: () => EmailVerificationScreen(

              needSmsVerification: Get.arguments[0],

              isProfileCompleteEnabled: Get.arguments[1],

              needTwoFactor: Get.arguments[2],

            )),


    GetPage(name: smsVerificationScreen, page: () => const SmsVerificationScreen()),


    GetPage(name: verifyPassCodeScreen, page: () => const VerifyForgetPassScreen()),


    GetPage(name: resetPasswordScreen, page: () => const ResetPasswordScreen()),


    GetPage(name: twoFactorScreen, page: () => TwoFactorVerificationScreen(isProfileCompleteEnable: Get.arguments)),


    GetPage(name: kycScreen, page: () => const KycScreen()),


    GetPage(name: privacyScreen, page: () => const PrivacyPolicyScreen()),


    //


    GetPage(name: yatchDashboard, page: () => const YatchDashBoard()),


    GetPage(name: taskListScreen, page: () => const TaskListScreen()),


    GetPage(name: addTaskScreen, page: () => const AddTaskScreen()),


    GetPage(name: completeTaskScreen, page: () => const CompleteTaskScreen()),


    GetPage(name: taskDetailsScreen, page: () => const TaskDetailsScreen()),


    GetPage(name: taskFinisheDetailsScreen, page: () => const TaskFinisheDetailsScreen()),


    GetPage(name: expenceScreen, page: () => const ExpenceScreen()),


    GetPage(name: expenceDetailsScreen, page: () => const ExpenseDetailsScreen()),


    GetPage(name: addExpenseScreen, page: () => const AddExpenseScreen()),


    GetPage(name: addExpenseBalanceScreen, page: () => const AddBalanceScreen()),


    GetPage(name: editExpenseScreen, page: () => const EditExpenseScreen()),


    GetPage(name: jobScreen, page: () => const JobScreen()),


    GetPage(name: jobDetailsScreen, page: () => const JobDetailsScreen()),


    GetPage(name: newJobScreen, page: () => const CreateJobScreen()),

  ];

}


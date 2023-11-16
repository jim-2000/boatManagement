import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/repo/expense/expense_repo.dart';
import 'package:flutter_prime/data/services/api_service.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  ExpenseRepo repo;
  ExpenseController({required this.repo});

  TextEditingController expenseNameController = TextEditingController();
  TextEditingController expenseDescriptionController = TextEditingController();
  TextEditingController expenseCurrencyController = TextEditingController();
  TextEditingController expenseAmountController = TextEditingController();
  TextEditingController expenseSpenderController = TextEditingController();

  FocusNode expenseNameFocusNode = FocusNode();
  FocusNode expenseDescriptionFocusNode = FocusNode();
  FocusNode expenseCurrencyFocusNode = FocusNode();
  FocusNode expenseSpenderFocusNode = FocusNode();
  FocusNode expenseAmountFocusNode = FocusNode();

  DateTime expenseDateTime = DateTime.now();

  selectExpenseDateTime(DateTime date) {
    expenseDateTime = date;
    update();
  }

  String selectedExpenseType = "";
  selectExpenseType(String value) {
    selectedExpenseType = value;
    update();
  }

  List<String> expenseType = [
    MyStrings.card,
    MyStrings.cash,
  ];

  String selectedBalanceType = "";
  selectBalanceType(String value) {
    selectedBalanceType = value;
    update();
  }

  List<String> balanceType = [
    MyStrings.card,
    MyStrings.cash,
  ];

  List<String> filter = [
    MyStrings.inProgress,
    MyStrings.finish,
    MyStrings.waiting,
  ];
  //
}

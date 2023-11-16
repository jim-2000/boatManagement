import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/repo/task/task_repo.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  TaskRepo repo;
  TaskController({required this.repo});
  TextEditingController taskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  FocusNode taskNameFocusNode = FocusNode();
  FocusNode detailsFocusNode = FocusNode();
  //

  void getTask() {}
  void getTaskDetails(String id) {
    print(id);
  }

  List<String> filter = [
    MyStrings.inProgress,
    MyStrings.finish,
    MyStrings.waiting,
  ];

  String selectedTaskType = MyStrings.selectOne;
  selectTask(String task) {
    selectedTaskType = task;
    update();
  }

  List<String> taskType = [
    MyStrings.selectOne,
    "Preventive",
    "Break",
    "Vault",
    "Installation",
    "other",
  ];
  String taskDoneBy = MyStrings.crew;
  changeDoneBy(String val) {
    taskDoneBy = val;
    update();
  }

  List<String> taskDoneByList = [
    MyStrings.crew,
    MyStrings.technician,
  ];

  String selectedStatus = MyStrings.selectOne;
  selectStatus(String status) {
    selectedStatus = status;
    update();
  }

  List<String> statusList = [
    MyStrings.finish,
    MyStrings.inProgress,
    MyStrings.waiting,
  ];
}

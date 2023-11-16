import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/repo/job/job_repo.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  JobRepo repo;
  JobController({required this.repo});

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController flagController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode flagFocusNode = FocusNode();

  String selectedBoatType = MyStrings.selectOne;
  selectBoatType(String val) {
    selectedBoatType = val;
    update();
  }

  List<String> boatType = [
    MyStrings.selectOne,
    "Motor Boat",
    "Mini Boat",
    "Ship ",
  ];
  String selectedposition = MyStrings.selectOne;
  selectPosition(String val) {
    selectedposition = val;
    update();
  }

  List<String> positions = [
    MyStrings.selectOne,
    "Captaion",
    "Mate",
    "First Mate",
  ];
}

// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductController extends GetxController {
  @override
  void onInit() {
    nameC;
    descC;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameC.dispose();
    descC.dispose();
  }

  TextEditingController nameC = TextEditingController();
  TextEditingController descC = TextEditingController();
}

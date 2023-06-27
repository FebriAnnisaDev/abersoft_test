// ignore_for_file: unnecessary_overrides

import 'package:abersoft_flutter/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/widget/loading.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    initHome();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Map productMap = {};

  initHome() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      loadingProgress();
      productMap = await ProductService.getProduct();

      Get.back();
      update();
    });
  }
}

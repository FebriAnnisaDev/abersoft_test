import 'package:abersoft_flutter/module/home/view/home_view.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

successDialog() {
  AwesomeDialog(
    context: Get.context!,
    keyboardAware: true,
    headerAnimationLoop: false,
    dismissOnBackKeyPress: false,
    dialogType: DialogType.success,
    animType: AnimType.bottomSlide,
    btnOkText: "Ok",
    title: 'Product has been created.',
    btnOkOnPress: () {
      Get.offAll(() => const HomeView(), duration: Duration.zero);
    },
  ).show();
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

warningSigninDialog() {
  AwesomeDialog(
    context: Get.context!,
    keyboardAware: true,
    headerAnimationLoop: false,
    dismissOnBackKeyPress: false,
    dialogType: DialogType.warning,
    animType: AnimType.bottomSlide,
    btnOkText: "Ok",
    title: 'Please check your email or password again.',
    btnOkOnPress: () {},
  ).show();
}

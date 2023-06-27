import 'package:abersoft_flutter/utility/widget/loading.dart';
import 'package:abersoft_flutter/utility/widget/warning_signin_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/auth_service.dart';
import '../../../utility/theme/constant.dart';
import '../../home/view/home_view.dart';
import '../../../service/app_session.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    LoginController controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 70),
            Image.asset(
              'asset/icon/app_icon.png',
            ),
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              controller: controller.userC,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(defaultRadiusCircular))),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Username',
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: primaryColor,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(defaultRadiusCircular))),
              ),
            ),
            const SizedBox(height: 20),
            GetBuilder<LoginController>(
              builder: (_) {
                return TextFormField(
                  controller: controller.passwordC,
                  obscureText: controller.isActive == true ? false : true,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultRadiusCircular))),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: primaryColor,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        controller.isActive = !controller.isActive;
                        controller.update();
                      },
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: controller.isActive ? primaryColor : Colors.grey,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultRadiusCircular))),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                loadingProgress();
                await AuthService.login(
                    username: controller.userC.text,
                    password: controller.passwordC.text);
                if (AppSession.token != null) {
                  Get.back();
                  Get.offAll(() => const HomeView(), duration: Duration.zero);
                } else {
                  Get.back();
                  warningSigninDialog();
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(defaultRadiusCircular),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

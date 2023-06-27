import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'app_session.dart';

class AuthService {
  static login({required String username, required String password}) async {
    try {
      var response = await Dio().post(
        "https://2e3d13cc-3d6d-4911-b94c-ba23cf332933.mock.pstmn.io/api/v1/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "username": username,
          "password": password,
        },
      );
      Map obj = response.data;
      AppSession.token = obj['token'];
      if (kDebugMode) {
        print(obj);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

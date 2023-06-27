import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'app_session.dart';

class ProductService {
  static getProduct() async {
    try {
      var response = await Dio().get(
        "https://2e3d13cc-3d6d-4911-b94c-ba23cf332933.mock.pstmn.io/api/v1/products",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": AppSession.token,
          },
        ),
      );
      Map obj = response.data;
      if (kDebugMode) {
        print(obj);
      }
      return obj;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static createProduct({
    required String productName,
    required String productImage,
    required String productDescription,
  }) async {
    try {
      var response = await Dio().post(
        "https://2e3d13cc-3d6d-4911-b94c-ba23cf332933.mock.pstmn.io/api/v1/products",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": AppSession.token,
          },
        ),
        data: {
          "productName": productName,
          "productImage": productImage,
          "productDecription": productDescription,
        },
      );
      Map obj = response.data;
      if (kDebugMode) {
        print(obj);
      }
      return obj;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

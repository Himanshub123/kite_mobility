import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kite_mobility/models/sign_in_param.dart';
import 'package:kite_mobility/repository/sign_in_repository.dart';

class SignInViewModel extends GetxController {
  final _api = SignInRepository();
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  signIn() {
    print('viewModel ${email.value.text}');
    var requestData = SignInParam(
            email.value.text.toString(),
            password.value.text.toString(),
            "1",
            "cDvsRgViTRG_WJnRAGFwIW:APA91bESB_xDEEyuXDys6qfuJepwJUcVU4newi7Qp2Vz3vYqkvylym6fgGalBHvRKVf18ibuFimwTLkg99L_LGYyWyM0jfuxwV-7ULZ_1pIUBvSiTVYHKDoyuTlkA1VOXRDO6xiNg1Wi",
            "1")
        .toJson();
    _api.signInApi(jsonEncode(requestData)).then((value) {
      if (value['code'] == 200) {
        Get.delete<SignInViewModel>();
        print(value);
      } else {
        Fluttertoast.showToast(
            msg: value['message'], toastLength: Toast.LENGTH_LONG);
      }
      print(value);
    });
  }
}

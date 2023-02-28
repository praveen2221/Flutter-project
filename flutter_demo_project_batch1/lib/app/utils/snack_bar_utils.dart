import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SnackbarUtils {
  static final _singleton = SnackbarUtils();
  static SnackbarUtils get instance => _singleton;

  successSnackbar(String msg) {
    normalSnackBar(msg, color: Colors.blue);
  }

  failureSnackbar(String msg) {
    normalSnackBar(msg, color:Colors.blue);
  }

  normalSnackBar(String msg, {Color? color}) {
    Get.showSnackbar(
      GetSnackBar(
        message: msg,
        backgroundColor: color ?? const Color(0xFF303030),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

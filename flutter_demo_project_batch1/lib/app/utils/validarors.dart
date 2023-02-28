import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class ValidatorsPage {
  static String? emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Field cannot be empty';
    } else if (!GetUtils.isEmail(text)) {
      return 'Not a valid email';
    }
    return null;
  }

  static String? officialEmailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Field cannot be empty';
    } else if (!GetUtils.isEmail(text) || !text.endsWith('@companyname.in')) {
      return 'Not an official email';
    }
    return null;
  }

  static String? cnfPasswordValidator(
      String? text, TextEditingController controller) {
    if (text == null || text.isEmpty) {
      return 'Field cannot be empty';
    } else if (controller.text.isEmpty || controller.text != text) {
      return 'Password not equal';
    }
    return null;
  }

  static String? passwordValidator(String? text) {
    final validCharacters =
        RegExp(r'^(?=.*[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (text == null || text.isEmpty) {
      return 'Field cannot be empty';
    } else if (text.length < 8) {
      return 'Maximum Password length is 8';
    } else if (!validCharacters.hasMatch(text)) {
      return 'Atleast one alphabet, number and special characters are needed.';
    }
    return null;
  }

  static String? notEmptyValidator(String? text) {
    if (text == null || text.isEmpty) return 'Field cannot be empty';
    return null;
  }
}

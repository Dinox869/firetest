import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ui {
  static GetBar SuccessSnackBar(
      {String title = 'Success', required String message}) {
    Get.log("[$title] $message");
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              ?.merge(const TextStyle(color: Colors.white))),
      messageText: Text(message,
          style: Get.textTheme.caption
              ?.merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon:
          const Icon(Icons.check_circle_outline, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static GetBar ErrorSnackBar(
      {String title = 'Note', required String message}) {
    Get.log("[$title] $message", isError: true);
    return GetBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              ?.merge(const TextStyle(color: Colors.white))),
      messageText: Text(message,
          style: Get.textTheme.caption
              ?.merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red,
      icon: Icon(Icons.remove_circle_outline,
          size: 32, color: Get.theme.primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static InputDecoration getInputDecoration(
      {String hintText = '',
      TextStyle? styles,
      String? errorText,
      IconData? iconData,
      Widget? suffixIcon,
      Widget? suffix}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: styles ?? Get.textTheme.caption,
      prefixIcon: iconData != null
          ? Icon(iconData, color: Get.theme.focusColor).marginOnly(right: 14)
          : const SizedBox(),
      prefixIconConstraints: iconData != null
          ? const BoxConstraints.expand(width: 38, height: 38)
          : const BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(0),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }
}

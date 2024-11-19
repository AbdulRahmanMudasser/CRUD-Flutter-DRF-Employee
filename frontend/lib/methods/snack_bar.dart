import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String error) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(error),
      behavior: SnackBarBehavior.floating,
      width: Get.width / 2,
    ),
    snackBarAnimationStyle: AnimationStyle(
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
    ),
  );
}
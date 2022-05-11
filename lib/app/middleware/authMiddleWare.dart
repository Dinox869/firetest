import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  final Home = false.obs;

  @override
  RouteSettings? redirect(String? route) {
    Get.find<AuthService>().init();
    final authService = Get.find<AuthService>().isAuth;
    if (!authService) {
      return const RouteSettings(name: Routes.LOGIN);
    } else {
      if (Home.isFalse) {
        Home.value = true;
        return const RouteSettings(name: Routes.HOME);
      }
    }
  }
}

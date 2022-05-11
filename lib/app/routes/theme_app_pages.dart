import 'package:firetest/app/modules/auth/login/binding/login_binding.dart';
import 'package:firetest/app/modules/auth/login/view/login_view.dart';
import 'package:firetest/app/modules/home/binding/home_binding.dart';
import 'package:firetest/app/modules/home/view/home_view.dart';
import 'package:firetest/app/routes/routes.dart';
import 'package:get/get.dart';

import '../middleware/authMiddleWare.dart';

class ThemeAppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
  ];
}

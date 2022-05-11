import 'package:firebase_core/firebase_core.dart';
import 'package:firetest/app/routes/theme_app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/services/auth_service.dart';

initServices() async {
  Get.log('starting services ...');
  Get.lazyPut(() => AuthService());
  await Firebase.initializeApp();
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(
    GetMaterialApp(
      title: 'FIRETEST',
      initialRoute: ThemeAppPages.INITIAL,
      getPages: ThemeAppPages.routes,
    ),
  );
}

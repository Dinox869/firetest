import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firetest/app/routes/theme_app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/services/auth_service.dart';

initServices() async {
  Get.log('starting services ...');
  Get.lazyPut(() => AuthService());
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD0cHoSiToV4-GeUc2jeu2N8ErwPuLyHeU",
        appId: "1:854515287302:android:eb0fcc2dc0c69f73bc4a87",
        messagingSenderId: "854515287302",
        projectId: "firetest-78d3a",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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

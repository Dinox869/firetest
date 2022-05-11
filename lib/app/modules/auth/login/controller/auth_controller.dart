import 'package:firebase_auth/firebase_auth.dart';
import 'package:firetest/app/providers/firebase_provider.dart';
import 'package:firetest/app/routes/routes.dart';
import 'package:firetest/app/services/auth_service.dart';
import 'package:get/get.dart';

import '../../../../../common/ui.dart';

class AuthController extends GetxController {
  final loading = false.obs;

  Future<void> signup() async {
      loading.value = true;
      await FireBaseProvider().signInAnonymously();
      await Get.find<AuthService>().signedUp();
      loading.value = false;
      await Get.offAndToNamed(Routes.HOME);
  }
}

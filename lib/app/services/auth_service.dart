import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final GetStorage _box = GetStorage();
  final authenticated = false.obs;

  Future<AuthService> init() async {
    await getCurrentUser();
    return this;
  }

  Future getCurrentUser() async {
    bool loginData = await _box.hasData('login');
    if (loginData) {
      authenticated.value = await _box.read('login');
    } else {
      authenticated.value = false;
    }
  }

  Future signedUp() async {
    await _box.write('login', true);
    authenticated.value = true;
  }

  bool get isAuth => authenticated.value;
}

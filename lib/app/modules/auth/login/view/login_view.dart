import 'package:firetest/app/modules/global_widgets/block_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'FIRETEST',
          style: Get.textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
              child: Text(
            'WELCOME to firetest.',
            style: Get.textTheme.headline5,
          )),
          Center(
            child: Obx(
              () => FractionallySizedBox(
                widthFactor: 0.5,
                child: BlockButtonWidget(
                  color: Colors.blue,
                  text: Text('Login'),
                  onPressed: () {
                    Get.lazyPut(() => AuthController());
                    controller.signup();
                  },
                  loading: controller.loading.value,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

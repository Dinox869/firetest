import 'package:firetest/app/modules/global_widgets/block_button.dart';
import 'package:firetest/app/modules/home/widgets/custom_listile.dart';
import 'package:firetest/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FIRETEST',
          style: Get.textTheme.headline6,
        ),
        actions: [
          GestureDetector(
            onTap: () => controller.logout(),
            child: const Icon(Icons.logout, color: Colors.black,))
        ],
        centerTitle: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.controller1,
                      onSaved: (input) {
                        controller.weight.value = input!;
                      },
                      onChanged: (input) {
                        controller.weight.value = input;
                      },
                      style: Get.textTheme.button,
                      textAlign: TextAlign.start,
                      decoration: Ui.getInputDecoration(
                          hintText: 'Enter your new weight here.',
                          styles: Get.textTheme.button),
                    ),
                  ),
                  BlockButtonWidget(
                    color: Colors.grey,
                    text: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => controller.saveData(),
                    loading: controller.loading.value,
                  ),
                ],
              ),
            ),
            Obx(() => controller.error.isTrue
                ? const Text(
                    'Weight value is required.',
                    style: TextStyle(color: Colors.red),
                  ).paddingSymmetric(horizontal: 30)
                : const SizedBox()),
            const SizedBox(height: 10),
            const Divider(thickness: 0.2, color: Colors.grey),
            const SizedBox(height: 30),
            Obx(
              () => controller.initLoading.isFalse
                  ? controller.weightList.isNotEmpty
                      ? ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                            thickness: 0.2,
                            color: Colors.grey,
                            endIndent: 40,
                            indent: 20,
                          ),
                          reverse: true,
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.weightList.length,
                          itemBuilder: ((_, index) {
                            return CustomeListTile(
                                index: index,
                                weight: controller.weightList[index].weight!,
                                time: controller.weightList[index].time!,
                                id: controller.weightList[index].id!,
                                );
                          }),
                        )
                      : const Text('No records found')
                          .paddingSymmetric(horizontal: 30, vertical: 20)
                  : const CircularProgressIndicator(
                      backgroundColor: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

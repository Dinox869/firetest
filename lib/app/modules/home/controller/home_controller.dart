import 'package:firetest/app/model/weight_model.dart';
import 'package:firetest/app/providers/firebase_provider.dart';
import 'package:firetest/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final List<Weight> weightList = [];
  final initLoading = false.obs;
  final updateLoad = false.obs;
  final loading = false.obs;
  final switcher = true.obs;
  final error = false.obs;
  final weight = ''.obs;
  final index = 99.obs;

  @override
  void onInit() async {
    fetchData();
  }

  void fetchData() async {
    initLoading.value = true;
    weightList.assignAll(await FireBaseProvider().fetchAll());
    initLoading.value = false;
  }

  void saveData() async {
    if (weight.value.isEmpty) {
      error.value = true;
    } else {
      error.value = false;
      loading.value = true;
      Weight weightData =
          Weight(weight: weight.value, time: DateTime.now().toString());
      int saveNumber = 0;
      if (weightList.length > 0) {
        await FireBaseProvider()
            .push(weightData, (int.parse(weightList.last.id.toString()) + 1));
      } else {
        await FireBaseProvider().push(weightData, 1);
      }

      weight.value = '';
      controller1.text = '';
      loading.value = false;
      fetchData();
    }
  }

  void updateData(String index) async {
    updateLoad.value = true;
    await FireBaseProvider().update(
        Weight(weight: weight.value, time: DateTime.now().toString()),
        (int.parse(index)));
    weight.value = '';
    controller2.text = '';
    fetchData();
    updateLoad.value = false;
  }

  void delete(String index) async {
    await FireBaseProvider().delete(int.parse(index));
    fetchData();
  }

  String timeParse(String time) {
    DateTime dateTime = DateTime.parse(time);
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}';
  }

  void animate(int tileNumber) {
    index.value = tileNumber;
    switcher.value = !switcher.value;
  }

  String indexNumber(int index) {
    return (weightList.length - index).toString();
  }

  void logout() async {
    try {
      await FireBaseProvider().signOut();
      Get.offAndToNamed(Routes.LOGIN);
    } catch (e) {}
  }
}

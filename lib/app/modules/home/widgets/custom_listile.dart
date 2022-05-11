import 'package:firetest/app/modules/global_widgets/block_button.dart';
import 'package:firetest/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:firetest/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class CustomeListTile extends GetView<HomeController> {
  final int index;
  final String weight;
  final String time;
  final String ?id;

  const CustomeListTile(
      {Key? key, required this.index, required this.time, required this.weight, this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        dense: true,
        minLeadingWidth: 0,
        leading: Text(controller.indexNumber(index)),
        subtitle: Text(
          controller.timeParse(time),
          style: Get.textTheme.caption,
        ),
        title: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _renderWidget(context, index)),
        trailing: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _renderWidgetTrailing(index)),
      ).paddingSymmetric(horizontal: 10),
    );
  }

  Widget _renderWidgetTrailing(int index) {
    return controller.switcher.isTrue && controller.index.value == index
        ? SizedBox(
            width: 140,
            child: Row(
              children: [
                BlockButtonWidget(
                  color: Colors.grey,
                  text: const Text('Update', style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    controller.updateData(id!);
                    controller.animate(index);
                  },
                  loading: controller.updateLoad.value,
                ),
                GestureDetector(
                  onTap: () => controller.animate(index),
                  child: const Icon(Icons.cancel),
                ).paddingOnly(left: 20)
              ],
            ),
          )
        : SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => controller.animate(index),
                  child: const Icon(Icons.edit),
                ),
                GestureDetector(
                  onTap: () => id != null ? controller.delete(id!) : {},
                  child: Icon(
                    Icons.delete,
                    color: Colors.red[700],
                  ),
                )
              ],
            ),
          );
  }

  Widget _renderWidget(BuildContext context, int index) {
    return controller.switcher.isTrue && controller.index.value == index
        ? SizedBox(
            width: MediaQuery.of(context).size.width / 2.3,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: controller.controller2,
              onSaved: (input) {
                        controller.weight.value = input!;
                      },
                      onChanged: (input) {
                        controller.weight.value = input;
                      },
              style: Get.textTheme.button,
              textAlign: TextAlign.start,
              decoration: Ui.getInputDecoration(
                  hintText: 'Enter weight.', styles: Get.textTheme.button),
            ),
          )
        : Text('$weight kg');
  }
}

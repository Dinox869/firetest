import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'spinkit_fading_circle.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget(
      {Key? key,
      this.loading = false,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final Widget text;
  final bool loading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: this.onPressed != null
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: this.color.withOpacity(0.3),
                    blurRadius: 40,
                    offset: Offset(0, 15)),
                BoxShadow(
                    color: this.color.withOpacity(0.2),
                    blurRadius: 13,
                    offset: Offset(0, 3))
              ],
              // borderRadius: BorderRadius.all(Radius.circular(20)),
            )
          : null,
      child: MaterialButton(
        onPressed: this.onPressed,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        color: this.color,
        disabledElevation: 0,
        disabledColor: Get.theme.focusColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: loading == false
            ? this.text
            : Container(
                height: MediaQuery.of(context).size.height / 45,
                padding: EdgeInsets.only(top: 5),
                child: const SpinKitFadingCircle(
                  color: Colors.white,
                  size: 15,
                )),
        elevation: 0,
      ),
    );
  }
}

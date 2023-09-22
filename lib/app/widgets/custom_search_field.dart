import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  final textEditingController = TextEditingController();
  final isTextFieldEmpty = true.obs;

  @override
  void onInit() {
    textEditingController.addListener(_checkIfTextFieldEmpty);
    super.onInit();
  }

  void _checkIfTextFieldEmpty() {
    isTextFieldEmpty.value = textEditingController.text.isEmpty;
  }

  void clearTextField() {
    textEditingController.clear();
    // isTextFieldEmpty.value = true;
  }

  @override
  void onClose() {
    textEditingController.removeListener(_checkIfTextFieldEmpty);
    textEditingController.dispose();
    super.onClose();
  }
}

class CustomSearchField extends StatelessWidget {
  final TextController textController = Get.put(TextController());

  final Color? color;
  final double? height;
  final double? width;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Function(String)? onChange;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;

  CustomSearchField(
      {this.prefixIcon,
      this.suffixIcon,
      Key? key,
      this.hintText,
      this.color,
      this.height,
      this.width,
      this.onChange,
      this.onTap,
      this.padding,
      this.margin,
      this.borderRadius,
      this.focusNode
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30,
      // width: width?? 200,
      child: TextFormField(
        controller: textController.textEditingController,
        minLines: 1,
        onTap: onTap,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15),
          filled: true,
          fillColor: Color(0x192B447C),
          suffixIcon: Obx(() {
            if (textController.isTextFieldEmpty.value) {
              log("Empty");
              return Icon(null);
            } else {
              return IconButton(
                  onPressed: textController.clearTextField,
                  icon: SvgPicture.asset("assets/icons/close_svg.svg"));
            }
          }),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

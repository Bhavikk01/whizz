import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSearchField extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Function(String)? onChange;
  final Function()? onTap;
  final Function() onClose;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;

  const CustomSearchField(
      {this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      Key? key,
      this.hintText,
      this.color,
      this.height,
      this.width,
      this.onChange,
      this.onTap,
      required this.onClose,
      this.padding,
      this.margin,
      this.borderRadius,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30,
      //width: width,
      child: TextFormField(
        controller: controller,
        minLines: 1,
        onTap: onTap,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 15,color: Color(0x4C2B447C)),
          filled: true,
          fillColor: const Color(0x192B447C),
          suffixIcon: IconButton(
            onPressed: () {
              onClose();
              controller.text = '';
            },
            icon: SvgPicture.asset(
              "assets/icons/close_svg.svg",
            ),
          ),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

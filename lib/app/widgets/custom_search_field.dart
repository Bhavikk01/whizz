import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Function(String)? onChange;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const CustomSearchField({
    this.prefixIcon,
    this.suffixIcon,
    Key? key,
    this.hintText,
    this.color,
    this.height,
    this.width,
    this.onChange,
    this.padding,
    this.margin,
    this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 30,
      width: width?? 200,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}

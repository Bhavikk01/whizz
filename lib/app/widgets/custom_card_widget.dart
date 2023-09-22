import 'dart:developer';

import 'package:flutter/material.dart';

import '../utils/scale_utility.dart';

class CustomCardWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Function()? onTap;
  final Widget? child;
  const CustomCardWidget({this.child,
    Key? key,
    this.color,
    this.height,
    this.width,
    this.onTap,
    this.padding,
    this.margin,
    this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return GestureDetector(
      onTap: () {
        if(onTap != null){
          onTap!();
        }else{
          log('No OnTap');
        }
      },
      child: Container(
        height: height,
        width: width,
        padding: padding ?? scale.getPadding(top: 10),
        margin: margin ?? scale.getMargin(all: 4),
        decoration: BoxDecoration(
          color: color ?? Colors.black,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(-4, 0),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: child?? Container(),
      ),
    );
  }
}

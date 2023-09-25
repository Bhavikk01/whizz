import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/scale_utility.dart';

class CustomIconButton extends StatelessWidget {
  final Color? color;
  final Color? iconColor;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Function()? onTap;
  final String? image;

  const CustomIconButton(
      {this.image,
      Key? key,
      this.color,
      this.iconColor,
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
        if (onTap != null) {
          onTap!();
        } else {
          log('No OnTap');
        }
      },
      child: Container(
        height: height ?? scale.getScaledHeight(40),
        width: width ?? scale.getScaledWidth(40),
        padding: padding ?? scale.getPadding(all: 9),
        margin: margin ?? scale.getMargin(all: 4),
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: borderRadius ?? BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     blurRadius: 3,
            //     offset: const Offset(-2, 0),
            //   ),
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     blurRadius: 3,
            //     offset: const Offset(0, 2),
            //   ),
            // ],
            border: Border.all(
              color: Colors.transparent,
            )
        ),
        child: SvgPicture.asset(
          image ?? '',
          height: height != null ? height! - 5 : scale.getScaledHeight(35),
          width: width != null ? width! - 5 : scale.getScaledWidth(35),
          fit: BoxFit.cover,
          color: iconColor,
        ),
        /*      Image.asset(
          image ?? '',
          height: height != null? height!-5 : scale.getScaledHeight(35),
          width: width != null? width!-5 : scale.getScaledWidth(35),
          fit: BoxFit.cover,
        ),*/
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import '../utils/scale_utility.dart';
class UploadButton extends StatelessWidget {
  final Function()? onTap;
  const UploadButton({Key? key,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            padding:
            const EdgeInsets.only(left: 35, right: 45, top: 7, bottom: 7),
            decoration: ShapeDecoration(
                shape: StadiumBorder(), color: ColorsUtil.brandColor),
            child: Text(
              "Upload",
              style: TextStyle(color: ColorsUtil.brandWhite),
            ),
          ),
          Positioned(
              right: -2,
              child: SvgPicture.asset(
                "assets/icons/upload_svg.svg",
                height: scale.getScaledHeight(30),
              ))
        ],
      ),
    );
  }
}

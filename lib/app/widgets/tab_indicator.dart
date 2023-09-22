import 'package:flutter/material.dart';
import 'package:Whizz/app/utils/colors.dart';

class TabIndicator extends BoxDecoration {
  final BoxPainter _painter;

  TabIndicator() : _painter = TabIndicatorPainter();

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class TabIndicatorPainter extends BoxPainter {
  final Paint _paint;

  TabIndicatorPainter()
      : _paint = Paint()
    ..color = ColorsUtil.darkContainerColor
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(offset.dx + 16, kToolbarHeight - 10,
            offset.dx + configuration.size!.width - 14, kToolbarHeight - 13),
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(5.0),
      ),
      _paint,
    );
  }
}
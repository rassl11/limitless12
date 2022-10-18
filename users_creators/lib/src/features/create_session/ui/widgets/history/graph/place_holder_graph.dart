import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class GraphCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1208956, size.height * 0.6500000);
    path_0.lineTo(0, size.height * 0.8333353);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.9044764, size.height * 0.03333353);
    path_0.lineTo(size.width * 0.7805964, size.height * 0.2000000);
    path_0.lineTo(size.width * 0.6358218, size.height * 0.2633335);
    path_0.lineTo(size.width * 0.4626873, size.height * 0.4733335);
    path_0.lineTo(size.width * 0.2880596, size.height * 0.5933353);
    path_0.lineTo(size.width * 0.1208956, size.height * 0.6500000);
    path_0.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
      paintFill.shader = ui.Gradient.linear(Offset(size.width * 0.5000000, 0),
        Offset(size.width * 0.5000000, size.height), [
      Color(0xffAFB3C1).withOpacity(0.15),
      Color(0xffF1F2FF).withOpacity(0.72)
    ], );
    canvas.drawPath(path_0, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

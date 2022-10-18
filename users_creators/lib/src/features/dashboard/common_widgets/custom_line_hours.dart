import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color =  ColorsLimitless.brandColor.withOpacity(0.24)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.9937500, size.height);
    path0.lineTo(size.width * 0.9955333, size.height * 0.0799714);
    path0.lineTo(size.width * 0.9900000, size.height * 0.9628571);
    path0.lineTo(size.width * 0.2683333, size.height * 0.9562143);
    path0.lineTo(size.width * 0.0335750, size.height * 0.9538571);
    path0.lineTo(size.width * 0.1399250, size.height * 0.9181714);
    path0.lineTo(size.width * 0.3, size.height * 0.9);
    path0.quadraticBezierTo(size.width * 0.3513604, size.height * 0.2963179,
        size.width * 0.3795917, size.height * 0.1146143);
    path0.cubicTo(size.width * 0.9880750, size.height * 0.04, size.width,
        size.height * 0.07, size.width * 0.9937500, size.height * 0.0682143);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

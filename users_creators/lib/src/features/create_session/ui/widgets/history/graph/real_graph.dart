import 'dart:ui' as ui;
import 'package:flutter/material.dart';


class RealGraphHistory extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(size.width*0.003610108,size.height*0.9914530);
    path_0.cubicTo(size.width*0.003610108,size.height*0.9914530,size.width*0.03490437,size.height*0.8216530,size.width*0.08844765,size.height*0.7621085);
    path_0.cubicTo(size.width*0.1503989,size.height*0.6932137,size.width*0.1814357,size.height*0.7129632,size.width*0.2490975,size.height*0.7129632);
    path_0.cubicTo(size.width*0.3176895,size.height*0.7129632,size.width*0.4319567,size.height*0.7396274,size.width*0.5018051,size.height*0.6801991);
    path_0.cubicTo(size.width*0.6028881,size.height*0.5941949,size.width*0.5982094,size.height*0.5836932,size.width*0.6606498,size.height*0.4713316);
    path_0.cubicTo(size.width*0.7129964,size.height*0.3771368,size.width*0.808664,size.height*0.01311966,size.width*0.963899,size.height*0.001);

Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007220217;
paint_0_stroke.color=Color(0xffE94359).withOpacity(1.0);
paint_0_stroke.strokeCap = StrokeCap.round;
canvas.drawPath(path_0,paint_0_stroke);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}
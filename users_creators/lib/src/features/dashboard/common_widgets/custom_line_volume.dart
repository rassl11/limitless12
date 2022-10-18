import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';



//Copy this CustomPainter code to the Bottom of the File
class CustomPaintVolume extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(0,size.height*0.9995231);
    path_0.lineTo(0,size.height*0.9726000);
    path_0.lineTo(size.width*0.07824427,size.height*0.8187538);
    path_0.lineTo(size.width*0.2423664,size.height*0.7341385);
    path_0.lineTo(size.width*0.4274809,size.height*0.3956769);
    path_0.lineTo(size.width*0.6259542,size.height*0.2033692);
    path_0.lineTo(size.width*0.8148855,size.height*0.06106146);
    path_0.lineTo(size.width,size.height*0.003369138);
    path_0.lineTo(size.width,size.height*0.9995231);
    path_0.lineTo(0,size.height*0.9995231);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = ColorsLimitless.brandColor.withOpacity(0.24);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}
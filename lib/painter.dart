// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LinePaintPage extends StatelessWidget {
 // LinePaintPage(LinePainter linePainter);
  double d = 0;

  double c = 0;
   LinePaintPage({
     LinePainter? linePainter,
    required this.d,
    required this.c,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            width: 300,
            height: 300,
            child: CustomPaint(
              foregroundPainter: LinePainter(c: null, d: null ),
            ),
          ),
        ),
      );
}

class LinePainter extends CustomPainter {
  var d;
  
  var c;

 
  LinePainter({
    required this.d,
    required this.c,
  });
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    double a = size.width * 1 / 2;

    double b = size.height * 1 / 3;

    
    final paint = Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    canvas.drawLine(
      Offset(a, b),
      Offset(c, d),
      paint,
    );
    a = c;
    b = d;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

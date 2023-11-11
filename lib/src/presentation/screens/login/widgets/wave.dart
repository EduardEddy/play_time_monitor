import 'package:flutter/material.dart';

class Wave extends StatelessWidget {
  const Wave({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _WavePainter(),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;
    final path = Path();
    paint.strokeWidth = 5.0;

    path.moveTo(0, 0);
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(
      size.width * .25,
      size.height * .30,
      size.width * .5,
      size.height * .25,
    );
    path.quadraticBezierTo(
      size.width * .75,
      size.height * .20,
      size.width,
      size.height * .25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

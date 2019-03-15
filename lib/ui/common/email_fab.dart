import 'package:flutter/material.dart';

class EmailFAB extends StatelessWidget {
  const EmailFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark ? null : Colors.white,
      // child: ShaderMask(
      //   shaderCallback: (Rect bounds) {
      //     return RadialGradient(
      //       center: Alignment.center,
      //       radius: 1.0,
      //       colors: <Color>[
      //         Colors.yellowAccent,
      //         Colors.blueAccent,
      //         Colors.redAccent,
      //         Colors.greenAccent,
      //       ],
      //       tileMode: TileMode.mirror,
      //     ).createShader(bounds);
      //   },
      //   child: Icon(Icons.add, size: 40.0),
      // ),
      child: CustomPaint(
        child: Container(),
        foregroundPainter: FloatingPainter(),
      ),
      onPressed: () {},
    );
  }
}

class FloatingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint amberPaint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 5;

    Paint greenPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5;

    Paint bluePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    Paint redPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;

    canvas.drawLine(Offset(size.width * 0.27, size.height * 0.5),
        Offset(size.width * 0.5, size.height * 0.5), amberPaint);
    canvas.drawLine(
        Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width * 0.5, size.height - (size.height * 0.27)),
        greenPaint);
    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width - (size.width * 0.27), size.height * 0.5), bluePaint);
    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width * 0.5, size.height * 0.27), redPaint);
  }

  @override
  bool shouldRepaint(FloatingPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(FloatingPainter oldDelegate) => false;
}

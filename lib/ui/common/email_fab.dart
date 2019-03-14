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
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: <Color>[
              Colors.yellowAccent,
              Colors.blueAccent,
              Colors.redAccent,
              Colors.greenAccent,
            ],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: Icon(Icons.add, size: 40.0),
      ),
      onPressed: () {},
    );
  }
}

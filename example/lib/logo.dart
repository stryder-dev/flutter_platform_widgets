import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterPlatformWidgetsLogo extends StatelessWidget {
  final double size;
  const FlutterPlatformWidgetsLogo({
    Key? key,
    this.size = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      OutlinedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'F',
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(
          'P',
          style: TextStyle(
            fontSize: size,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      CupertinoButton.filled(
        padding: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'W',
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () {},
      ),
    ]);
  }
}

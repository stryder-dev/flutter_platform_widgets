import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget withMaterial(bool condition) {
    if (condition) {
      return Material(
        type: MaterialType.transparency,
        child: this,
      );
    }
    return this;
  }
}

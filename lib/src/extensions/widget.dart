import 'package:flutter/material.dart' show Widget, Material, MaterialType;

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

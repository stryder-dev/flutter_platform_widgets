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

extension IterableExt<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final item in this) {
      if (test(item)) {
        return item;
      }
    }
    return null;
  }
}

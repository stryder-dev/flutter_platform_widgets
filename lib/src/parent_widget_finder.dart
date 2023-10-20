import 'package:flutter/widgets.dart';

// Only in this file
extension WidgetExt on Widget {
  Widget withWidgetFinder<T>() {
    return ParentWidgetFinder<T>(child: this);
  }
}

/// Simple inherited widget that matches the class of a given type
class ParentWidgetFinder<T> extends InheritedWidget {
  ParentWidgetFinder({
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(ParentWidgetFinder<T> oldWidget) {
    return true;
  }

  static ParentWidgetFinder<T>? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ParentWidgetFinder<T>>();
  }
}

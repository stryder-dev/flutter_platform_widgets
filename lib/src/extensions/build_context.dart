import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

extension BuildContextExtensions on BuildContext {
  bool get isMaterialDesign => isMaterial(this);
  bool get isCupertinoDesign => isCupertino(this);
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A Provider that provides access to the functions of swicthing platforms.
///
/// When placed at the root, it will rebuild the application with the new platform
/// and therefore when [PlatformWidgets] are used within the application
/// will render based on those widgets
///
/// Usage:
/// ```dart
/// return PlatformProvider(
///    builder: (BuildContext context) MaterialApp(...)
/// );
/// ```
///
/// Gain access through the InheritedWidget:
/// ```dart
/// PlatformProvider.of(context).changeToMaterialPlatform();
///
/// or
///
/// PlatformProvider.of(context).changeToCupertinoPlatform();
/// ```
class PlatformProvider extends StatefulWidget {
  const PlatformProvider({
    @required this.builder,
  }) : assert(builder != null);

  final WidgetBuilder builder;

  static PlatformProviderState of(BuildContext context) {
    return context
        .ancestorStateOfType(const TypeMatcher<PlatformProviderState>());
  }

  @override
  PlatformProviderState createState() => PlatformProviderState();
}

class PlatformProviderState extends State<PlatformProvider> {
  TargetPlatform platform;

  void changeToMaterialPlatform() {
    setState(() {
      platform = TargetPlatform.android;
    });
  }

  void changeToCupertinoPlatform() {
    setState(() {
      platform = TargetPlatform.iOS;
    });
  }

  void changeToAutoDetectPlatform() {
    setState(() {
      platform = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (platform == null) return widget.builder(context);

    return Theme(
        data: Theme.of(context).copyWith(platform: platform),
        child: widget.builder(context));
  }
}

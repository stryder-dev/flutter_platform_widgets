import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

extension WidgetExt on Widget {
  Widget maxWidth(double maxWidth) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: this,
    );
  }

  Widget get center => Center(child: this);
}

extension DisplayPlatformTarget on TargetPlatform {
  String get text => this == TargetPlatform.iOS ? 'Cupertino' : 'Material';
}

extension PlatformTargetExt on WidgetBuilder {
  Widget asMaterial() {
    return asPlatform(TargetPlatform.android);
  }

  Widget asCupertino() {
    return asPlatform(TargetPlatform.iOS);
  }

  Widget asPlatform(TargetPlatform platform) {
    return Builder(
      builder: (context) {
        final p = PlatformProvider.of(context)!;

        return PlatformProvider(
          settings: p.settings,
          initialPlatform: platform,
          builder: (context) => this(context),
        );
      },
    );
  }
}

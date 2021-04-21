import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      builder: (ctx) {
        final data = Theme.of(ctx).copyWith(platform: platform);
        print('$platform');
        return Theme(
          data: data,
          child: Builder(
            builder: (context) => this(context),
          ),
        );
      },
    );
  }
}

/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

const double _kDefaultIndicatorRadius = 10.0;

class MaterialProgressIndicatorData {
  MaterialProgressIndicatorData({
    this.key,
    this.backgroundColor,
    this.strokeWidth,
    this.value,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
  });
  final Key key;
  final Color backgroundColor;
  final double strokeWidth;
  final double value;
  final Animation<Color> valueColor;
  final String semanticsLabel;
  final String semanticsValue;
}

class CupertinoProgressIndicatorData {
  CupertinoProgressIndicatorData({
    this.key,
    this.animating,
    this.radius: _kDefaultIndicatorRadius,
  });

  final Key key;
  final bool animating;
  final double radius;
}

class PlatformCircularProgressIndicator extends PlatformWidgetBase<
    CupertinoActivityIndicator, CircularProgressIndicator> {
  final Key widgetKey;

  final PlatformBuilder<MaterialProgressIndicatorData> android;
  final PlatformBuilder<CupertinoProgressIndicatorData> ios;

  PlatformCircularProgressIndicator({
    Key key,
    this.widgetKey,
    this.android,
    this.ios,
  }) : super(key: key);

  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) {
    MaterialProgressIndicatorData data;
    if (android != null) {
      data = android(context);
    }

    return CircularProgressIndicator(
      key: data?.key ?? widgetKey,
      backgroundColor: data?.backgroundColor,
      strokeWidth: data?.strokeWidth ?? 4.0,
      value: data?.value,
      valueColor: data?.valueColor,
      semanticsLabel: data?.semanticsLabel,
      semanticsValue: data?.semanticsValue,
    );
  }

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    CupertinoProgressIndicatorData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoActivityIndicator(
      key: data?.key ?? widgetKey,
      animating: data?.animating ?? true,
      radius: data?.radius ?? _kDefaultIndicatorRadius,
    );
  }
}

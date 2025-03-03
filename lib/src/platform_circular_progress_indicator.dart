/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const double _kDefaultIndicatorRadius = 10.0;

abstract class _BaseData {
  _BaseData({
    this.key,
    this.color,
  });

  final Key? key;
  final Color? color;
}

class MaterialProgressIndicatorData extends _BaseData {
  MaterialProgressIndicatorData({
    super.key,
    super.color,
    this.backgroundColor,
    this.strokeWidth,
    this.value,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeAlign,
    this.strokeCap,
    this.constraints,
    this.padding,
    this.trackGap,
  });

  final Color? backgroundColor;
  final double? strokeWidth;
  final double? value;
  final Animation<Color>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double? strokeAlign;
  final StrokeCap? strokeCap;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final double? trackGap;
}

class CupertinoProgressIndicatorData extends _BaseData {
  CupertinoProgressIndicatorData({
    super.key,
    super.color,
    this.animating,
    this.radius = _kDefaultIndicatorRadius,
  });

  final bool? animating;
  final double? radius;
}

class PlatformCircularProgressIndicator extends PlatformWidgetBase<
    CupertinoActivityIndicator, CircularProgressIndicator> {
  final Key? widgetKey;

  final PlatformBuilder<MaterialProgressIndicatorData>? material;
  final PlatformBuilder<CupertinoProgressIndicatorData>? cupertino;

  PlatformCircularProgressIndicator({
    super.key,
    this.widgetKey,
    this.material,
    this.cupertino,
  });

  @override
  CircularProgressIndicator createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return CircularProgressIndicator(
      key: data?.key ?? widgetKey,
      backgroundColor: data?.backgroundColor,
      strokeWidth: data?.strokeWidth ?? 4.0,
      value: data?.value,
      valueColor: data?.valueColor,
      semanticsLabel: data?.semanticsLabel,
      semanticsValue: data?.semanticsValue,
      color: data?.color,
      strokeAlign:
          data?.strokeAlign ?? CircularProgressIndicator.strokeAlignCenter,
      strokeCap: data?.strokeCap,
      constraints: data?.constraints,
      padding: data?.padding,
      trackGap: data?.trackGap,
      // year2023: , // deprecated
    );
  }

  @override
  CupertinoActivityIndicator createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoActivityIndicator(
      key: data?.key ?? widgetKey,
      animating: data?.animating ?? true,
      radius: data?.radius ?? _kDefaultIndicatorRadius,
      color: data?.color,
    );
  }
}

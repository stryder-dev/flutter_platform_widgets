/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:flutter/widgets.dart';

import 'extensions.dart';
import 'platform.dart';
import 'widget_base.dart';

const double _kDefaultIndicatorRadius = 10.0;

class CustomCircularProgressIndicatorBuilder
    implements CustomBuilder<PlatformCircularProgressIndicator> {
  final PlatformTargetBuilder<PlatformCircularProgressIndicator> builder;

  CustomCircularProgressIndicatorBuilder(this.builder);
}

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
  });

  final Color? backgroundColor;
  final double? strokeWidth;
  final double? value;
  final Animation<Color>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
}

class CupertinoProgressIndicatorData extends _BaseData {
  CupertinoProgressIndicatorData({
    super.key,
    super.color,
    this.animating,
    this.radius: _kDefaultIndicatorRadius,
  });

  final bool? animating;
  final double? radius;
}

class PlatformCircularProgressIndicator extends PlatformWidgetBase<
    CupertinoActivityIndicator, CircularProgressIndicator> {
  final Key? widgetKey;

  final PlatformBuilder<MaterialProgressIndicatorData>? material;
  final PlatformBuilder<CupertinoProgressIndicatorData>? cupertino;

  final PlatformBuilder? customData;

  PlatformCircularProgressIndicator({
    super.key,
    this.widgetKey,
    this.material,
    this.cupertino,
    this.customData,
  });

  @protected
  CustomBuilder? findCustomBuilder(
    BuildContext context,
    List<CustomBuilder> builders,
  ) {
    return builders
        .firstWhereOrNull((e) => e is CustomCircularProgressIndicatorBuilder);
  }

  @protected
  Widget? buildPlatformWidget(BuildContext context, CustomBuilder b) {
    return (b as CustomCircularProgressIndicatorBuilder)
        .builder(context, this, customData);
  }

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

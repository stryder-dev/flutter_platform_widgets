/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoColors, CupertinoSlider;
import 'package:flutter/material.dart' show SemanticFormatterCallback, Slider;
import 'package:flutter/rendering.dart' show MouseCursor;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.value,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.activeColor,
    this.divisions,
    this.min,
    this.max,
    this.thumbColor,
  });

  final Key? widgetKey;

  final double? value;
  final Color? activeColor;
  final void Function(double)? onChanged;
  final void Function(double)? onChangeStart;
  final void Function(double)? onChangeEnd;
  final int? divisions;
  final double? min;
  final double? max;
  final Color? thumbColor;
}

class MaterialSliderData extends _BaseData {
  MaterialSliderData({
    Key? widgetKey,
    double? value,
    void Function(double)? onChanged,
    void Function(double)? onChangeStart,
    void Function(double)? onChangeEnd,
    int? divisions,
    double? min,
    double? max,
    Color? activeColor,
    this.inactiveColor,
    this.label,
    this.semanticFormatterCallback,
    this.focusNode,
    this.mouseCursor,
    this.autofocus,
    Color? thumbColor,
  }) : super(
            widgetKey: widgetKey,
            value: value,
            onChanged: onChanged,
            onChangeStart: onChangeStart,
            onChangeEnd: onChangeEnd,
            activeColor: activeColor,
            divisions: divisions,
            min: min,
            max: max,
            thumbColor: thumbColor);

  final Color? inactiveColor;
  final String? label;
  final SemanticFormatterCallback? semanticFormatterCallback;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final bool? autofocus;
}

class CupertinoSliderData extends _BaseData {
  CupertinoSliderData({
    Key? widgetKey,
    double? value,
    void Function(double)? onChanged,
    void Function(double)? onChangeStart,
    void Function(double)? onChangeEnd,
    Color? activeColor,
    int? divisions,
    double? min,
    double? max,
    Color? thumbColor,
  }) : super(
            widgetKey: widgetKey,
            value: value,
            onChanged: onChanged,
            onChangeStart: onChangeStart,
            onChangeEnd: onChangeEnd,
            activeColor: activeColor,
            divisions: divisions,
            min: min,
            max: max,
            thumbColor: thumbColor);
}

class PlatformSlider extends PlatformWidgetBase<CupertinoSlider, Slider> {
  final Key? widgetKey;

  final double value;
  final Color? activeColor;
  final void Function(double)? onChanged;
  final void Function(double)? onChangeStart;
  final void Function(double)? onChangeEnd;
  final int? divisions;
  final double min;
  final double max;
  final Color? thumbColor;

  final PlatformBuilder<MaterialSliderData>? material;
  final PlatformBuilder<CupertinoSliderData>? cupertino;

  PlatformSlider({
    Key? key,
    this.widgetKey,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.activeColor,
    this.divisions,
    this.min = 0.0,
    this.max = 1.0,
    this.thumbColor,
    this.material,
    this.cupertino,
  })  : assert(divisions == null || divisions > 0),
        assert(value >= min && value <= max),
        super(key: key);

  @override
  Slider createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return Slider(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      onChangeStart: data?.onChangeStart ?? onChangeStart,
      onChangeEnd: data?.onChangeEnd ?? onChangeEnd,
      activeColor: data?.activeColor ?? activeColor,
      divisions: data?.divisions ?? divisions,
      max: data?.max ?? max,
      min: data?.min ?? min,
      inactiveColor: data?.inactiveColor,
      label: data?.label,
      semanticFormatterCallback: data?.semanticFormatterCallback,
      focusNode: data?.focusNode,
      mouseCursor: data?.mouseCursor,
      autofocus: data?.autofocus ?? false,
      thumbColor: data?.thumbColor ?? thumbColor,
    );
  }

  @override
  CupertinoSlider createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoSlider(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      onChangeStart: data?.onChangeStart ?? onChangeStart,
      onChangeEnd: data?.onChangeEnd ?? onChangeEnd,
      activeColor: data?.activeColor ?? activeColor,
      divisions: data?.divisions ?? divisions,
      max: data?.max ?? max,
      min: data?.min ?? min,
      thumbColor: data?.thumbColor ?? thumbColor ?? CupertinoColors.white,
    );
  }
}

/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoRadio;
import 'package:flutter/material.dart'
    show Radio, MaterialTapTargetSize, VisualDensity;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData<T> {
  _BaseData({
    this.widgetKey,
    this.value,
    this.toggleable,
    this.activeColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
    this.mouseCursor,
    this.enabled,
    this.groupRegistry,
  });
  final Key? widgetKey;
  final T? value;
  final bool? toggleable;
  final Color? activeColor;

  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final MouseCursor? mouseCursor;
  final bool? enabled;
  final RadioGroupRegistry<T>? groupRegistry;
}

class MaterialRadioData<T> extends _BaseData<T> {
  MaterialRadioData({
    //Material
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.fillColor,
    this.backgroundColor,
    this.innerRadius,
    this.side,
    // Common
    super.widgetKey,
    super.value,
    super.toggleable,
    super.activeColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.mouseCursor,
    super.enabled,
    super.groupRegistry,
  });

  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final WidgetStateProperty<Color?>? fillColor;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<double?>? innerRadius;
  final BorderSide? side;
}

class CupertinoRadioData<T> extends _BaseData<T> {
  CupertinoRadioData({
    //Cupertino
    this.inactiveColor,
    this.fillColor,
    this.useCheckmarkStyle,
    //Common
    super.widgetKey,
    super.value,
    super.toggleable,
    super.activeColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.mouseCursor,
    super.enabled,
    super.groupRegistry,
  });

  final Color? inactiveColor;
  final Color? fillColor;
  final bool? useCheckmarkStyle;
}

class PlatformRadio<T> extends PlatformWidgetBase<CupertinoRadio, Radio> {
  final Key? widgetKey;
  final T value;
  final bool toggleable;
  final Color? activeColor;
  final Color? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final MouseCursor? mouseCursor;
  final bool? enabled;
  final RadioGroupRegistry<T>? groupRegistry;

  final PlatformBuilder<MaterialRadioData<T>>? material;
  final PlatformBuilder<CupertinoRadioData<T>>? cupertino;

  const PlatformRadio({
    super.key,
    this.widgetKey,
    required this.value,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.mouseCursor,
    this.enabled,
    this.groupRegistry,
    this.material,
    this.cupertino,
  });

  @override
  Radio createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return Radio<T>(
      //Material
      hoverColor: data?.hoverColor,
      overlayColor: data?.overlayColor,
      splashRadius: data?.splashRadius,
      materialTapTargetSize: data?.materialTapTargetSize,
      visualDensity: data?.visualDensity,
      //Common
      mouseCursor: data?.mouseCursor ?? mouseCursor,
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      toggleable: data?.toggleable ?? toggleable,
      activeColor: data?.activeColor ?? activeColor,
      fillColor: data?.fillColor ?? WidgetStateProperty.all(fillColor),
      focusColor: data?.focusColor ?? focusColor,
      autofocus: data?.autofocus ?? autofocus,
      focusNode: data?.focusNode ?? focusNode,
      backgroundColor: data?.backgroundColor,
      innerRadius: data?.innerRadius,
      side: data?.side,
      enabled: data?.enabled ?? enabled,
      groupRegistry: data?.groupRegistry ?? groupRegistry,
    );
  }

  @override
  CupertinoRadio createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    return CupertinoRadio<T>(
      //Cupertino
      inactiveColor: data?.inactiveColor,
      //Common
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      toggleable: data?.toggleable ?? toggleable,
      activeColor: data?.activeColor ?? activeColor,
      fillColor: data?.fillColor ?? fillColor,
      focusColor: data?.focusColor ?? focusColor,
      autofocus: data?.autofocus ?? autofocus,
      focusNode: data?.focusNode ?? focusNode,
      useCheckmarkStyle: data?.useCheckmarkStyle ?? false,
      mouseCursor: data?.mouseCursor ?? mouseCursor,
      enabled: data?.enabled ?? enabled,
      groupRegistry: data?.groupRegistry ?? groupRegistry,
    );
  }
}

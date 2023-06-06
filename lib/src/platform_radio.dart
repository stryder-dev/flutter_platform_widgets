/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoRadio;
import 'package:flutter/material.dart'
    show Radio, MaterialTapTargetSize, MaterialStateProperty, VisualDensity;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData<T> {
  _BaseData({
    this.widgetKey,
    this.value,
    this.groupValue,
    this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
  });
  final Key? widgetKey;
  final T? value;
  final T? groupValue;
  final ValueChanged<dynamic>? onChanged;
  final bool toggleable;
  final Color? activeColor;
  final Color? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
}

class MaterialRadioData extends _BaseData {
  MaterialRadioData({
    // Common
    super.widgetKey,
    super.value,
    super.groupValue,
    super.onChanged,
    super.toggleable = false,
    super.activeColor,
    super.fillColor,
    super.focusColor,
    super.focusNode,
    super.autofocus = false,
    //Material
    this.mouseCursor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
  });
  final MouseCursor? mouseCursor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
}

class CupertinoRadioData extends _BaseData {
  CupertinoRadioData({
    //Common
    super.widgetKey,
    super.value,
    super.groupValue,
    super.onChanged,
    super.toggleable = false,
    super.activeColor,
    super.fillColor,
    super.focusColor,
    super.focusNode,
    super.autofocus = false,
    //Cupertino
    this.inactiveColor,
  });

  final Color? inactiveColor;
}

class PlatformRadio<T> extends PlatformWidgetBase<CupertinoRadio, Radio> {
  //Common
  final Key? widgetKey;
  final T? value;
  final T? groupValue;
  final ValueChanged<dynamic>? onChanged;
  final bool toggleable;
  final Color? activeColor;
  final Color? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  //Platform
  final PlatformBuilder<MaterialRadioData>? material;
  final PlatformBuilder<CupertinoRadioData>? cupertino;

  PlatformRadio({
    //Common
    super.key,
    this.widgetKey,
    this.value,
    this.groupValue,
    this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    //Platform
    this.material,
    this.cupertino,
  });

  @override
  Radio createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return Radio(
      //Common
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      groupValue: data?.groupValue ?? groupValue,
      onChanged: data?.onChanged ?? onChanged,
      toggleable: data?.toggleable ?? toggleable,
      activeColor: data?.activeColor ?? activeColor,
      fillColor: MaterialStateProperty.all(data?.fillColor ?? fillColor),
      focusColor: data?.focusColor ?? focusColor,
      //Material
      mouseCursor: data?.mouseCursor,
      hoverColor: data?.hoverColor,
      overlayColor: data?.overlayColor,
      splashRadius: data?.splashRadius,
      materialTapTargetSize: data?.materialTapTargetSize,
      visualDensity: data?.visualDensity,
    );
  }

  @override
  CupertinoRadio createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    return CupertinoRadio(
      //Common
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      groupValue: data?.groupValue ?? groupValue,
      onChanged: data?.onChanged ?? onChanged,
      toggleable: data?.toggleable ?? toggleable,
      activeColor: data?.activeColor ?? activeColor,
      fillColor: data?.fillColor ?? fillColor,
      focusColor: data?.focusColor ?? focusColor,
      //Cupertino
      inactiveColor: data?.inactiveColor,
    );
  }
}

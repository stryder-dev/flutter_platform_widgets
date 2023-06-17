/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoCheckbox;
import 'package:flutter/material.dart'
    show Checkbox, MaterialTapTargetSize, MaterialStateProperty, VisualDensity;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.value,
    this.tristate = false,
    required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
  }) : assert(tristate || value != null);
  final Key? widgetKey;
  final bool? value;
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
}

class MaterialCheckboxData extends _BaseData {
  MaterialCheckboxData({
    // Common
    super.widgetKey,
    super.value,
    super.tristate = false,
    required super.onChanged,
    super.activeColor,
    super.checkColor,
    super.focusColor,
    super.focusNode,
    super.autofocus = false,
    super.shape,
    super.side,
    //Material
    this.mouseCursor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.isError = false,
  });

  final MouseCursor? mouseCursor;
  final MaterialStateProperty<Color?>? fillColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final bool isError;
}

class CupertinoCheckboxData extends _BaseData {
  CupertinoCheckboxData({
    //Common
    super.widgetKey,
    super.value,
    super.tristate = false,
    required super.onChanged,
    super.activeColor,
    super.checkColor,
    super.focusColor,
    super.focusNode,
    super.autofocus = false,
    super.shape,
    super.side,

    //Cupertino
    this.inactiveColor,
  });

  final Color? inactiveColor;
}

class PlatformCheckbox extends PlatformWidgetBase<CupertinoCheckbox, Checkbox> {
  //Common
  final Key? widgetKey;
  final bool? value;
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;

  //Platform
  final PlatformBuilder<MaterialCheckboxData>? material;
  final PlatformBuilder<CupertinoCheckboxData>? cupertino;

  PlatformCheckbox({
    //Common
    super.key,
    this.widgetKey,
    this.value,
    this.tristate = false,
    required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
    //Platform
    this.material,
    this.cupertino,
  }) : assert(tristate || value != null);

  @override
  Checkbox createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return Checkbox(
      //Common
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      tristate: data?.tristate ?? tristate,
      onChanged: data?.onChanged ?? onChanged,
      activeColor: data?.activeColor ?? activeColor,
      checkColor: data?.checkColor ?? checkColor,
      focusColor: data?.focusColor ?? focusColor,
      focusNode: data?.focusNode ?? focusNode,
      autofocus: data?.autofocus ?? autofocus,
      shape: data?.shape ?? shape,
      side: data?.side ?? side,
      //Material
      mouseCursor: data?.mouseCursor,
      fillColor: data?.fillColor,
      hoverColor: data?.hoverColor,
      overlayColor: data?.overlayColor,
      splashRadius: data?.splashRadius,
      materialTapTargetSize: data?.materialTapTargetSize,
      visualDensity: data?.visualDensity,
      isError: data?.isError ?? false,
    );
  }

  @override
  CupertinoCheckbox createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    return CupertinoCheckbox(
      //Common
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      tristate: data?.tristate ?? tristate,
      onChanged: data?.onChanged ?? onChanged,
      activeColor: data?.activeColor ?? activeColor,
      checkColor: data?.checkColor ?? checkColor,
      focusColor: data?.focusColor ?? focusColor,
      focusNode: data?.focusNode ?? focusNode,
      autofocus: data?.autofocus ?? autofocus,
      shape: data?.shape ?? shape,
      side: data?.side ?? side,
      //Cupertino
      inactiveColor: data?.inactiveColor,
    );
  }
}

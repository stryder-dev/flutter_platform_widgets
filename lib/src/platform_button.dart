/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart'
    show RaisedButton, Brightness, ButtonTextTheme, MaterialTapTargetSize;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData(
      {this.widgetKey,
      this.child,
      this.color,
      this.onPressed,
      this.padding,
      this.disabledColor});

  final Key widgetKey;
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Color disabledColor;
}

class MaterialRaisedButtonData extends _BaseData {
  MaterialRaisedButtonData({
    Key widgetKey,
    Widget child,
    Color color,
    VoidCallback onPressed,
    EdgeInsetsGeometry padding,
    Color disabledColor,
    this.animationDuration,
    this.colorBrightness,
    this.disabledElevation,
    this.disabledTextColor,
    this.elevation,
    this.highlightColor,
    this.highlightElevation,
    this.onHighlightChanged,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
  }) : super(
            widgetKey: widgetKey,
            child: child,
            color: color,
            onPressed: onPressed,
            padding: padding,
            disabledColor: disabledColor);

  final Duration animationDuration;
  final Brightness colorBrightness;

  final double disabledElevation;
  final Color disabledTextColor;
  final double elevation;
  final Color highlightColor;
  final double highlightElevation;
  final ValueChanged<bool> onHighlightChanged;
  final ShapeBorder shape;
  final Color splashColor;
  final Color textColor;
  final ButtonTextTheme textTheme;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
}

class CupertinoButtonData extends _BaseData {
  CupertinoButtonData(
      {Key widgetKey,
      Widget child,
      Color color,
      VoidCallback onPressed,
      EdgeInsetsGeometry padding,
      Color disabledColor,
      this.borderRadius,
      this.minSize,
      this.pressedOpacity})
      : super(
            widgetKey: widgetKey,
            child: child,
            color: color,
            onPressed: onPressed,
            padding: padding,
            disabledColor: disabledColor);

  final BorderRadius borderRadius;
  final double minSize;
  final double pressedOpacity;
}

class PlatformButton extends PlatformWidgetBase<CupertinoButton, RaisedButton> {
  final Key widgetKey;

  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Color disabledColor;

  final PlatformBuilder<MaterialRaisedButtonData> android;
  final PlatformBuilder<CupertinoButtonData> ios;

  PlatformButton(
      {Key key,
      this.widgetKey,
      this.child,
      this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.android,
      this.ios})
      : super(key: key);

  @override
  RaisedButton createAndroidWidget(BuildContext context) {
    MaterialRaisedButtonData data;
    if (android != null) {
      data = android(context);
    }

    return RaisedButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child,
      onPressed: data?.onPressed ?? onPressed,
      animationDuration: data?.animationDuration,
      color: data?.color ?? color,
      colorBrightness: data?.colorBrightness,
      disabledColor: data?.disabledColor ?? disabledColor,
      disabledElevation: data?.disabledElevation,
      disabledTextColor: data?.disabledTextColor,
      elevation: data?.elevation,
      highlightColor: data?.highlightColor,
      highlightElevation: data?.highlightElevation,
      onHighlightChanged: data?.onHighlightChanged,
      padding: data?.padding ?? padding,
      shape: data?.shape,
      splashColor: data?.splashColor,
      textColor: data?.textColor,
      textTheme: data?.textTheme,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      materialTapTargetSize: data?.materialTapTargetSize,
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    CupertinoButtonData data;
    if (ios != null) {
      data = ios(context);
    }

    return new CupertinoButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child,
      onPressed: data?.onPressed ?? onPressed,
      borderRadius: data?.borderRadius ??
          const BorderRadius.all(const Radius.circular(8.0)),
      color: data?.color ?? color,
      minSize: data?.minSize ?? 44.0,
      padding: data?.padding ?? padding,
      pressedOpacity: data?.pressedOpacity ?? 0.1,
      disabledColor: data?.disabledColor ?? disabledColor,
    );
  }
}

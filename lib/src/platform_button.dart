/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart'
    show RaisedButton, Brightness, ButtonTextTheme;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.child, this.color, this.onPressed, this.padding});

  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
}

class MaterialRaisedButtonData extends _BaseData {
  MaterialRaisedButtonData({
    Widget child,
    Color color,
    VoidCallback onPressed,
    EdgeInsetsGeometry padding,
    this.animationDuration,
    this.colorBrightness,
    this.disabledColor,
    this.disabledElevation: 0.0,
    this.disabledTextColor,
    this.elevation: 2.0,
    this.highlightColor,
    this.highlightElevation: 8.0,
    this.onHighlightChanged,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
  }) : super(
            child: child, color: color, onPressed: onPressed, padding: padding);

  final Duration animationDuration;
  final Brightness colorBrightness;
  final Color disabledColor;
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
}

class CupertinoButtonData extends _BaseData {
  CupertinoButtonData(
      {Widget child,
      Color color,
      VoidCallback onPressed,
      EdgeInsetsGeometry padding,
      this.borderRadius,
      this.minSize: 44.0,
      this.pressedOpacity: 0.1})
      : super(
            child: child, color: color, onPressed: onPressed, padding: padding);

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

  final PlatformBuilder<MaterialRaisedButtonData> android;
  final PlatformBuilder<CupertinoButtonData> ios;

  PlatformButton(
      {Key key,
      this.widgetKey,
      this.child,
      this.onPressed,
      this.color,
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
      key: widgetKey,
      child: data?.child ?? child,
      onPressed: data?.onPressed ?? onPressed,
      animationDuration:
          data?.animationDuration ?? const Duration(milliseconds: 200),
      color: data?.color ?? color,
      colorBrightness: data?.colorBrightness,
      disabledColor: data?.disabledColor,
      disabledElevation: data?.disabledElevation ?? 0.0,
      disabledTextColor: data?.disabledTextColor,
      elevation: data?.elevation ?? 2.0,
      highlightColor: data?.highlightColor,
      highlightElevation: data?.highlightElevation ?? 8.0,
      onHighlightChanged: data?.onHighlightChanged,
      padding: data?.padding ?? padding,
      shape: data?.shape,
      splashColor: data?.splashColor,
      textColor: data?.textColor,
      textTheme: data?.textTheme,
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    CupertinoButtonData data;
    if (ios != null) {
      data = ios(context);
    }

    return new CupertinoButton(
      //key: widgetKey,
      child: data?.child ?? child,
      onPressed: data?.onPressed ?? onPressed,
      borderRadius: data?.borderRadius ??
          const BorderRadius.all(const Radius.circular(8.0)),
      color: data?.color ?? color,
      minSize: data?.minSize ?? 44.0,
      padding: data?.padding ?? padding,
      pressedOpacity: data?.pressedOpacity ?? 0.1,
    );
  }
}

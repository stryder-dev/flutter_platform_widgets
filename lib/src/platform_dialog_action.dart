/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoDialogAction;
import 'package:flutter/material.dart'
    show FlatButton, Brightness, ButtonTextTheme;

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.child, this.onPressed});

  final Widget child;
  final VoidCallback onPressed;
}

class MaterialDialogActionData extends _BaseData {
  MaterialDialogActionData(
      {Widget child,
      VoidCallback onPressed,
      this.color,
      this.colorBrightness,
      this.disabledColor,
      this.disabledTextColor,
      this.highlightColor,
      this.onHighlightChanged,
      this.padding,
      this.shape,
      this.splashColor,
      this.textColor,
      this.textTheme})
      : super(child: child, onPressed: onPressed);

  final Color color;
  final Brightness colorBrightness;
  final Color disabledColor;
  final Color disabledTextColor;
  final Color highlightColor;
  final ValueChanged<bool> onHighlightChanged;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Color splashColor;
  final Color textColor;
  final ButtonTextTheme textTheme;
}

class CupertinoDialogActionData extends _BaseData {
  CupertinoDialogActionData(
      {Widget child,
      VoidCallback onPressed,
      this.isDefaultAction: false,
      this.isDestructiveAction: false})
      : super(child: child, onPressed: onPressed);

  final bool isDefaultAction;
  final bool isDestructiveAction;
}

class PlatformDialogAction
    extends PlatformWidgetBase<CupertinoDialogAction, FlatButton> {
  final Key widgetKey;
  final Widget child;
  final VoidCallback onPressed;

  final PlatformBuilder<MaterialDialogActionData> android;
  final PlatformBuilder<CupertinoDialogActionData> ios;

  PlatformDialogAction(
      {Key key,
      this.widgetKey,
      @required this.child,
      @required this.onPressed,
      this.android,
      this.ios})
      : super(key: key);
  @override
  FlatButton createAndroidWidget(BuildContext context) {
    MaterialDialogActionData data;
    if (android != null) {
      data = android(context);
    }

    return FlatButton(
      key: widgetKey,
      child: data?.child ?? child,
      onPressed: data?.onPressed ?? onPressed,
      color: data?.color,
      colorBrightness: data?.colorBrightness,
      disabledColor: data?.disabledColor,
      disabledTextColor: data?.disabledTextColor,
      highlightColor: data?.highlightColor,
      onHighlightChanged: data?.onHighlightChanged,
      padding: data?.padding,
      shape: data?.shape,
      splashColor: data?.splashColor,
      textColor: data?.textColor,
      textTheme: data?.textTheme,
    );
  }

  @override
  CupertinoDialogAction createIosWidget(BuildContext context) {
    CupertinoDialogActionData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoDialogAction(
      child: data?.child ?? child,
      isDefaultAction: data?.isDefaultAction ?? false,
      isDestructiveAction: data?.isDestructiveAction ?? false,
      onPressed: data?.onPressed ?? onPressed,
    );
  }
}

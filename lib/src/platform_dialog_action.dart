/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoDialogAction;
import 'package:flutter/material.dart'
    show
        Brightness,
        ButtonTextTheme,
        FlatButton,
        MaterialTapTargetSize,
        VisualDensity;
import 'package:flutter/rendering.dart' show MouseCursor;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.widgetKey, this.child, this.onPressed});

  final Widget child;
  final VoidCallback onPressed;
  final Key widgetKey;
}

class MaterialDialogActionData extends _BaseData {
  MaterialDialogActionData({
    Widget child,
    VoidCallback onPressed,
    Key widgetKey,
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
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus,
    this.visualDensity,
    this.onLongPress,
    this.mouseCursor,
    this.height,
    this.minWidth,
  }) : super(
          widgetKey: widgetKey,
          child: child,
          onPressed: onPressed,
        );

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
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final Color focusColor;
  final Color hoverColor;
  final FocusNode focusNode;
  final bool autofocus;
  final VisualDensity visualDensity;
  final VoidCallback onLongPress;
  final MouseCursor mouseCursor;
  final double height;
  final double minWidth;
}

class CupertinoDialogActionData extends _BaseData {
  CupertinoDialogActionData(
      {Widget child,
      VoidCallback onPressed,
      Key widgetKey,
      this.isDefaultAction,
      this.isDestructiveAction,
      this.textStyle})
      : super(
          widgetKey: widgetKey,
          child: child,
          onPressed: onPressed,
        );

  final bool isDefaultAction;
  final bool isDestructiveAction;
  final TextStyle textStyle;
}

class PlatformDialogAction
    extends PlatformWidgetBase<CupertinoDialogAction, FlatButton> {
  final Key widgetKey;
  final Widget child;
  final VoidCallback onPressed;

  final PlatformBuilder2<MaterialDialogActionData> material;
  final PlatformBuilder2<CupertinoDialogActionData> cupertino;

  PlatformDialogAction({
    Key key,
    this.widgetKey,
    @required this.child,
    @required this.onPressed,
    this.material,
    this.cupertino,
  }) : super(key: key);
  @override
  FlatButton createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return FlatButton(
      key: data?.widgetKey ?? widgetKey,
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
      clipBehavior: data?.clipBehavior ?? Clip.none,
      materialTapTargetSize: data?.materialTapTargetSize,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      hoverColor: data?.hoverColor,
      autofocus: data?.autofocus ?? false,
      visualDensity: data?.visualDensity,
      onLongPress: data?.onLongPress,
      mouseCursor: data?.mouseCursor,
      height: data?.height,
      minWidth: data?.minWidth,
    );
  }

  @override
  CupertinoDialogAction createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoDialogAction(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child,
      isDefaultAction: data?.isDefaultAction ?? false,
      isDestructiveAction: data?.isDestructiveAction ?? false,
      onPressed: data?.onPressed ?? onPressed,
      textStyle: data?.textStyle,
    );
  }
}

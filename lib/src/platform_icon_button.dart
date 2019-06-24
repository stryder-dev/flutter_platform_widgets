/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart' show IconButton;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData(
      {this.widgetKey,
      this.icon,
      this.onPressed,
      this.padding,
      this.color,
      this.disabledColor});

  final Key widgetKey;
  final Icon icon;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color color;
  final Color disabledColor;
}

class CupertinoIconButtonData extends _BaseData {
  CupertinoIconButtonData(
      {Key widgetKey,
      Icon icon,
      VoidCallback onPressed,
      EdgeInsets padding,
      Color color,
      Color disabledColor,
      this.borderRadius,
      this.minSize,
      this.pressedOpacity})
      : super(
            widgetKey: widgetKey,
            icon: icon,
            onPressed: onPressed,
            padding: padding,
            color: color,
            disabledColor: disabledColor);

  final BorderRadius borderRadius;
  final double minSize;
  final double pressedOpacity;
}

class MaterialIconButtonData extends _BaseData {
  MaterialIconButtonData({
    Key widgetKey,
    Icon icon,
    VoidCallback onPressed,
    EdgeInsets padding,
    Color color,
    Color disabledColor,
    this.alignment,
    this.highlightColor,
    this.iconSize = 24.0,
    this.splashColor,
    this.tooltip,
    // 1.6.3 this.focusColor,
    // 1.6.3 this.hoverColor,
    // 1.6.3 this.focusNode,
  }) : super(
            widgetKey: widgetKey,
            icon: icon,
            onPressed: onPressed,
            padding: padding,
            color: color,
            disabledColor: disabledColor);

  final AlignmentGeometry alignment;
  final Color highlightColor;
  final double iconSize;
  final Color splashColor;
  final String tooltip;
  // 1.6.3 final Color focusColor;
  // 1.6.3 final Color hoverColor;
  // 1.6.3 final FocusNode focusNode;
}

class PlatformIconButton extends PlatformWidgetBase<CupertinoButton, Widget> {
  final Key widgetKey;

  final Icon icon;
  final Icon iosIcon;
  final Icon androidIcon;
  final VoidCallback onPressed;
  final Color color;
  final EdgeInsets padding;
  final Color disabledColor;

  final PlatformBuilder<MaterialIconButtonData> android;
  final PlatformBuilder<CupertinoIconButtonData> ios;

  PlatformIconButton(
      {Key key,
      this.widgetKey,
      this.icon,
      this.iosIcon,
      this.androidIcon,
      this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.android,
      this.ios})
      : super(key: key);

  @override
  Widget createAndroidWidget(BuildContext context) {
    MaterialIconButtonData data;
    if (android != null) {
      data = android(context);
    }

    return IconButton(
      key: data?.widgetKey ?? widgetKey,
      icon: data?.icon ?? androidIcon ?? icon,
      onPressed: data?.onPressed ?? onPressed,
      padding: data?.padding ?? padding ?? const EdgeInsets.all(8.0),
      color: data?.color ?? color,
      alignment: data?.alignment ?? Alignment.center,
      disabledColor: data?.disabledColor ?? disabledColor,
      highlightColor: data?.highlightColor,
      iconSize: data?.iconSize ?? 24.0,
      splashColor: data?.splashColor,
      tooltip: data?.tooltip,
      // 1.6.3 focusColor: data?.focusColor,
      // 1.6.3 focusNode: data?.focusNode,
      // 1.6.3 hoverColor: data?.hoverColor,
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    CupertinoIconButtonData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.icon ?? iosIcon ?? icon,
      onPressed: data?.onPressed ?? onPressed,
      padding: data?.padding ?? padding ?? const EdgeInsets.all(0.0),
      color: data?.color ?? color,
      borderRadius: data?.borderRadius ??
          const BorderRadius.all(const Radius.circular(8.0)),
      minSize: data?.minSize ?? 44.0,
      pressedOpacity: data?.pressedOpacity ?? 0.1,
      disabledColor: data?.disabledColor ?? disabledColor,
    );
  }
}

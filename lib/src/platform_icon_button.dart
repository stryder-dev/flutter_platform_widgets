/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton, CupertinoColors;
import 'package:flutter/material.dart' show IconButton;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

const double _kMinInteractiveDimensionCupertino = 44.0;

abstract class _BaseData {
  _BaseData(
      {this.widgetKey,
      this.icon,
      this.onPressed,
      this.padding,
      this.color,
      this.disabledColor});

  final Key widgetKey;
  final Widget icon;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color color;
  final Color disabledColor;
}

class CupertinoIconButtonData extends _BaseData {
  CupertinoIconButtonData(
      {Key widgetKey,
      Widget icon,
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
    Widget icon,
    VoidCallback onPressed,
    EdgeInsets padding,
    Color color,
    Color disabledColor,
    this.alignment,
    this.highlightColor,
    this.iconSize = 24.0,
    this.splashColor,
    this.tooltip,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus,
    this.enableFeedback,
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
  final Color focusColor;
  final Color hoverColor;
  final FocusNode focusNode;
  final bool autofocus;
  final bool enableFeedback;
}

class PlatformIconButton extends PlatformWidgetBase<CupertinoButton, Widget> {
  final Key widgetKey;

  final Widget icon;
  final Widget iosIcon;
  final Widget androidIcon;
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
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      hoverColor: data?.hoverColor,
      autofocus: data?.autofocus ?? false,
      enableFeedback: data?.enableFeedback ?? true,
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
      padding: data?.padding ?? padding,
      color: data?.color ?? color,
      borderRadius: data?.borderRadius ??
          const BorderRadius.all(const Radius.circular(8.0)),
      minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
      pressedOpacity: data?.pressedOpacity ?? 0.4,
      disabledColor: data?.disabledColor ??
          disabledColor ??
          CupertinoColors.quaternarySystemFill,
    );
  }
}

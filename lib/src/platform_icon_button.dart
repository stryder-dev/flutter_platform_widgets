/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton, CupertinoColors;
import 'package:flutter/material.dart' show IconButton, VisualDensity;
import 'package:flutter/rendering.dart' show MouseCursor;
import 'package:flutter/widgets.dart';

import 'platform.dart';
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
    this.visualDensity,
    this.constraints,
    this.splashRadius,
    this.mouseCursor,
  }) : super(
          widgetKey: widgetKey,
          icon: icon,
          onPressed: onPressed,
          padding: padding,
          color: color,
          disabledColor: disabledColor,
        );

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
  final VisualDensity visualDensity;
  final BoxConstraints constraints;
  final double splashRadius;
  final MouseCursor mouseCursor;
}

class PlatformIconButton extends PlatformWidgetBase<CupertinoButton, Widget> {
  final Key widgetKey;

  final Widget icon;
  final Widget cupertinoIcon;
  final Widget materialIcon;
  final VoidCallback onPressed;
  final Color color;
  final EdgeInsets padding;
  final Color disabledColor;

  final PlatformBuilder2<MaterialIconButtonData> material;
  final PlatformBuilder2<CupertinoIconButtonData> cupertino;

  PlatformIconButton({
    Key key,
    this.widgetKey,
    this.icon,
    this.cupertinoIcon,
    this.materialIcon,
    this.onPressed,
    this.color,
    this.disabledColor,
    this.padding,
    this.material,
    this.cupertino,
  }) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return IconButton(
      key: data?.widgetKey ?? widgetKey,
      icon: data?.icon ?? materialIcon ?? icon,
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
      visualDensity: data?.visualDensity,
      constraints: data?.constraints,
      splashRadius: data?.splashRadius,
      mouseCursor: data?.mouseCursor,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.icon ?? cupertinoIcon ?? icon,
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

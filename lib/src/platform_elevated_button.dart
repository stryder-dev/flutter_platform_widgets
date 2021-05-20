/*
 * flutter_platform_widgets
 * Copyright (c) 2021 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton, CupertinoColors;
import 'package:flutter/material.dart' show ElevatedButton, ButtonStyle;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const double _kMinInteractiveDimensionCupertino = 44.0;

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.child,
    this.onPressed,
  });

  final Key? widgetKey;
  final Widget? child;
  final VoidCallback? onPressed;
}

class MaterialElevatedButtonData extends _BaseData {
  MaterialElevatedButtonData({
    Key? widgetKey,
    Widget? child,
    VoidCallback? onPressed,
    this.onLongPress,
    this.focusNode,
    this.style,
    this.autofocus,
    this.clipBehavior,
    this.icon,
  }) : super(
          widgetKey: widgetKey,
          child: child,
          onPressed: onPressed,
        );

  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final ButtonStyle? style;
  final bool? autofocus;
  final Clip? clipBehavior;
  final Widget? icon;
}

class CupertinoElevatedButtonData extends _BaseData {
  CupertinoElevatedButtonData({
    Key? widgetKey,
    Widget? child,
    VoidCallback? onPressed,
    this.color,
    this.padding,
    this.disabledColor,
    this.borderRadius,
    this.minSize,
    this.pressedOpacity,
    this.alignment,
    this.originalStyle = false,
  }) : super(
          widgetKey: widgetKey,
          child: child,
          onPressed: onPressed,
        );

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;
  final BorderRadius? borderRadius;
  final double? minSize;
  final double? pressedOpacity;
  final AlignmentGeometry? alignment;

  // If true will use the text style rather than the filled style
  final bool originalStyle;
}

class PlatformElevatedButton
    extends PlatformWidgetBase<CupertinoButton, ElevatedButton> {
  final Key? widgetKey;

  final VoidCallback? onPressed;
  final Widget? child;

  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  final PlatformBuilder<CupertinoElevatedButtonData>? cupertino;
  final PlatformBuilder<MaterialElevatedButtonData>? material;

  PlatformElevatedButton({
    this.widgetKey,
    this.onPressed,
    this.child,
    this.padding,
    this.alignment,
    this.material,
    this.cupertino,
  });

  @override
  ElevatedButton createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    final icon = data?.icon;

    if (icon != null) {
      return ElevatedButton.icon(
        key: data?.widgetKey ?? widgetKey,
        label: data?.child ?? child!,
        icon: icon,
        onPressed: data?.onPressed ?? onPressed,
        onLongPress: data?.onLongPress,
        autofocus: data?.autofocus ?? false,
        clipBehavior: data?.clipBehavior ?? Clip.none,
        focusNode: data?.focusNode,
        style: data?.style ??
            ElevatedButton.styleFrom(padding: padding, alignment: alignment),
      );
    }

    return ElevatedButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child!,
      onPressed: data?.onPressed ?? onPressed,
      onLongPress: data?.onLongPress,
      autofocus: data?.autofocus ?? false,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      focusNode: data?.focusNode,
      style: data?.style ??
          ElevatedButton.styleFrom(padding: padding, alignment: alignment),
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    if (data?.originalStyle ?? false) {
      return CupertinoButton(
        key: data?.widgetKey ?? widgetKey,
        child: data?.child ?? child!,
        onPressed: data?.onPressed ?? onPressed,
        borderRadius: data?.borderRadius ??
            const BorderRadius.all(const Radius.circular(8.0)),
        minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
        padding: data?.padding ?? padding,
        pressedOpacity: data?.pressedOpacity ?? 0.4,
        disabledColor:
            data?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        alignment: data?.alignment ?? alignment ?? Alignment.center,
        color: data?.color,
      );
    } else {
      return CupertinoButton.filled(
        key: data?.widgetKey ?? widgetKey,
        child: data?.child ?? child!,
        onPressed: data?.onPressed ?? onPressed,
        borderRadius: data?.borderRadius ??
            const BorderRadius.all(const Radius.circular(8.0)),
        minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
        padding: data?.padding ?? padding,
        pressedOpacity: data?.pressedOpacity ?? 0.4,
        disabledColor:
            data?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        alignment: data?.alignment ?? alignment ?? Alignment.center,
      );
    }
  }
}

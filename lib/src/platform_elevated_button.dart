/*
 * flutter_platform_widgets
 * Copyright (c) 2021 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show CupertinoButton, CupertinoColors, CupertinoTheme;
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
    super.widgetKey,
    super.child,
    super.onPressed,
    this.onLongPress,
    this.focusNode,
    this.style,
    this.autofocus,
    this.clipBehavior,
    this.icon,
    this.onHover,
    this.onFocusChange,
  });

  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final ButtonStyle? style;
  final bool? autofocus;
  final Clip? clipBehavior;
  final Widget? icon;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
}

class CupertinoElevatedButtonData extends _BaseData {
  CupertinoElevatedButtonData({
    super.widgetKey,
    super.child,
    super.onPressed,
    this.color,
    this.padding,
    this.disabledColor,
    this.borderRadius,
    this.minSize,
    this.pressedOpacity,
    this.alignment,
    this.originalStyle = false,
  });

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
    extends PlatformWidgetBase<Widget, ElevatedButton> {
  final Key? widgetKey;

  final VoidCallback? onPressed;
  final Widget? child;

  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? color;

  final PlatformBuilder<CupertinoElevatedButtonData>? cupertino;
  final PlatformBuilder<MaterialElevatedButtonData>? material;

  final PlatformBuilder? customData;

  PlatformElevatedButton({
    super.key,
    this.widgetKey,
    this.onPressed,
    this.child,
    this.padding,
    this.alignment,
    this.color,
    this.material,
    this.cupertino,
    this.customData,
  });

  @protected
  Widget? buildPlatformWidget(BuildContext context, CustomWidgetBuilder b) {
    return b.elevatedButtonBuilder
        ?.call(this, customData?.call(context, platform(context)));
  }

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
            ElevatedButton.styleFrom(
              primary: color,
              padding: padding,
              alignment: alignment,
            ),
        onHover: data?.onHover,
        onFocusChange: data?.onFocusChange,
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
          ElevatedButton.styleFrom(
            primary: color,
            padding: padding,
            alignment: alignment,
          ),
      onHover: data?.onHover,
      onFocusChange: data?.onFocusChange,
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
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
        color: color ?? data?.color,
      );
    } else {
      final button = CupertinoButton.filled(
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

      if (color != null) {
        final themeData = CupertinoTheme.of(context);
        return CupertinoTheme(
          data: themeData.copyWith(primaryColor: color),
          child: button,
        );
      }
      return button;
    }
  }
}

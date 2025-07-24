/*
 * flutter_platform_widgets
 * Copyright (c) 2021 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show CupertinoButton, CupertinoButtonSize, CupertinoColors, CupertinoTheme;
import 'package:flutter/material.dart'
    show ButtonStyle, ElevatedButton, IconAlignment;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const _kMinInteractiveDimensionCupertino = 44.0;

abstract class _BaseData {
  const _BaseData({this.widgetKey, this.child, this.onPressed, this.onLongPress});

  final Key? widgetKey;
  final Widget? child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
}

class MaterialElevatedButtonData extends _BaseData {
  const MaterialElevatedButtonData({
    super.widgetKey,
    super.child,
    super.onPressed,
    super.onLongPress,
    this.focusNode,
    this.style,
    this.autofocus,
    this.clipBehavior,
    this.icon,
    this.onHover,
    this.onFocusChange,
    this.statesController,
    this.iconAlignment,
  });

  final FocusNode? focusNode;
  final ButtonStyle? style;
  final bool? autofocus;
  final Clip? clipBehavior;
  final Widget? icon;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final WidgetStatesController? statesController;
  final IconAlignment? iconAlignment;
}

class CupertinoElevatedButtonData extends _BaseData {
  const CupertinoElevatedButtonData({
    super.widgetKey,
    super.child,
    super.onPressed,
    super.onLongPress,
    this.color,
    this.padding,
    this.disabledColor,
    this.borderRadius,
    @Deprecated(
      'Use minimumSize instead. '
      'This feature was deprecated after v3.28.0-3.0.pre.',
    )
    this.minSize,
    this.pressedOpacity,
    this.alignment,
    this.originalStyle = false,
    this.autofocus,
    this.focusColor,
    this.focusNode,
    this.onFocusChange,
    this.sizeStyle,
    this.minimumSize,
    this.mouseCursor,
  });

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;
  final BorderRadius? borderRadius;
  final double? minSize;
  final double? pressedOpacity;
  final AlignmentGeometry? alignment;
  final bool? autofocus;
  final Color? focusColor;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final CupertinoButtonSize? sizeStyle;
  final Size? minimumSize;
  final MouseCursor? mouseCursor;

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
  final VoidCallback? onLongPress;

  final PlatformBuilder<CupertinoElevatedButtonData>? cupertino;
  final PlatformBuilder<MaterialElevatedButtonData>? material;

  const PlatformElevatedButton({
    super.key,
    this.widgetKey,
    this.onPressed,
    this.child,
    this.padding,
    this.alignment,
    this.color,
    this.onLongPress,
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
        onLongPress: data?.onLongPress ?? onLongPress,
        autofocus: data?.autofocus ?? false,
        clipBehavior: data?.clipBehavior ?? Clip.none,
        focusNode: data?.focusNode,
        style:
            data?.style ??
            ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: padding,
              alignment: alignment,
            ),
        onHover: data?.onHover,
        onFocusChange: data?.onFocusChange,
        statesController: data?.statesController,
        iconAlignment: data?.iconAlignment,
      );
    }

    return ElevatedButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child!,
      onPressed: data?.onPressed ?? onPressed,
      onLongPress: data?.onLongPress ?? onLongPress,
      autofocus: data?.autofocus ?? false,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      focusNode: data?.focusNode,
      style:
          data?.style ??
          ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: padding,
            alignment: alignment,
          ),
      onHover: data?.onHover,
      onFocusChange: data?.onFocusChange,
      statesController: data?.statesController,
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
        borderRadius:
            data?.borderRadius ??
            const BorderRadius.all(const Radius.circular(8.0)),
        minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
        padding: data?.padding ?? padding,
        pressedOpacity: data?.pressedOpacity ?? 0.4,
        disabledColor:
            data?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        alignment: data?.alignment ?? alignment ?? Alignment.center,
        color: data?.color ?? color,
        autofocus: data?.autofocus ?? false,
        focusColor: data?.focusColor,
        focusNode: data?.focusNode,
        onFocusChange: data?.onFocusChange,
        onLongPress: data?.onLongPress ?? onLongPress,
        sizeStyle: data?.sizeStyle ?? CupertinoButtonSize.large,
        minimumSize: data?.minimumSize,
        mouseCursor: data?.mouseCursor,
      );
    } else {
      final button = CupertinoButton.filled(
        key: data?.widgetKey ?? widgetKey,
        child: data?.child ?? child!,
        onPressed: data?.onPressed ?? onPressed,
        borderRadius:
            data?.borderRadius ??
            const BorderRadius.all(const Radius.circular(8.0)),
        minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
        padding: data?.padding ?? padding,
        pressedOpacity: data?.pressedOpacity ?? 0.4,
        disabledColor:
            data?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        alignment: data?.alignment ?? alignment ?? Alignment.center,
        autofocus: data?.autofocus ?? false,
        focusColor: data?.focusColor,
        focusNode: data?.focusNode,
        onFocusChange: data?.onFocusChange,
        onLongPress: data?.onLongPress ?? onLongPress,
        sizeStyle: data?.sizeStyle ?? CupertinoButtonSize.large,
        color: data?.color ?? color,
        minimumSize: data?.minimumSize,
        mouseCursor: data?.mouseCursor,
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

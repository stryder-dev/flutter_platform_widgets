/*
 * flutter_platform_widgets
 * Copyright (c) 2021 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show CupertinoButton, CupertinoColors, CupertinoTheme, CupertinoButtonSize;
import 'package:flutter/material.dart'
    show TextButton, ButtonStyle, IconAlignment;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const _kMinInteractiveDimensionCupertino = 44.0;

abstract class _BaseData {
  const _BaseData({this.widgetKey, this.child, this.onPressed});

  final Key? widgetKey;
  final Widget? child;
  final VoidCallback? onPressed;
}

class MaterialTextButtonData extends _BaseData {
  const MaterialTextButtonData({
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
    this.statesController,
    this.isSemanticButton,
    this.iconAlignment,
  });

  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final ButtonStyle? style;
  final bool? autofocus;
  final Clip? clipBehavior;
  final Widget? icon;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final WidgetStatesController? statesController;
  final bool? isSemanticButton;
  final IconAlignment? iconAlignment;
}

class CupertinoTextButtonData extends _BaseData {
  const CupertinoTextButtonData({
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
    this.autofocus,
    this.focusColor,
    this.focusNode,
    this.onFocusChange,
    this.onLongPress,
    this.sizeStyle,
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
  final VoidCallback? onLongPress;
  final CupertinoButtonSize? sizeStyle;

  // If true will use the filled style rather than the text style
  final bool originalStyle;
}

class PlatformTextButton extends PlatformWidgetBase<Widget, TextButton> {
  final Key? widgetKey;

  final VoidCallback? onPressed;
  final Widget? child;

  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? color;

  final PlatformBuilder<CupertinoTextButtonData>? cupertino;
  final PlatformBuilder<MaterialTextButtonData>? material;

  const PlatformTextButton({
    super.key,
    this.widgetKey,
    this.onPressed,
    this.child,
    this.padding,
    this.alignment,
    this.color,
    this.material,
    this.cupertino,
  });

  @override
  TextButton createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    final icon = data?.icon;

    if (icon != null) {
      return TextButton.icon(
        key: data?.widgetKey ?? widgetKey,
        label: data?.child ?? child!,
        icon: icon,
        onPressed: data?.onPressed ?? onPressed,
        onLongPress: data?.onLongPress,
        autofocus: data?.autofocus ?? false,
        clipBehavior: data?.clipBehavior ?? Clip.none,
        focusNode: data?.focusNode,
        style:
            data?.style ??
            TextButton.styleFrom(
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

    return TextButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child!,
      onPressed: data?.onPressed ?? onPressed,
      onLongPress: data?.onLongPress,
      autofocus: data?.autofocus ?? false,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      focusNode: data?.focusNode,
      style:
          data?.style ??
          TextButton.styleFrom(
            backgroundColor: color,
            padding: padding,
            alignment: alignment,
          ),
      onHover: data?.onHover,
      onFocusChange: data?.onFocusChange,
      statesController: data?.statesController,
      isSemanticButton: data?.isSemanticButton ?? true,
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    if (data?.originalStyle ?? false) {
      final button = CupertinoButton.filled(
        key: data?.widgetKey ?? widgetKey,
        child: data?.child ?? child!,
        onPressed: data?.onPressed ?? onPressed,
        borderRadius:
            data?.borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
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
        onLongPress: data?.onLongPress,
        sizeStyle: data?.sizeStyle ?? CupertinoButtonSize.large,
      );
      if (color != null) {
        final themeData = CupertinoTheme.of(context);
        return CupertinoTheme(
          data: themeData.copyWith(primaryColor: color),
          child: button,
        );
      }
      return button;
    } else {
      return CupertinoButton(
        key: data?.widgetKey ?? widgetKey,
        child: data?.child ?? child!,
        onPressed: data?.onPressed ?? onPressed,
        borderRadius:
            data?.borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
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
        onLongPress: data?.onLongPress,
        sizeStyle: data?.sizeStyle ?? CupertinoButtonSize.large,
      );
    }
  }
}

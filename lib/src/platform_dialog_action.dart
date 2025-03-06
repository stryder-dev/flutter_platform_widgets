/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoDialogAction;
import 'package:flutter/material.dart'
    show
        Brightness,
        ButtonStyle,
        ButtonTextTheme,
        MaterialTapTargetSize,
        TextButton,
        WidgetStatesController,
        VisualDensity;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.child,
    this.onPressed,
    this.clipBehavior,
    this.onLongPress,
  });

  final Widget? child;
  final void Function()? onPressed;
  final Key? widgetKey;
  final Clip? clipBehavior;
  final VoidCallback? onLongPress;
}

class MaterialDialogActionData extends _BaseData {
  MaterialDialogActionData({
    super.widgetKey,
    super.child,
    super.onPressed,
    super.onLongPress,
    super.clipBehavior,
    this.focusNode,
    this.style,
    this.autofocus,
    this.icon,
    this.onHover,
    this.onFocusChange,
    this.statesController,
    this.isSemanticButton,
  });

  final FocusNode? focusNode;
  final ButtonStyle? style;
  final bool? autofocus;
  final Widget? icon;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final WidgetStatesController? statesController;
  final bool? isSemanticButton;
}

class MaterialDialogFlatActionData extends _BaseData {
  MaterialDialogFlatActionData({
    super.child,
    super.onPressed,
    super.widgetKey,
    super.onLongPress,
    super.clipBehavior,
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
    this.materialTapTargetSize,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus,
    this.visualDensity,
    this.mouseCursor,
    this.height,
    this.minWidth,
  });

  final Color? color;
  final Brightness? colorBrightness;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? highlightColor;
  final ValueChanged<bool>? onHighlightChanged;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Color? splashColor;
  final Color? textColor;
  final ButtonTextTheme? textTheme;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final VisualDensity? visualDensity;
  final MouseCursor? mouseCursor;
  final double? height;
  final double? minWidth;
}

class CupertinoDialogActionData extends _BaseData {
  CupertinoDialogActionData({
    super.child,
    super.onPressed,
    super.widgetKey,
    this.isDefaultAction,
    this.isDestructiveAction,
    this.textStyle,
  });

  final bool? isDefaultAction;
  final bool? isDestructiveAction;
  final TextStyle? textStyle;
}

class PlatformDialogAction
    extends PlatformWidgetBase<CupertinoDialogAction, Widget> {
  final Key? widgetKey;
  final Widget? child;
  final void Function()? onPressed;

  final PlatformBuilder<MaterialDialogActionData>? material;

  final PlatformBuilder<CupertinoDialogActionData>? cupertino;

  const PlatformDialogAction({
    super.key,
    this.widgetKey,
    this.child,
    this.onPressed,
    this.material,
    this.cupertino,
  });

  @override
  Widget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    assert(data?.child != null || child != null);

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
        style: data?.style,
        onHover: data?.onHover,
        onFocusChange: data?.onFocusChange,
        statesController: data?.statesController,
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
      style: data?.style,
      onFocusChange: data?.onFocusChange,
      onHover: data?.onHover,
      statesController: data?.statesController,
      isSemanticButton: data?.isSemanticButton ?? true,
    );
  }

  @override
  CupertinoDialogAction createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    assert(data?.child != null || child != null);

    return CupertinoDialogAction(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child!,
      isDefaultAction: data?.isDefaultAction ?? false,
      isDestructiveAction: data?.isDestructiveAction ?? false,
      onPressed: data?.onPressed ?? onPressed,
      textStyle: data?.textStyle,
    );
  }
}

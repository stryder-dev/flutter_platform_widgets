/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show
        CupertinoButton,
        CupertinoButtonSize,
        CupertinoColors,
        CupertinoNavigationBar;
import 'package:flutter/material.dart'
    show IconButton, VisualDensity, ButtonStyle;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/src/parent_widget_finder.dart';

import 'platform.dart';
import 'platform_provider.dart';
import 'widget_base.dart';

const _kMinInteractiveDimensionCupertino = 44.0;

abstract class _BaseData {
  const _BaseData({
    this.widgetKey,
    this.icon,
    this.onPressed,
    this.padding,
    this.color,
    this.disabledColor,
    this.onLongPress,
  });

  final Key? widgetKey;
  final Widget? icon;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final Color? color;
  final Color? disabledColor;
  final VoidCallback? onLongPress;
}

class CupertinoIconButtonData extends _BaseData {
  const CupertinoIconButtonData({
    super.widgetKey,
    super.icon,
    super.onPressed,
    super.padding,
    super.color,
    super.disabledColor,
    super.onLongPress,
    this.borderRadius,
    @Deprecated(
      'Use minimumSize instead. '
      'This feature was deprecated after v3.28.0-3.0.pre.',
    )
    this.minSize,
    this.pressedOpacity,
    this.alignment,
    this.autofocus,
    this.focusColor,
    this.focusNode,
    this.onFocusChange,
    this.sizeStyle,
    this.minimumSize,
    this.mouseCursor,
  });

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
}

class MaterialIconButtonData extends _BaseData {
  const MaterialIconButtonData({
    super.widgetKey,
    super.icon,
    super.onPressed,
    super.padding,
    super.color,
    super.disabledColor,
    super.onLongPress,
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
    this.isSelected,
    this.selectedIcon,
    this.style,
    this.onHover,
  });

  final AlignmentGeometry? alignment;
  final Color? highlightColor;
  final double? iconSize;
  final Color? splashColor;
  final String? tooltip;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? enableFeedback;
  final VisualDensity? visualDensity;
  final BoxConstraints? constraints;
  final double? splashRadius;
  final MouseCursor? mouseCursor;
  final bool? isSelected;
  final Widget? selectedIcon;
  final ButtonStyle? style;
  final ValueChanged<bool>? onHover;
}

class PlatformIconButton extends PlatformWidgetBase<CupertinoButton, Widget> {
  final Key? widgetKey;

  final Widget? icon;
  final Widget? cupertinoIcon;
  final Widget? materialIcon;
  final void Function()? onPressed;
  final Color? color;
  final EdgeInsets? padding;
  final Color? disabledColor;
  final VoidCallback? onLongPress;

  final PlatformBuilder<MaterialIconButtonData>? material;
  final PlatformBuilder<CupertinoIconButtonData>? cupertino;

  const PlatformIconButton({
    super.key,
    this.widgetKey,
    this.icon,
    this.cupertinoIcon,
    this.materialIcon,
    this.onPressed,
    this.color,
    this.disabledColor,
    this.padding,
    this.onLongPress,
    this.material,
    this.cupertino,
  });

  @override
  Widget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    // icon is required non nullable
    assert(data?.icon != null || materialIcon != null || icon != null);

    return IconButton(
      key: data?.widgetKey ?? widgetKey,
      icon: data?.icon ?? materialIcon ?? icon!,
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
      mouseCursor: data?.mouseCursor ?? SystemMouseCursors.click,
      isSelected: data?.isSelected,
      selectedIcon: data?.selectedIcon,
      style: data?.style,
      onHover: data?.onHover,
      onLongPress: data?.onLongPress ?? onLongPress,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    // child is required non nullable
    assert(data?.icon != null || cupertinoIcon != null || icon != null);

    // If the IconButton is placed inside the AppBar, we need to have zero padding.
    final haveZeroPadding =
        PlatformProvider.of(
          context,
        )?.settings.iosUseZeroPaddingForAppbarPlatformIcon ??
        false;
    final isPlacedOnPlatformAppBar =
        ParentWidgetFinder.of<CupertinoNavigationBar>(context) != null;
    final overriddenPadding = haveZeroPadding && isPlacedOnPlatformAppBar
        ? EdgeInsets.zero
        : null;

    final givenPadding = data?.padding ?? padding ?? overriddenPadding;

    return CupertinoButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.icon ?? cupertinoIcon ?? icon!,
      onPressed: data?.onPressed ?? onPressed,
      padding: givenPadding,
      color: data?.color ?? color,
      borderRadius:
          data?.borderRadius ??
          const BorderRadius.all(const Radius.circular(8.0)),
      minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
      pressedOpacity: data?.pressedOpacity ?? 0.4,
      disabledColor:
          data?.disabledColor ??
          disabledColor ??
          CupertinoColors.quaternarySystemFill,
      alignment: data?.alignment ?? Alignment.center,
      autofocus: data?.autofocus ?? false,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      onFocusChange: data?.onFocusChange,
      onLongPress: data?.onLongPress ?? onLongPress,
      sizeStyle: data?.sizeStyle ?? CupertinoButtonSize.large,
      minimumSize: data?.minimumSize,
      mouseCursor: data?.mouseCursor,
    );
  }
}

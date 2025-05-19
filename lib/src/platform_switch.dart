/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show MaterialTapTargetSize, Switch;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  const _BaseData({
    this.widgetKey,
    this.value,
    this.onChanged,
    this.activeColor,
    this.dragStartBehavior,
    this.focusNode,
    this.autofocus,
    this.onFocusChange,
    this.thumbIcon,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.onActiveThumbImageError,
    this.onInactiveThumbImageError,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
  });

  final Key? widgetKey;
  final bool? value;
  final Color? activeColor;
  final void Function(bool)? onChanged;
  final DragStartBehavior? dragStartBehavior;
  final FocusNode? focusNode;
  final bool? autofocus;
  final ValueChanged<bool>? onFocusChange;
  final WidgetStateProperty<Icon?>? thumbIcon;
  final WidgetStateProperty<Color?>? trackOutlineColor;
  final WidgetStateProperty<double?>? trackOutlineWidth;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageErrorListener? onInactiveThumbImageError;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
}

class MaterialSwitchData extends _BaseData {
  const MaterialSwitchData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.activeColor,
    super.dragStartBehavior,
    super.focusNode,
    super.autofocus,
    super.onFocusChange,
    super.thumbIcon,
    super.trackOutlineColor,
    super.trackOutlineWidth,
    super.onActiveThumbImageError,
    super.onInactiveThumbImageError,
    super.activeTrackColor,
    super.inactiveThumbColor,
    super.inactiveTrackColor,
    super.activeThumbImage,
    super.inactiveThumbImage,
    this.materialTapTargetSize,
    this.focusColor,
    this.hoverColor,
    this.mouseCursor,
    this.overlayColor,
    this.splashRadius,
    this.thumbColor,
    this.trackColor,
    this.padding,
  });

  final MaterialTapTargetSize? materialTapTargetSize;
  final Color? focusColor;
  final Color? hoverColor;
  final MouseCursor? mouseCursor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final WidgetStateProperty<Color?>? thumbColor;
  final WidgetStateProperty<Color?>? trackColor;

  final EdgeInsetsGeometry? padding;
}

class CupertinoSwitchData extends _BaseData {
  const CupertinoSwitchData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.dragStartBehavior,
    super.focusNode,
    super.autofocus,
    super.onFocusChange,
    super.thumbIcon,
    super.trackOutlineColor,
    super.trackOutlineWidth,
    super.onActiveThumbImageError,
    super.onInactiveThumbImageError,
    super.activeTrackColor,
    super.inactiveThumbColor,
    super.inactiveTrackColor,
    super.activeThumbImage,
    super.inactiveThumbImage,
    this.thumbColor,
    this.applyTheme,
    this.focusColor,
    this.offLabelColor,
    this.onLabelColor,
    this.mouseCursor,
  });

  final Color? thumbColor;
  final bool? applyTheme;
  final Color? focusColor;
  final Color? offLabelColor;
  final Color? onLabelColor;
  final WidgetStateProperty<MouseCursor>? mouseCursor;
}

class PlatformSwitch extends PlatformWidgetBase<CupertinoSwitch, Switch> {
  final Key? widgetKey;

  final bool value;
  final Color? activeColor;
  final void Function(bool)? onChanged;
  final DragStartBehavior? dragStartBehavior;
  final bool? autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final WidgetStateProperty<Icon?>? thumbIcon;
  final WidgetStateProperty<Color?>? trackOutlineColor;
  final WidgetStateProperty<double?>? trackOutlineWidth;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageErrorListener? onInactiveThumbImageError;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;

  final PlatformBuilder<MaterialSwitchData>? material;
  final PlatformBuilder<CupertinoSwitchData>? cupertino;

  const PlatformSwitch({
    super.key,
    this.widgetKey,
    required this.value,
    required this.onChanged,
    this.dragStartBehavior,
    this.activeColor,
    this.autofocus,
    this.focusNode,
    this.onFocusChange,
    this.thumbIcon,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.onActiveThumbImageError,
    this.onInactiveThumbImageError,
    this.activeTrackColor,
    this.activeThumbImage,
    this.inactiveThumbColor,
    this.inactiveThumbImage,
    this.inactiveTrackColor,
    this.material,
    this.cupertino,
  });

  @override
  Switch createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return Switch(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      activeColor: data?.activeColor ?? activeColor,
      activeThumbImage: data?.activeThumbImage ?? activeThumbImage,
      activeTrackColor: data?.activeTrackColor ?? activeTrackColor,
      inactiveThumbColor: data?.inactiveThumbColor ?? inactiveThumbColor,
      inactiveThumbImage: data?.inactiveThumbImage ?? inactiveThumbImage,
      inactiveTrackColor: data?.inactiveTrackColor ?? inactiveTrackColor,
      materialTapTargetSize: data?.materialTapTargetSize,
      dragStartBehavior:
          data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      autofocus: data?.autofocus ?? autofocus ?? false,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode ?? focusNode,
      hoverColor: data?.hoverColor,
      onActiveThumbImageError:
          data?.onActiveThumbImageError ?? onActiveThumbImageError,
      onInactiveThumbImageError:
          data?.onInactiveThumbImageError ?? onInactiveThumbImageError,
      mouseCursor: data?.mouseCursor,
      overlayColor: data?.overlayColor,
      splashRadius: data?.splashRadius,
      thumbColor: data?.thumbColor,
      trackColor: data?.trackColor,
      onFocusChange: data?.onFocusChange ?? onFocusChange,
      thumbIcon: data?.thumbIcon ?? thumbIcon,
      trackOutlineColor: data?.trackOutlineColor ?? trackOutlineColor,
      trackOutlineWidth: data?.trackOutlineWidth ?? trackOutlineWidth,
      padding: data?.padding,
    );
  }

  @override
  CupertinoSwitch createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoSwitch(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      dragStartBehavior:
          data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      thumbColor: data?.thumbColor,
      applyTheme: data?.applyTheme,
      focusColor: data?.focusColor,
      autofocus: data?.autofocus ?? autofocus ?? false,
      focusNode: data?.focusNode ?? focusNode,
      onFocusChange: data?.onFocusChange ?? onFocusChange,
      offLabelColor: data?.offLabelColor,
      onLabelColor: data?.onLabelColor,
      activeThumbImage: data?.activeThumbImage ?? activeThumbImage,
      activeTrackColor: data?.activeTrackColor ?? activeTrackColor,
      inactiveThumbColor: data?.inactiveThumbColor ?? inactiveThumbColor,
      inactiveThumbImage: data?.inactiveThumbImage ?? inactiveThumbImage,
      inactiveTrackColor: data?.inactiveTrackColor ?? inactiveTrackColor,
      mouseCursor: data?.mouseCursor,
      onActiveThumbImageError:
          data?.onActiveThumbImageError ?? onActiveThumbImageError,
      onInactiveThumbImageError:
          data?.onInactiveThumbImageError ?? onInactiveThumbImageError,
      thumbIcon: data?.thumbIcon ?? thumbIcon,
      trackOutlineColor: data?.trackOutlineColor ?? trackOutlineColor,
      trackOutlineWidth: data?.trackOutlineWidth ?? trackOutlineWidth,
      // activeColor: deprecated
      // trackColor: deprecated
    );
  }
}

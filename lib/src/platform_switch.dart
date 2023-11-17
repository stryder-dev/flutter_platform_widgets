/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    show MaterialStateProperty, MaterialTapTargetSize, Switch;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.value,
    this.onChanged,
    this.activeColor,
    this.dragStartBehavior,
    this.focusNode,
    this.autofocus,
    this.onFocusChange,
  });

  final Key? widgetKey;
  final bool? value;
  final Color? activeColor;
  final void Function(bool)? onChanged;
  final DragStartBehavior? dragStartBehavior;
  final FocusNode? focusNode;
  final bool? autofocus;
  final ValueChanged<bool>? onFocusChange;
}

class MaterialSwitchData extends _BaseData {
  MaterialSwitchData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.activeColor,
    super.dragStartBehavior,
    super.focusNode,
    super.autofocus,
    super.onFocusChange,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.materialTapTargetSize,
    this.focusColor,
    this.hoverColor,
    this.onActiveThumbImageError,
    this.onInactiveThumbImageError,
    this.mouseCursor,
    this.overlayColor,
    this.splashRadius,
    this.thumbColor,
    this.trackColor,
    this.thumbIcon,
    this.trackOutlineColor,
    this.trackOutlineWidth,
  });

  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Color? focusColor;
  final Color? hoverColor;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageErrorListener? onInactiveThumbImageError;
  final MouseCursor? mouseCursor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialStateProperty<Color?>? thumbColor;
  final MaterialStateProperty<Color?>? trackColor;
  final MaterialStateProperty<Icon?>? thumbIcon;
  final MaterialStateProperty<Color?>? trackOutlineColor;
  final MaterialStateProperty<double?>? trackOutlineWidth;
}

class CupertinoSwitchData extends _BaseData {
  CupertinoSwitchData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.activeColor,
    super.dragStartBehavior,
    super.focusNode,
    super.autofocus,
    super.onFocusChange,
    this.trackColor,
    this.thumbColor,
    this.applyTheme,
    this.focusColor,
    this.offLabelColor,
    this.onLabelColor,
  });

  final Color? trackColor;
  final Color? thumbColor;
  final bool? applyTheme;
  final Color? focusColor;
  final Color? offLabelColor;
  final Color? onLabelColor;
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

  final PlatformBuilder<MaterialSwitchData>? material;
  final PlatformBuilder<CupertinoSwitchData>? cupertino;

  PlatformSwitch({
    super.key,
    this.widgetKey,
    required this.value,
    required this.onChanged,
    this.dragStartBehavior,
    this.activeColor,
    this.autofocus,
    this.focusNode,
    this.onFocusChange,
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
      activeThumbImage: data?.activeThumbImage,
      activeTrackColor: data?.activeTrackColor,
      inactiveThumbColor: data?.inactiveThumbColor,
      inactiveThumbImage: data?.inactiveThumbImage,
      inactiveTrackColor: data?.inactiveTrackColor,
      materialTapTargetSize: data?.materialTapTargetSize,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      autofocus: data?.autofocus ?? autofocus ?? false,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode ?? focusNode,
      hoverColor: data?.hoverColor,
      onActiveThumbImageError: data?.onActiveThumbImageError,
      onInactiveThumbImageError: data?.onInactiveThumbImageError,
      mouseCursor: data?.mouseCursor,
      overlayColor: data?.overlayColor,
      splashRadius: data?.splashRadius,
      thumbColor: data?.thumbColor,
      trackColor: data?.trackColor,
      onFocusChange: data?.onFocusChange ?? onFocusChange,
      thumbIcon: data?.thumbIcon,
      trackOutlineColor: data?.trackOutlineColor,
      trackOutlineWidth: data?.trackOutlineWidth,
    );
  }

  @override
  CupertinoSwitch createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoSwitch(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      activeColor: data?.activeColor ?? activeColor,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      trackColor: data?.trackColor,
      thumbColor: data?.thumbColor,
      applyTheme: data?.applyTheme,
      focusColor: data?.focusColor,
      autofocus: data?.autofocus ?? autofocus ?? false,
      focusNode: data?.focusNode ?? focusNode,
      onFocusChange: data?.onFocusChange ?? onFocusChange,
      offLabelColor: data?.offLabelColor,
      onLabelColor: data?.onLabelColor,
    );
  }
}

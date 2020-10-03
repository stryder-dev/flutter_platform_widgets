/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show Switch, MaterialTapTargetSize;
import 'package:flutter/rendering.dart' show MouseCursor;
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
  });

  final Key widgetKey;

  final bool value;
  final Color activeColor;
  final ValueChanged<bool> onChanged;
  final DragStartBehavior dragStartBehavior;
}

class MaterialSwitchData extends _BaseData {
  MaterialSwitchData({
    Key widgetKey,
    bool value,
    ValueChanged<bool> onChanged,
    Color activeColor,
    DragStartBehavior dragStartBehavior,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.materialTapTargetSize,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus,
    this.onActiveThumbImageError,
    this.onInactiveThumbImageError,
    this.mouseCursor,
  }) : super(
          widgetKey: widgetKey,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          dragStartBehavior: dragStartBehavior,
        );

  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final ImageProvider activeThumbImage;
  final ImageProvider inactiveThumbImage;
  final MaterialTapTargetSize materialTapTargetSize;
  final Color focusColor;
  final Color hoverColor;
  final FocusNode focusNode;
  final bool autofocus;
  final ImageErrorListener onActiveThumbImageError;
  final ImageErrorListener onInactiveThumbImageError;
  final MouseCursor mouseCursor;
}

class CupertinoSwitchData extends _BaseData {
  CupertinoSwitchData({
    Key widgetKey,
    bool value,
    ValueChanged<bool> onChanged,
    Color activeColor,
    DragStartBehavior dragStartBehavior,
    this.trackColor,
  }) : super(
          widgetKey: widgetKey,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          dragStartBehavior: dragStartBehavior,
        );

  final Color trackColor;
}

class PlatformSwitch extends PlatformWidgetBase<CupertinoSwitch, Switch> {
  final Key widgetKey;

  final bool value;
  final Color activeColor;
  final ValueChanged<bool> onChanged;
  final DragStartBehavior dragStartBehavior;

  final PlatformBuilder2<MaterialSwitchData> material;
  final PlatformBuilder2<CupertinoSwitchData> cupertino;

  PlatformSwitch({
    Key key,
    this.widgetKey,
    @required this.value,
    @required this.onChanged,
    this.dragStartBehavior,
    this.activeColor,
    this.material,
    this.cupertino,
  }) : super(key: key);

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
      autofocus: data?.autofocus ?? false,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      hoverColor: data?.hoverColor,
      onActiveThumbImageError: data?.onActiveThumbImageError,
      onInactiveThumbImageError: data?.onInactiveThumbImageError,
      mouseCursor: data?.mouseCursor,
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
    );
  }
}

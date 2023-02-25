/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoListTile;
import 'package:flutter/material.dart'
    show ListTile, VisualDensity, ListTileStyle;
import 'package:flutter/widgets.dart';
import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final Key? widgetKey;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
}

class MaterialListTileData extends _BaseData {
  MaterialListTileData({
    super.widgetKey,
    super.leading,
    super.title,
    super.subtitle,
    super.trailing,
    super.onTap,
    this.isThreeLine = false,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.contentPadding,
    this.enabled = true,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus = false,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
  }) : assert(!isThreeLine || subtitle != null);

  final bool isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final Color? selectedColor;
  final Color? iconColor;
  final Color? textColor;
  final ListTileStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final GestureLongPressCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;
  final MouseCursor? mouseCursor;
  final bool selected;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;
}

class CupertinoListTileData extends _BaseData {
  CupertinoListTileData({
    super.widgetKey,
    super.leading,
    super.title,
    super.subtitle,
    super.trailing,
    super.onTap,
    this.leadingToTitle,
    this.leadingSize,
    this.padding,
    this.backgroundColor,
    this.backgroundColorActivated,
  });

  double? leadingToTitle = 16.0;
  double? leadingSize = 28.0;
  EdgeInsetsGeometry? padding;
  Color? backgroundColor;
  Color? backgroundColorActivated;
}

class PlatformListTile extends PlatformWidgetBase<CupertinoListTile, ListTile> {
  final Key? widgetKey;

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;

  final VoidCallback? onTap;

  final PlatformBuilder<MaterialListTileData>? material;
  final PlatformBuilder<CupertinoListTileData>? cupertino;

  PlatformListTile({
    super.key,
    this.widgetKey,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.material,
    this.cupertino,
  });

  @override
  ListTile createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return ListTile(
      key: data?.widgetKey ?? widgetKey,
      leading: data?.leading ?? leading,
      title: data?.title ?? title,
      subtitle: data?.subtitle ?? subtitle,
      trailing: data?.trailing ?? trailing,
      onTap: data?.onTap ?? onTap,
    );
  }

  @override
  CupertinoListTile createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoListTile(
      key: data?.widgetKey ?? widgetKey,
      leading: data?.leading ?? leading,
      title: data?.title ?? title,
      subtitle: data?.subtitle ?? subtitle,
      trailing: data?.trailing ?? trailing,
      onTap: data?.onTap ?? onTap,
    );
  }
}

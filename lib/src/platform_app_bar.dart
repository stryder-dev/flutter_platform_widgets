/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoNavigationBar;
import 'package:flutter/material.dart' show AppBar, Brightness, TextTheme;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

//the default has alpha which will cause the content to slide under the header for ios
const Color _kDefaultNavBarBorderColor = const Color(0x4C000000);

const Border _kDefaultNavBarBorder = const Border(
  bottom: const BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);

abstract class _BaseData {
  _BaseData(
      {this.widgetKey,
      this.title,
      this.backgroundColor,
      this.leading,
      this.automaticallyImplyLeading});

  final Widget title;
  final Color backgroundColor;
  final Widget leading;
  final Key widgetKey;
  final bool automaticallyImplyLeading;
}

class MaterialAppBarData extends _BaseData {
  MaterialAppBarData({
    Widget title,
    Color backgroundColor,
    Widget leading,
    Key widgetKey,
    bool automaticallyImplyLeading,
    this.actions,
    this.bottom,
    this.bottomOpacity,
    this.brightness,
    this.centerTitle,
    this.elevation,
    this.flexibleSpace,
    this.iconTheme,
    this.primary,
    this.textTheme,
    this.titleSpacing,
    this.toolbarOpacity,
    this.actionsIconTheme,
    this.shape,
    this.excludeHeaderSemantics,
    this.shadowColor,
    this.toolbarHeight,
    this.leadingWidth,
  }) : super(
          widgetKey: widgetKey,
          title: title,
          backgroundColor: backgroundColor,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
        );

  final List<Widget> actions;
  final PreferredSizeWidget bottom;

  final double bottomOpacity;
  final Brightness brightness;
  final bool centerTitle;
  final double elevation;
  final Widget flexibleSpace;
  final IconThemeData iconTheme;
  final bool primary;
  final TextTheme textTheme;
  final double titleSpacing;
  final double toolbarOpacity;
  final IconThemeData actionsIconTheme;
  final ShapeBorder shape;
  final bool excludeHeaderSemantics;
  final Color shadowColor;
  final double toolbarHeight;
  final double leadingWidth;
}

class CupertinoNavigationBarData extends _BaseData {
  CupertinoNavigationBarData(
      {Widget title,
      Color backgroundColor,
      Widget leading,
      Key widgetKey,
      bool automaticallyImplyLeading,
      this.previousPageTitle,
      this.automaticallyImplyMiddle,
      this.padding,
      this.trailing,
      this.border,
      this.actionsForegroundColor,
      this.transitionBetweenRoutes,
      this.brightness,
      this.heroTag})
      : super(
            widgetKey: widgetKey,
            title: title,
            backgroundColor: backgroundColor,
            leading: leading,
            automaticallyImplyLeading: automaticallyImplyLeading);

  final Widget trailing;
  final Border border;
  final Color actionsForegroundColor;
  final bool transitionBetweenRoutes;
  final Object heroTag;
  final bool automaticallyImplyMiddle;
  final String previousPageTitle;
  final EdgeInsetsDirectional padding;
  final Brightness brightness;
}

class PlatformAppBar
    extends PlatformWidgetBase<CupertinoNavigationBar, PreferredSizeWidget> {
  final Key widgetKey;

  final Widget title;
  final Color backgroundColor;
  final Widget leading;
  final List<Widget> trailingActions;
  final bool automaticallyImplyLeading;

  final PlatformBuilder2<MaterialAppBarData> material;
  final PlatformBuilder2<CupertinoNavigationBarData> cupertino;

  PlatformAppBar({
    Key key,
    this.widgetKey,
    this.title,
    this.backgroundColor,
    this.leading,
    this.trailingActions,
    this.automaticallyImplyLeading,
    this.material,
    this.cupertino,
  }) : super(key: key);

  @override
  PreferredSizeWidget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return AppBar(
      key: data?.widgetKey ?? widgetKey,
      title: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      bottom: data?.bottom,
      actions: data?.actions ?? trailingActions,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      bottomOpacity: data?.bottomOpacity ?? 1.0,
      brightness: data?.brightness,
      centerTitle: data?.centerTitle,
      elevation: data?.elevation ?? 4.0,
      flexibleSpace: data?.flexibleSpace,
      iconTheme: data?.iconTheme,
      leading: data?.leading ?? leading,
      primary: data?.primary ?? true,
      textTheme: data?.textTheme,
      titleSpacing: data?.titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      toolbarOpacity: data?.toolbarOpacity ?? 1.0,
      actionsIconTheme: data?.actionsIconTheme,
      shape: data?.shape,
      excludeHeaderSemantics: data?.excludeHeaderSemantics ?? false,
      shadowColor: data?.shadowColor,
      toolbarHeight: data?.toolbarHeight,
      leadingWidth: data?.leadingWidth,
    );
  }

  @override
  CupertinoNavigationBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    var trailing = trailingActions == null || trailingActions.isEmpty
        ? null
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: trailingActions,
          );

    if (data?.heroTag != null) {
      return CupertinoNavigationBar(
        key: data?.widgetKey ?? widgetKey,
        middle: data?.title ?? title,
        backgroundColor: data?.backgroundColor ?? backgroundColor,
        actionsForegroundColor: data?.actionsForegroundColor,
        automaticallyImplyLeading: data?.automaticallyImplyLeading ??
            automaticallyImplyLeading ??
            true,
        automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
        previousPageTitle: data?.previousPageTitle,
        padding: data?.padding,
        border: data?.border ?? _kDefaultNavBarBorder,
        leading: data?.leading ?? leading,
        trailing: data?.trailing ?? trailing,
        transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
        brightness: data?.brightness,
        heroTag: data.heroTag,
      );
    }

    return CupertinoNavigationBar(
      key: data?.widgetKey ?? widgetKey,
      middle: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      actionsForegroundColor: data?.actionsForegroundColor,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
      previousPageTitle: data?.previousPageTitle,
      padding: data?.padding,
      border: data?.border ?? _kDefaultNavBarBorder,
      leading: data?.leading ?? leading,
      trailing: data?.trailing ?? trailing,
      transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
      brightness: data?.brightness,
      //heroTag: , used above
    );
  }
}

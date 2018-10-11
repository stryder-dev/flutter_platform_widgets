/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show CupertinoNavigationBar, CupertinoColors;
import 'package:flutter/material.dart' show AppBar, Brightness, TextTheme;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

//the default has alpha which will cause the content to slide under the header for ios
const Color _kDefaultNavBarBackgroundColor = const Color(0xCCF8F8F8);
const Color _kDefaultNavBarBorderColor = const Color(0x4C000000);
const Border _kDefaultNavBarBorder = const Border(
  bottom: const BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);


abstract class _BaseData {
  _BaseData({this.title, this.backgroundColor, this.leading});

  final Widget title;
  final Color backgroundColor;
  final Widget leading;
}

class MaterialAppBarData extends _BaseData {
  MaterialAppBarData(
      {Widget title,
        Color backgroundColor,
        Widget leading,
        this.actions,
        this.bottom,
        this.automaticallyImplyLeading: true,
        this.bottomOpacity: 1.0,
        this.brightness,
        this.centerTitle,
        this.elevation: 4.0,
        this.flexibleSpace,
        this.iconTheme,
        this.primary: true,
        this.textTheme,
        this.titleSpacing: NavigationToolbar.kMiddleSpacing,
        this.toolbarOpacity: 1.0})
      : super(title: title, backgroundColor: backgroundColor, leading: leading);

  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final bool automaticallyImplyLeading;
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
}

class CupertinoNavigationBarData extends _BaseData {
  CupertinoNavigationBarData(
      {Widget title,
        Color backgroundColor,
        Widget leading,
        this.trailing,
        this.border,
        this.automaticallyImplyLeading: true,
        this.actionsForegroundColor: CupertinoColors.activeBlue,
        this.transitionBetweenRoutes,
        this.heroTag})
      : super(title: title, backgroundColor: backgroundColor, leading: leading);

  final Widget trailing;
  final Border border;
  final bool automaticallyImplyLeading;
  final Color actionsForegroundColor;
  final bool transitionBetweenRoutes;
  final Object heroTag;
}

class PlatformAppBar
    extends PlatformWidgetBase<CupertinoNavigationBar, PreferredSizeWidget> {
  final Key widgetKey;

  final Widget title;
  final Color backgroundColor;
  final Widget leading;
  final List<Widget> trailingActions;

  final PlatformBuilder<MaterialAppBarData> android;
  final PlatformBuilder<CupertinoNavigationBarData> ios;

  PlatformAppBar(
      {Key key,
        this.widgetKey,
        this.title,
        this.backgroundColor,
        this.leading,
        this.trailingActions,
        this.android,
        this.ios})
      : super(key: key);

  @override
  PreferredSizeWidget createAndroidWidget(BuildContext context) {
    MaterialAppBarData data;
    if (android != null) {
      data = android(context);
    }

    return AppBar(
      title: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      bottom: data?.bottom,
      actions: data?.actions ?? trailingActions,
      automaticallyImplyLeading: data?.automaticallyImplyLeading ?? true,
      bottomOpacity: data?.bottomOpacity ?? 1.0,
      brightness: data?.brightness,
      centerTitle: data?.centerTitle ?? false,
      elevation: data?.elevation ?? 4.0,
      flexibleSpace: data?.flexibleSpace,
      iconTheme: data?.iconTheme,
      leading: data?.leading ?? leading,
      key: widgetKey,
      primary: data?.primary ?? true,
      textTheme: data?.textTheme,
      titleSpacing: data?.titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      toolbarOpacity: data?.toolbarOpacity ?? 1.0,
    );
  }

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) {
    CupertinoNavigationBarData data;
    if (ios != null) {
      data = ios(context);
    }

    var trailing = trailingActions == null || trailingActions.isEmpty
        ? null
        : new Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: trailingActions,
    );

    if(data?.heroTag != null){
      return CupertinoNavigationBar(
        middle: data?.title ?? title,
        backgroundColor: data?.backgroundColor ??
            backgroundColor ??
            _kDefaultNavBarBackgroundColor,
        actionsForegroundColor:
        data?.actionsForegroundColor ?? CupertinoColors.activeBlue,
        automaticallyImplyLeading: data?.automaticallyImplyLeading ?? true,
        border: data?.border ?? _kDefaultNavBarBorder,
        key: widgetKey,
        leading: data?.leading ?? leading,
        trailing: data?.trailing ?? trailing,
        transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
        heroTag: data.heroTag,
      );
    }

    return CupertinoNavigationBar(
      middle: data?.title ?? title,
      backgroundColor: data?.backgroundColor ??
          backgroundColor ??
          _kDefaultNavBarBackgroundColor,
      actionsForegroundColor:
      data?.actionsForegroundColor ?? CupertinoColors.activeBlue,
      automaticallyImplyLeading: data?.automaticallyImplyLeading ?? true,
      border: data?.border ?? _kDefaultNavBarBorder,
      key: widgetKey,
      leading: data?.leading ?? leading,
      trailing: data?.trailing ?? trailing,
      transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
    );
  }
}

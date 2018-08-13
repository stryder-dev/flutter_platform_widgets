/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoTabBar, CupertinoColors;
import 'package:flutter/material.dart'
    show BottomAppBar, BottomNavigationBar, BottomNavigationBarType;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData(
      {this.items, this.backgroundColor, this.iconSize, this.activeColor});

  final List<BottomNavigationBarItem> items;
  final Color backgroundColor;
  final double iconSize;
  final Color activeColor;
}

class CupertinoTabBarData extends _BaseData {
  CupertinoTabBarData(
      {Color backgroundColor,
      List<BottomNavigationBarItem> items,
      Color activeColor,
      double iconSize: 30.0,
      this.inactiveColor})
      : super(
            items: items,
            backgroundColor: backgroundColor,
            iconSize: iconSize,
            activeColor: activeColor);

  final Color inactiveColor;
}

class MaterialNavBarData extends _BaseData {
  MaterialNavBarData(
      {List<BottomNavigationBarItem> items,
      Color backgroundColor,
      double iconSize: 24.0,
      this.elevation: 8.0,
      Color fixedColor,
      this.type})
      : super(
            items: items,
            backgroundColor: backgroundColor,
            iconSize: iconSize,
            activeColor: fixedColor);

  final double elevation;
  final BottomNavigationBarType type;
}

const Color _kDefaultTabBarBackgroundColor = const Color(0xCCF8F8F8);

class PlatformNavBar extends PlatformWidgetBase<CupertinoTabBar, BottomAppBar> {
  final Key widgetKey;
  final Color backgroundColor;

  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> itemChanged;
  final int currentIndex;

  final PlatformBuilder<MaterialNavBarData> android;
  final PlatformBuilder<CupertinoTabBarData> ios;

  PlatformNavBar(
      {Key key,
      this.widgetKey,
      this.backgroundColor,
      this.items,
      this.itemChanged,
      this.currentIndex: 0,
      this.android,
      this.ios})
      : super(key: key);

  @override
  BottomAppBar createAndroidWidget(BuildContext context) {
    MaterialNavBarData data;
    if (android != null) {
      data = android(context);
    }

    var bar = BottomNavigationBar(
      items: data?.items ?? items,
      currentIndex: currentIndex,
      onTap: itemChanged,
      iconSize: data?.iconSize ?? 24.0,
      fixedColor: data?.activeColor,
      type: data?.type,
    );

    return BottomAppBar(
      child: bar,
      color: data?.backgroundColor ?? backgroundColor,
      elevation: data?.elevation ?? 8.0,
      key: widgetKey,
    );
  }

  @override
  CupertinoTabBar createIosWidget(BuildContext context) {
    CupertinoTabBarData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoTabBar(
      items: data?.items ?? items,
      activeColor: data?.activeColor ?? CupertinoColors.activeBlue,
      backgroundColor: data?.backgroundColor ??
          backgroundColor ??
          _kDefaultTabBarBackgroundColor,
      currentIndex: currentIndex,
      iconSize: data?.iconSize ?? 30.0,
      inactiveColor: data?.inactiveColor ?? CupertinoColors.inactiveGray,
      key: widgetKey,
      onTap: itemChanged,
    );
  }
}

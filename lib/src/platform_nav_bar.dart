/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoTabBar, CupertinoColors;
import 'package:flutter/material.dart'
    show BottomAppBar, BottomNavigationBar, BottomNavigationBarType;
import 'package:flutter/rendering.dart' show MouseCursor;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const Color _kDefaultTabBarBorderColor = Color(0x4C000000);
const Color _kDefaultTabBarInactiveColor = CupertinoColors.inactiveGray;

abstract class _BaseData {
  _BaseData(
      {this.widgetKey,
      this.items,
      this.backgroundColor,
      this.iconSize,
      this.activeColor,
      this.currentIndex,
      this.itemChanged});

  final Key widgetKey;
  final List<BottomNavigationBarItem> items;
  final Color backgroundColor;
  final double iconSize;
  final Color activeColor;
  final int currentIndex;
  final ValueChanged<int> itemChanged;
}

class CupertinoTabBarData extends _BaseData {
  CupertinoTabBarData({
    Color backgroundColor,
    List<BottomNavigationBarItem> items,
    Color activeColor,
    Key widgetKey,
    ValueChanged<int> itemChanged,
    double iconSize,
    int currentIndex,
    this.inactiveColor,
    this.border,
  }) : super(
            widgetKey: widgetKey,
            items: items,
            backgroundColor: backgroundColor,
            iconSize: iconSize,
            activeColor: activeColor,
            currentIndex: currentIndex,
            itemChanged: itemChanged);

  final Color inactiveColor;
  final Border border;
}

class MaterialNavBarData extends _BaseData {
  MaterialNavBarData({
    List<BottomNavigationBarItem> items,
    Color backgroundColor,
    double iconSize,
    this.elevation,
    Color fixedColor,
    Key widgetKey,
    ValueChanged<int> itemChanged,
    int currentIndex,
    this.type,
    this.bottomNavigationBarKey,
    this.shape,
    this.clipBehavior,
    this.notchMargin,
    this.selectedFontSize,
    this.selectedItemColor,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.unselectedFontSize,
    this.unselectedItemColor,
    this.selectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedIconTheme,
    this.unselectedLabelStyle,
    this.mouseCursor,
  }) : super(
            widgetKey: widgetKey,
            items: items,
            backgroundColor: backgroundColor,
            iconSize: iconSize,
            activeColor: fixedColor,
            currentIndex: currentIndex,
            itemChanged: itemChanged);

  final double selectedFontSize;
  final double elevation;
  final BottomNavigationBarType type;
  final Key bottomNavigationBarKey;
  final NotchedShape shape;
  final Clip clipBehavior;
  final double notchMargin;
  final Color selectedItemColor;
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final double unselectedFontSize;
  final Color unselectedItemColor;
  final IconThemeData selectedIconTheme;
  final TextStyle selectedLabelStyle;
  final IconThemeData unselectedIconTheme;
  final TextStyle unselectedLabelStyle;
  final MouseCursor mouseCursor;
}

class PlatformNavBar extends PlatformWidgetBase<CupertinoTabBar, BottomAppBar> {
  final Key widgetKey;
  final Color backgroundColor;

  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> itemChanged;
  final int currentIndex;

  final PlatformBuilder2<MaterialNavBarData> material;
  final PlatformBuilder2<CupertinoTabBarData> cupertino;

  PlatformNavBar({
    Key key,
    this.widgetKey,
    this.backgroundColor,
    this.items,
    this.itemChanged,
    this.currentIndex,
    this.material,
    this.cupertino,
  }) : super(key: key);

  @override
  BottomAppBar createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    var bar = BottomNavigationBar(
      items: data?.items ?? items,
      currentIndex: data?.currentIndex ?? currentIndex ?? 0,
      onTap: data?.itemChanged ?? itemChanged,
      iconSize: data?.iconSize ?? 24.0,
      fixedColor: data?.activeColor,
      type: data?.type,
      key: data?.bottomNavigationBarKey,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      elevation: data?.elevation ?? 8.0,
      selectedFontSize: data?.selectedFontSize ?? 14.0,
      selectedItemColor: data?.selectedItemColor,
      showSelectedLabels: data?.showSelectedLabels ?? true,
      showUnselectedLabels: data?.showUnselectedLabels,
      unselectedFontSize: data?.unselectedFontSize ?? 12.0,
      unselectedItemColor: data?.unselectedItemColor,
      selectedIconTheme: data?.selectedIconTheme ?? const IconThemeData(),
      selectedLabelStyle: data?.selectedLabelStyle,
      unselectedIconTheme: data?.unselectedIconTheme ?? const IconThemeData(),
      unselectedLabelStyle: data?.unselectedLabelStyle,
      mouseCursor: data?.mouseCursor,
    );

    return BottomAppBar(
      child: bar,
      color: data?.backgroundColor ?? backgroundColor,
      elevation: data?.elevation,
      key: data?.widgetKey ?? widgetKey,
      shape: data?.shape,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      notchMargin: data?.notchMargin ?? 4.0,
    );
  }

  @override
  CupertinoTabBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoTabBar(
      items: data?.items ?? items,
      activeColor: data?.activeColor,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      currentIndex: data?.currentIndex ?? currentIndex ?? 0,
      iconSize: data?.iconSize ?? 30.0,
      inactiveColor: data?.inactiveColor ?? _kDefaultTabBarInactiveColor,
      key: data?.widgetKey ?? widgetKey,
      onTap: data?.itemChanged ?? itemChanged,
      border: data?.border ??
          const Border(
            top: BorderSide(
              color: _kDefaultTabBarBorderColor,
              width: 0.0, // One physical pixel.
              style: BorderStyle.solid,
            ),
          ),
    );
  }
}

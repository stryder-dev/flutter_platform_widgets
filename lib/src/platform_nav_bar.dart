/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoTabBar, CupertinoColors;
import 'package:flutter/material.dart'
    show
        BottomAppBar,
        BottomNavigationBar,
        BottomNavigationBarType,
        BottomNavigationBarLandscapeLayout;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

// Standard iOS 10 tab bar height.
const double _kTabBarHeight = 50.0;
const Color _kDefaultTabBarBorderColor = Color(0x4C000000);
const Color _kDefaultTabBarInactiveColor = CupertinoColors.inactiveGray;

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.items,
    this.backgroundColor,
    this.iconSize,
    this.activeColor,
    this.currentIndex,
    this.itemChanged,
    this.height,
  });

  final Key? widgetKey;
  final List<BottomNavigationBarItem>? items;
  final Color? backgroundColor;
  final double? iconSize;
  final Color? activeColor;
  final int? currentIndex;
  final void Function(int)? itemChanged;
  final double? height;
}

class CupertinoTabBarData extends _BaseData {
  CupertinoTabBarData({
    super.backgroundColor,
    super.items,
    super.activeColor,
    super.widgetKey,
    super.itemChanged,
    super.iconSize,
    super.currentIndex,
    super.height,
    this.inactiveColor,
    this.border,
  });

  final Color? inactiveColor;
  final Border? border;
}

class MaterialNavBarData extends _BaseData {
  MaterialNavBarData({
    super.items,
    super.backgroundColor,
    super.iconSize,
    this.elevation,
    Color? fixedColor,
    super.widgetKey,
    super.itemChanged,
    super.currentIndex,
    super.height,
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
    this.enableFeedback,
    this.landscapeLayout,
    this.useLegacyColorScheme = true,
    this.padding,
    this.surfaceTintColor,
    this.shadowColor,
  }) : super(activeColor: fixedColor);

  final double? selectedFontSize;
  final double? elevation;
  final BottomNavigationBarType? type;
  final Key? bottomNavigationBarKey;
  final NotchedShape? shape;
  final Clip? clipBehavior;
  final double? notchMargin;
  final Color? selectedItemColor;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final double? unselectedFontSize;
  final Color? unselectedItemColor;
  final IconThemeData? selectedIconTheme;
  final TextStyle? selectedLabelStyle;
  final IconThemeData? unselectedIconTheme;
  final TextStyle? unselectedLabelStyle;
  final MouseCursor? mouseCursor;
  final bool? enableFeedback;
  final BottomNavigationBarLandscapeLayout? landscapeLayout;
  final bool useLegacyColorScheme;
  final EdgeInsetsGeometry? padding;
  final Color? surfaceTintColor;
  final Color? shadowColor;
}

class PlatformNavBar extends PlatformWidgetBase<CupertinoTabBar, BottomAppBar> {
  final Key? widgetKey;
  final Color? backgroundColor;

  final List<BottomNavigationBarItem>? items;
  final void Function(int)? itemChanged;
  final int? currentIndex;
  final double? height;

  final PlatformBuilder<MaterialNavBarData>? material;
  final PlatformBuilder<CupertinoTabBarData>? cupertino;

  PlatformNavBar({
    super.key,
    this.widgetKey,
    this.backgroundColor,
    this.items,
    this.itemChanged,
    this.currentIndex,
    this.height,
    this.material,
    this.cupertino,
  });

  @override
  BottomAppBar createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    var bar = BottomNavigationBar(
      items: data?.items ?? items ?? const <BottomNavigationBarItem>[],
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
      enableFeedback: data?.enableFeedback,
      landscapeLayout: data?.landscapeLayout,
      useLegacyColorScheme: data?.useLegacyColorScheme ?? true,
    );

    return BottomAppBar(
      child: bar,
      color: data?.backgroundColor ?? backgroundColor,
      elevation: data?.elevation,
      key: data?.widgetKey ?? widgetKey,
      shape: data?.shape,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      notchMargin: data?.notchMargin ?? 4.0,
      height: data?.height ?? height,
      padding: data?.padding,
      surfaceTintColor: data?.surfaceTintColor,
      shadowColor: data?.shadowColor,
    );
  }

  @override
  CupertinoTabBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoTabBar(
      items: data?.items ?? items ?? const <BottomNavigationBarItem>[],
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
      height: data?.height ?? height ?? _kTabBarHeight,
    );
  }
}

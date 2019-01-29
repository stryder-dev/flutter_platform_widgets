/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show
        CupertinoPageScaffold,
        CupertinoColors,
        CupertinoTabScaffold,
        ObstructingPreferredSizeWidget,
        CupertinoTabBar;
import 'package:flutter/material.dart'
    show Scaffold, FloatingActionButtonAnimator, FloatingActionButtonLocation;
import 'package:flutter/widgets.dart';

import 'platform_app_bar.dart';
import 'platform_nav_bar.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.widgetKey, this.backgroundColor, this.body});

  final Color backgroundColor;
  final Widget body;
  final Key widgetKey;
}

class MaterialScaffoldData extends _BaseData {
  MaterialScaffoldData(
      {Color backgroundColor,
      Widget body,
      Key widgetKey,
      this.appBar,
      this.bottomNavBar,
      this.drawer,
      this.endDrawer,
      this.floatingActionButton,
      this.floatingActionButtonAnimator,
      this.floatingActionButtonLocation,
      this.persistentFooterButtons,
      this.primary = true,
      this.resizeToAvoidBottomPadding = true,
      this.bottomSheet})
      : super(
            widgetKey: widgetKey, backgroundColor: backgroundColor, body: body);

  final PreferredSizeWidget appBar;
  final Widget bottomNavBar;
  final Widget drawer;
  final Widget endDrawer;
  final Widget floatingActionButton;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final List<Widget> persistentFooterButtons;
  final bool primary;
  final bool resizeToAvoidBottomPadding;
  final Widget bottomSheet;
}

class CupertinoPageScaffoldData extends _BaseData {
  CupertinoPageScaffoldData(
      {Color backgroundColor,
      Widget body,
      Key widgetKey,
      this.navigationBar,
      this.bottomTabBar,
      this.resizeToAvoidBottomInset = true})
      : super(
            widgetKey: widgetKey, backgroundColor: backgroundColor, body: body);

  final ObstructingPreferredSizeWidget navigationBar;
  final CupertinoTabBar bottomTabBar;
  final bool resizeToAvoidBottomInset;
}

class PlatformScaffold extends PlatformWidgetBase<Widget, Scaffold> {
  final Key widgetKey;

  final Widget body;
  final Color backgroundColor;
  final PlatformAppBar appBar;
  final PlatformNavBar bottomNavBar;

  final PlatformBuilder<MaterialScaffoldData> android;
  final PlatformBuilder<CupertinoPageScaffoldData> ios;

  final bool iosContentPadding;
  final bool iosContentBottomPadding;

  PlatformScaffold({
    Key key,
    this.widgetKey,
    this.body,
    this.backgroundColor,
    this.appBar,
    this.bottomNavBar,
    this.android,
    this.ios,
    this.iosContentPadding = false,
    this.iosContentBottomPadding = false,
  }) : super(key: key);

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    MaterialScaffoldData data;
    if (android != null) {
      data = android(context);
    }

    return Scaffold(
      key: data?.widgetKey ?? widgetKey,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      body: data?.body ?? body,
      appBar: data?.appBar ?? appBar?.createAndroidWidget(context),
      bottomNavigationBar:
          data?.bottomNavBar ?? bottomNavBar?.createAndroidWidget(context),
      drawer: data?.drawer,
      endDrawer: data?.endDrawer,
      floatingActionButton: data?.floatingActionButton,
      floatingActionButtonAnimator: data?.floatingActionButtonAnimator,
      floatingActionButtonLocation: data?.floatingActionButtonLocation,
      persistentFooterButtons: data?.persistentFooterButtons,
      primary: data?.primary ?? true,
      resizeToAvoidBottomPadding: data?.resizeToAvoidBottomPadding ?? true,
      bottomSheet: data?.bottomSheet,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    CupertinoPageScaffoldData data;
    if (ios != null) {
      data = ios(context);
    }

    Widget child = body ?? data?.body;
    var navigationBar = appBar?.createIosWidget(context) ?? data?.navigationBar;

    if (bottomNavBar != null) {
      var tabBar = data?.bottomTabBar ?? bottomNavBar?.createIosWidget(context);

      //https://docs.flutter.io/flutter/cupertino/CupertinoTabScaffold-class.html
      return CupertinoTabScaffold(
        key: data?.widgetKey ?? widgetKey,
        tabBar: tabBar,
        tabBuilder: (BuildContext context, int index) {
          return CupertinoPageScaffold(
              backgroundColor: data?.backgroundColor ??
                  backgroundColor ??
                  CupertinoColors.white,
              child: iosContentPad(context, child, navigationBar, tabBar),
              navigationBar: navigationBar,
              resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true);
        },
      );
    } else {
      return CupertinoPageScaffold(
          key: data?.widgetKey ?? widgetKey,
          backgroundColor:
              data?.backgroundColor ?? backgroundColor ?? CupertinoColors.white,
          child: iosContentPad(context, child, navigationBar, null),
          navigationBar: navigationBar,
          resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true);
    }
  }

  Widget iosContentPad(BuildContext context, Widget child,
      ObstructingPreferredSizeWidget navigationBar, CupertinoTabBar tabBar) {
    if (!iosContentPadding && !iosContentBottomPadding) {
      return child;
    }

    double top = 0;
    double bottom = 0;

    final MediaQueryData existingMediaQuery = MediaQuery.of(context);

    if (iosContentPadding && navigationBar != null) {
      final double topPadding =
          navigationBar.preferredSize.height + existingMediaQuery.padding.top;

      top = navigationBar.fullObstruction ? 0.0 : topPadding;
    }

    if (iosContentBottomPadding && tabBar != null) {
      bottom = existingMediaQuery.padding.bottom;
    }

    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: child,
    );
  }
}

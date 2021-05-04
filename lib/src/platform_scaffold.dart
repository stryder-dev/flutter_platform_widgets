/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show
        CupertinoPageScaffold,
        CupertinoTabBar,
        CupertinoTabController,
        CupertinoTabScaffold,
        ObstructingPreferredSizeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    show
        DrawerCallback,
        FloatingActionButtonAnimator,
        FloatingActionButtonLocation,
        Material,
        Scaffold;
import 'package:flutter/widgets.dart';

import 'extensions.dart';
import 'platform.dart';
import 'platform_app_bar.dart';
import 'platform_nav_bar.dart';
import 'platform_provider.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.backgroundColor,
    this.body,
  });

  final Color? backgroundColor;
  final Widget? body;
  final Key? widgetKey;
}

class MaterialScaffoldData extends _BaseData {
  MaterialScaffoldData({
    Color? backgroundColor,
    Widget? body,
    Key? widgetKey,
    this.appBar,
    this.bottomNavBar,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.persistentFooterButtons,
    this.primary,
    this.bottomSheet,
    this.drawerDragStartBehavior,
    this.extendBody,
    this.resizeToAvoidBottomInset,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.extendBodyBehindAppBar,
    this.drawerEnableOpenDragGesture,
    this.endDrawerEnableOpenDragGesture,
    this.restorationId,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
  }) : super(
          widgetKey: widgetKey,
          backgroundColor: backgroundColor,
          body: body,
        );

  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget>? persistentFooterButtons;
  final bool? primary;
  final Widget? bottomSheet;
  final DragStartBehavior? drawerDragStartBehavior;
  final bool? extendBody;
  final bool? resizeToAvoidBottomInset;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool? extendBodyBehindAppBar;
  final bool? drawerEnableOpenDragGesture;
  final bool? endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final DrawerCallback? onDrawerChanged;
  final DrawerCallback? onEndDrawerChanged;
}

class CupertinoPageScaffoldData extends _BaseData {
  CupertinoPageScaffoldData({
    Color? backgroundColor,
    Widget? body,
    Key? widgetKey,
    this.navigationBar,
    this.bottomTabBar,
    this.resizeToAvoidBottomInset,
    this.resizeToAvoidBottomInsetTab,
    this.backgroundColorTab,
    this.restorationIdTab,
    this.controller,
  }) : super(
          widgetKey: widgetKey,
          backgroundColor: backgroundColor,
          body: body,
        );

  final ObstructingPreferredSizeWidget? navigationBar;
  final CupertinoTabBar? bottomTabBar;
  final bool? resizeToAvoidBottomInset;
  final bool? resizeToAvoidBottomInsetTab;
  final Color? backgroundColorTab;
  final CupertinoTabController? controller;
  final String? restorationIdTab;
}

class PlatformScaffold extends PlatformWidgetBase<Widget, Scaffold> {
  final Key? widgetKey;

  final Widget? body;
  final Color? backgroundColor;
  final PlatformAppBar? appBar;
  final PlatformNavBar? bottomNavBar;
  final IndexedWidgetBuilder? cupertinoTabChildBuilder;

  final PlatformBuilder<MaterialScaffoldData>? material;
  final PlatformBuilder<CupertinoPageScaffoldData>? cupertino;

  final bool iosContentPadding;
  final bool iosContentBottomPadding;

  PlatformScaffold({
    Key? key,
    this.widgetKey,
    this.body,
    this.backgroundColor,
    this.appBar,
    this.bottomNavBar,
    this.iosContentPadding = false,
    this.iosContentBottomPadding = false,
    this.material,
    this.cupertino,
    this.cupertinoTabChildBuilder,
  }) : super(key: key);

  @override
  Scaffold createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return Scaffold(
      key: data?.widgetKey ?? widgetKey,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      body: data?.body ?? body,
      appBar: data?.appBar ?? appBar?.createMaterialWidget(context),
      bottomNavigationBar:
          data?.bottomNavBar ?? bottomNavBar?.createMaterialWidget(context),
      drawer: data?.drawer,
      endDrawer: data?.endDrawer,
      floatingActionButton: data?.floatingActionButton,
      floatingActionButtonAnimator: data?.floatingActionButtonAnimator,
      floatingActionButtonLocation: data?.floatingActionButtonLocation,
      persistentFooterButtons: data?.persistentFooterButtons,
      primary: data?.primary ?? true,
      bottomSheet: data?.bottomSheet,
      drawerDragStartBehavior:
          data?.drawerDragStartBehavior ?? DragStartBehavior.start,
      extendBody: data?.extendBody ?? false,
      resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset,
      drawerScrimColor: data?.drawerScrimColor,
      drawerEdgeDragWidth: data?.drawerEdgeDragWidth,
      extendBodyBehindAppBar: data?.extendBodyBehindAppBar ?? false,
      drawerEnableOpenDragGesture: data?.drawerEnableOpenDragGesture ?? true,
      endDrawerEnableOpenDragGesture:
          data?.endDrawerEnableOpenDragGesture ?? true,
      onDrawerChanged: data?.onDrawerChanged,
      onEndDrawerChanged: data?.onEndDrawerChanged,
      restorationId: data?.restorationId,
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    var navigationBar =
        data?.navigationBar ?? appBar?.createCupertinoWidget(context);

    final providerState = PlatformProvider.of(context);
    final useLegacyMaterial =
        providerState?.settings.legacyIosUsesMaterialWidgets ?? false;
    final useMaterial = providerState?.settings.iosUsesMaterialWidgets ?? false;

    Widget result;
    if (bottomNavBar != null) {
      var tabBar =
          data?.bottomTabBar ?? bottomNavBar?.createCupertinoWidget(context);

      //https://docs.flutter.io/flutter/cupertino/CupertinoTabScaffold-class.html
      result = CupertinoTabScaffold(
        key: data?.widgetKey ?? widgetKey,
        backgroundColor: data?.backgroundColorTab,
        resizeToAvoidBottomInset: data?.resizeToAvoidBottomInsetTab ?? true,
        tabBar: tabBar!,
        controller: data?.controller,
        tabBuilder: (BuildContext context, int index) {
          var currentChild = cupertinoTabChildBuilder?.call(context, index) ??
              data?.body ??
              body ??
              SizedBox.shrink();
          return CupertinoPageScaffold(
            // key
            backgroundColor: data?.backgroundColor ?? backgroundColor,
            child: iosContentPad(
              context,
              currentChild.withMaterial(useMaterial),
              navigationBar,
              tabBar,
            ),
            navigationBar: navigationBar,
            resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
            // key: widgetKey used for CupertinoTabScaffold
          );
        },
        restorationId: data?.restorationIdTab,
      );
    } else {
      final child = data?.body ?? body ?? SizedBox.shrink();

      result = CupertinoPageScaffold(
        key: data?.widgetKey ?? widgetKey,
        backgroundColor: data?.backgroundColor ?? backgroundColor,
        child: iosContentPad(
          context,
          child.withMaterial(useMaterial),
          navigationBar,
          null,
        ),
        navigationBar: navigationBar,
        resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
      );
    }

    // Ensure that there is Material widget at the root page level
    // as there can be Material widgets used on ios
    return result.withMaterial(useLegacyMaterial &&
        context.findAncestorWidgetOfExactType<Material>() == null);
  }

  Widget iosContentPad(BuildContext context, Widget child,
      ObstructingPreferredSizeWidget? navigationBar, CupertinoTabBar? tabBar) {
    final MediaQueryData existingMediaQuery = MediaQuery.of(context);

    if (!iosContentPadding && !iosContentBottomPadding) {
      return child;
    }

    double top = 0;
    double bottom = 0;

    if (iosContentPadding && navigationBar != null) {
      final double topPadding =
          navigationBar.preferredSize.height + existingMediaQuery.padding.top;

      final obstruct = navigationBar.shouldFullyObstruct(context);

      top = obstruct ? 0.0 : topPadding;
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

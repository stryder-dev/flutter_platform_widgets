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
        CupertinoTabView,
        ObstructingPreferredSizeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    show
        FloatingActionButtonAnimator,
        FloatingActionButtonLocation,
        Material,
        Scaffold;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_app_bar.dart';
import 'platform_nav_bar.dart';
import 'platform_provider.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.widgetKey, this.backgroundColor, this.body});

  final Color backgroundColor;
  final Widget body;
  final Key widgetKey;
}

class MaterialTabScaffoldData extends _BaseData {
  MaterialTabScaffoldData({
    Color backgroundColor,
    this.bodyBuilder,
    Key widgetKey,
    this.appBarBuilder,
    this.controller,
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
    this.tabsBackgroundColor,
    this.drawerEnableOpenDragGesture,
    this.endDrawerEnableOpenDragGesture,
  }) : super(widgetKey: widgetKey, backgroundColor: backgroundColor);

  final Widget Function(BuildContext context, int index) bodyBuilder;
  final MaterialTabController controller;
  final PreferredSizeWidget Function(BuildContext context, int index)
      appBarBuilder;
  final Widget drawer;
  final Widget endDrawer;
  final Widget floatingActionButton;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final List<Widget> persistentFooterButtons;
  final bool primary;
  final Widget bottomSheet;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool resizeToAvoidBottomInset;
  final Color drawerScrimColor;
  final double drawerEdgeDragWidth;
  final bool extendBodyBehindAppBar;
  final Color tabsBackgroundColor;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
}

class CupertinoTabViewData {
  CupertinoTabViewData({
    this.defaultTitle,
    this.navigatorKey,
    this.navigatorObservers,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.routes,
  });

  final String defaultTitle;
  final GlobalKey<NavigatorState> navigatorKey;
  final List<NavigatorObserver> navigatorObservers;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final Map<String, WidgetBuilder> routes;
}

class CupertinoTabScaffoldData extends _BaseData {
  CupertinoTabScaffoldData({
    Color backgroundColor,
    Key widgetKey,
    this.items,
    this.bodyBuilder,
    this.appBarBuilder,
    this.tabViewDataBuilder,
    this.useCupertinoTabView = true,
    this.resizeToAvoidBottomInset,
    this.resizeToAvoidBottomInsetTab,
    this.tabsBackgroundColor,
    this.controller,
  }) : super(
          widgetKey: widgetKey,
          backgroundColor: backgroundColor,
        );

  final List<BottomNavigationBarItem> items;

  final CupertinoTabViewData Function(BuildContext context, int index)
      tabViewDataBuilder;

  final Widget Function(BuildContext context, int index) bodyBuilder;
  final ObstructingPreferredSizeWidget Function(BuildContext context, int index)
      appBarBuilder;
  final bool resizeToAvoidBottomInset;
  final bool resizeToAvoidBottomInsetTab;
  final Color tabsBackgroundColor;
  final CupertinoTabController controller;
  final bool useCupertinoTabView;
}

class PlatformTabScaffold extends PlatformWidgetBase<Widget, Widget> {
  final Key widgetKey;

  final Widget Function(BuildContext context, int index) bodyBuilder;
  final Color pageBackgroundColor;
  final Color tabsBackgroundColor;
  final int currentIndex;
  final void Function(int index) itemChanged;

  final PlatformBuilder2<MaterialTabScaffoldData> material;
  final PlatformBuilder2<MaterialNavBarData> materialTabs;
  final PlatformBuilder2<CupertinoTabScaffoldData> cupertino;
  final PlatformBuilder2<CupertinoTabBarData> cupertinoTabs;

  final bool iosContentPadding;
  final bool iosContentBottomPadding;

  final PlatformTabController tabController;

  final List<BottomNavigationBarItem> items;

  final PlatformAppBar Function(BuildContext context, int index) appBarBuilder;

  PlatformTabScaffold({
    Key key,
    this.widgetKey,
    this.items,
    this.bodyBuilder,
    this.pageBackgroundColor,
    this.tabsBackgroundColor,
    this.appBarBuilder,
    this.tabController,
    this.currentIndex,
    this.itemChanged,
    this.iosContentPadding = false,
    this.iosContentBottomPadding = false,
    this.material,
    this.materialTabs,
    this.cupertino,
    this.cupertinoTabs,
  }) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    final controller = data?.controller ?? tabController?._material(context);

    if (controller != null) {
      return AnimatedBuilder(
        animation: controller,
        builder: (context, _) => _buildAndroid(context, data, controller),
      );
    } else {
      return _buildAndroid(context, data, controller);
    }
  }

  Widget _buildAndroid(BuildContext context, MaterialTabScaffoldData data,
      MaterialTabController controller) {
    final platformNavBar = PlatformNavBar(
      items: items,
      backgroundColor: data?.tabsBackgroundColor ?? tabsBackgroundColor,
      currentIndex: controller?.index ?? currentIndex,
      material: materialTabs,
      itemChanged: (int index) {
        controller?.index = index;
        itemChanged?.call(index);
      },
    );
    final tabBar = platformNavBar.createMaterialWidget(context);

    final child = data?.bodyBuilder?.call(context, controller.index) ??
        bodyBuilder?.call(context, controller.index);

    final appBar = data?.appBarBuilder?.call(context, controller.index) ??
        appBarBuilder
            ?.call(context, controller.index)
            ?.createMaterialWidget(context);

    return Scaffold(
      key: data?.widgetKey ?? widgetKey,
      backgroundColor: data?.backgroundColor ?? pageBackgroundColor,
      body: child,
      appBar: appBar,
      bottomNavigationBar: tabBar,
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
      //resizeToAvoidBottomPadding: deprecated,
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    final navBar = PlatformNavBar(
      items: items,
      backgroundColor: tabsBackgroundColor,
      currentIndex: currentIndex,
      itemChanged: itemChanged,
      cupertino: cupertinoTabs,
    );
    final tabBar = navBar.createCupertinoWidget(context);

    final result = CupertinoTabScaffold(
      key: widgetKey,
      tabBar: tabBar,
      controller: data?.controller ?? tabController?._cupertino(context),
      backgroundColor: data?.tabsBackgroundColor,
      resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
      tabBuilder: (context, index) {
        if (data == null || data.useCupertinoTabView) {
          return CupertinoTabView(
            // key
            defaultTitle:
                data?.tabViewDataBuilder(context, index)?.defaultTitle,
            navigatorKey:
                data?.tabViewDataBuilder(context, index)?.navigatorKey,
            navigatorObservers:
                data?.tabViewDataBuilder(context, index)?.navigatorObservers ??
                    const <NavigatorObserver>[],
            onGenerateRoute:
                data?.tabViewDataBuilder(context, index)?.onGenerateRoute,
            onUnknownRoute:
                data?.tabViewDataBuilder(context, index)?.onUnknownRoute,
            routes: data?.tabViewDataBuilder(context, index)?.routes,
            builder: (context) {
              return _buildCupertinoPageScaffold(context, index, data, tabBar);
            },
          );
        }

        return _buildCupertinoPageScaffold(context, index, data, tabBar);
      },
    );

    final providerState = PlatformProvider.of(context);
    final useMaterial =
        providerState?.settings?.iosUsesMaterialWidgets ?? false;

    if (useMaterial) {
      // Ensure that there is Material widget at the root page level
      // as there can be Material widgets used on ios
      final materialWidget = context.findAncestorWidgetOfExactType<Material>();
      if (materialWidget == null) {
        return Material(
          elevation: 0.0,
          child: result,
        );
      }
    }

    return result;
  }

  CupertinoPageScaffold _buildCupertinoPageScaffold(
    BuildContext context,
    int index,
    CupertinoTabScaffoldData data,
    CupertinoTabBar tabBar,
  ) {
    final appBar = data?.appBarBuilder?.call(context, index) ??
        appBarBuilder?.call(context, index)?.createCupertinoWidget(context);

    final child = data?.bodyBuilder?.call(context, index) ??
        bodyBuilder?.call(context, index);
    return CupertinoPageScaffold(
      //key
      navigationBar: appBar,
      child: iosContentPad(context, child, appBar, tabBar),
      backgroundColor: data?.backgroundColor ?? pageBackgroundColor,
      resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
    );
  }

  Widget iosContentPad(BuildContext context, Widget child,
      ObstructingPreferredSizeWidget navigationBar, CupertinoTabBar tabBar) {
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

class MaterialTabControllerData {
  MaterialTabControllerData({
    this.initialIndex,
  });

  final int initialIndex;
}

class CupertinoTabControllerData {
  CupertinoTabControllerData({
    this.initialIndex,
  });

  final int initialIndex;
}

class MaterialTabController extends ChangeNotifier {
  MaterialTabController({int initialIndex = 0})
      : _index = initialIndex,
        assert(initialIndex != null),
        assert(initialIndex >= 0);

  int get index => _index;
  int _index;
  set index(int value) {
    assert(value != null);
    assert(value >= 0);
    if (_index == value) {
      return;
    }
    _index = value;
    notifyListeners();
  }
}

// In the same file so that the private android or ios controllers can be accessed
class PlatformTabController extends ChangeNotifier {
  MaterialTabController _materialController;
  CupertinoTabController _cupertinoController;

  final MaterialTabControllerData android;
  final CupertinoTabControllerData ios;

  final int _initialIndex;

  PlatformTabController({
    int initialIndex = 0,
    this.android,
    this.ios,
  })  : _initialIndex = initialIndex,
        assert(initialIndex != null),
        assert(initialIndex >= 0);

  CupertinoTabController _cupertino(BuildContext context) {
    _init(context);
    return _cupertinoController;
  }

  MaterialTabController _material(BuildContext context) {
    _init(context);
    return _materialController;
  }

  int index(BuildContext context) {
    _init(context);

    return _materialController?.index ?? _cupertinoController.index;
  }

  void setIndex(BuildContext context, int index) {
    assert(context != null);
    assert(index >= 0);

    _init(context);

    if (_materialController != null) {
      _materialController.index = index;
    } else if (_cupertinoController != null) {
      _cupertinoController.index = index;
    }
  }

  void _init(BuildContext context) {
    if (isMaterial(context)) {
      if (_materialController == null) {
        int useIndex = android?.initialIndex ?? _initialIndex;
        if (_cupertinoController != null) {
          useIndex = _cupertinoController.index;

          _cupertinoController.removeListener(_listener);
          _cupertinoController.dispose();
          _cupertinoController = null;
        }
        _materialController = MaterialTabController(
          initialIndex: useIndex,
        );
      }
    }
    if (isCupertino(context)) {
      if (_cupertinoController == null) {
        int useIndex = ios?.initialIndex ?? _initialIndex;
        if (_materialController != null) {
          useIndex = _materialController.index;

          _materialController.removeListener(_listener);
          _materialController.dispose();
          _materialController = null;
        }

        _cupertinoController = CupertinoTabController(
          initialIndex: useIndex,
        );
      }
    }
  }

  void _listener() {
    notifyListeners();
  }

  @override
  void dispose() {
    _materialController?.removeListener(_listener);
    _materialController?.dispose();
    _materialController = null;
    _cupertinoController?.removeListener(_listener);
    _cupertinoController?.dispose();
    _cupertinoController = null;
    super.dispose();
  }
}

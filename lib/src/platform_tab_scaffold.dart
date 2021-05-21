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

class MaterialTabScaffoldData extends _BaseData {
  MaterialTabScaffoldData({
    Color? backgroundColor,
    this.bodyBuilder,
    Key? widgetKey,
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
    this.restorationId,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
  }) : super(widgetKey: widgetKey, backgroundColor: backgroundColor);

  final Widget Function(BuildContext context, int index)? bodyBuilder;
  final MaterialTabController? controller;
  final PreferredSizeWidget? Function(BuildContext context, int index)?
      appBarBuilder;
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
  final Color? tabsBackgroundColor;
  final bool? drawerEnableOpenDragGesture;
  final bool? endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final DrawerCallback? onDrawerChanged;
  final DrawerCallback? onEndDrawerChanged;
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

  final String? defaultTitle;
  final GlobalKey<NavigatorState>? navigatorKey;
  final List<NavigatorObserver>? navigatorObservers;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final Map<String, WidgetBuilder>? routes;
}

class CupertinoTabScaffoldData extends _BaseData {
  CupertinoTabScaffoldData({
    Color? backgroundColor,
    Key? widgetKey,
    this.items,
    this.bodyBuilder,
    this.appBarBuilder,
    this.tabViewDataBuilder,
    this.useCupertinoTabView = true,
    this.resizeToAvoidBottomInset,
    this.resizeToAvoidBottomInsetTab,
    this.tabsBackgroundColor,
    this.controller,
    this.restorationId,
    this.restorationScopeIdTabView,
  }) : super(
          widgetKey: widgetKey,
          backgroundColor: backgroundColor,
        );

  final List<BottomNavigationBarItem>? items;

  final CupertinoTabViewData Function(BuildContext context, int index)?
      tabViewDataBuilder;

  final Widget Function(BuildContext context, int index)? bodyBuilder;
  final ObstructingPreferredSizeWidget? Function(
      BuildContext context, int index)? appBarBuilder;
  final bool? resizeToAvoidBottomInset;
  final bool? resizeToAvoidBottomInsetTab;
  final Color? tabsBackgroundColor;
  final CupertinoTabController? controller;
  final bool? useCupertinoTabView;
  final String? restorationId;
  final String? restorationScopeIdTabView;
}

class PlatformTabScaffold extends PlatformWidgetBase<Widget, Widget> {
  final Key? widgetKey;

  final Widget Function(BuildContext context, int index)? bodyBuilder;
  final Color? pageBackgroundColor;
  final Color? tabsBackgroundColor;
  final void Function(int index)? itemChanged;

  final PlatformBuilder<MaterialTabScaffoldData>? material;
  final PlatformIndexBuilder<MaterialTabScaffoldData>? materialBuilder;

  final PlatformBuilder<MaterialNavBarData>? materialTabs;

  final PlatformBuilder<CupertinoTabScaffoldData>? cupertino;
  final PlatformIndexBuilder<CupertinoTabScaffoldData>? cupertinoBuilder;

  final PlatformBuilder<CupertinoTabBarData>? cupertinoTabs;

  final bool iosContentPadding;
  final bool iosContentBottomPadding;

  final PlatformTabController? tabController;

  final List<BottomNavigationBarItem>? items;

  final PlatformAppBar? Function(BuildContext context, int index)?
      appBarBuilder;

  final String? restorationId;

  PlatformTabScaffold({
    Key? key,
    this.widgetKey,
    this.items,
    this.bodyBuilder,
    this.pageBackgroundColor,
    this.tabsBackgroundColor,
    this.appBarBuilder,
    this.tabController,
    this.itemChanged,
    this.iosContentPadding = false,
    this.iosContentBottomPadding = false,
    this.restorationId,
    this.material,
    this.materialBuilder,
    this.materialTabs,
    this.cupertino,
    this.cupertinoBuilder,
    this.cupertinoTabs,
  })  : assert(
          (material != null && materialBuilder == null) || material == null,
        ),
        assert(
          (material == null && materialBuilder != null) ||
              materialBuilder == null,
        ),
        assert(
          (cupertino != null && cupertinoBuilder == null) || cupertino == null,
        ),
        assert(
          (cupertino == null && cupertinoBuilder != null) ||
              cupertinoBuilder == null,
        ),
        super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    final controller = data?.controller ?? tabController?._material(context);

    assert(controller != null, '''MaterialTabController cannot be null. 
    Either have material: (_, __) => MaterialTabScaffoldData(cntroller: controller) or 
    PlatformTabScaffold(tabController: controller) ''');

    return AnimatedBuilder(
      animation: controller!,
      builder: (context, _) => _buildAndroid(
        context,
        materialBuilder?.call(context, platform(context), controller.index) ??
            data,
        controller,
      ),
    );
  }

  Widget _buildAndroid(
    BuildContext context,
    MaterialTabScaffoldData? data,
    MaterialTabController controller,
  ) {
    final platformNavBar = PlatformNavBar(
      items: items,
      backgroundColor: data?.tabsBackgroundColor ?? tabsBackgroundColor,
      currentIndex: controller.index,
      material: materialTabs,
      itemChanged: (int index) {
        controller.index = index;
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
      onDrawerChanged: data?.onDrawerChanged,
      onEndDrawerChanged: data?.onEndDrawerChanged,
      restorationId: data?.restorationId ?? restorationId,
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    final controller = data?.controller ?? tabController?._cupertino(context);

    assert(controller != null, '''CupertinoTabController cannot be null. 
    Either have material: (_, __) => CupertinoTabScaffoldData(cntroller: controller) or 
    PlatformTabScaffold(tabController: controller) ''');

    if (cupertinoBuilder == null) {
      return _buildCupertino(
        context,
        data,
        controller!,
      );
    } else {
      return AnimatedBuilder(
        animation: controller!,
        builder: (context, _) => _buildCupertino(
          context,
          cupertinoBuilder?.call(context, platform(context), controller.index),
          controller,
        ),
      );
    }
  }

  Widget _buildCupertino(
    BuildContext context,
    CupertinoTabScaffoldData? data,
    CupertinoTabController controller,
  ) {
    final navBar = PlatformNavBar(
      items: items,
      backgroundColor: tabsBackgroundColor,
      currentIndex: controller.index,
      itemChanged: itemChanged,
      cupertino: cupertinoTabs,
      // key: Not used ignore
      // widgetKey: Not used ignore
      // material: Not used ignore
    );
    final tabBar = navBar.createCupertinoWidget(context);

    final providerState = PlatformProvider.of(context);
    final useLegacyMaterial =
        providerState?.settings.legacyIosUsesMaterialWidgets ?? false;
    final useMaterial = providerState?.settings.iosUsesMaterialWidgets ?? false;

    final result = CupertinoTabScaffold(
      key: widgetKey,
      tabBar: tabBar,
      controller: controller,
      backgroundColor: data?.tabsBackgroundColor,
      resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
      tabBuilder: (context, index) {
        if (data?.useCupertinoTabView ?? false) {
          return CupertinoTabView(
            // key Not used
            defaultTitle:
                data?.tabViewDataBuilder?.call(context, index).defaultTitle,
            navigatorKey:
                data?.tabViewDataBuilder?.call(context, index).navigatorKey,
            navigatorObservers: data?.tabViewDataBuilder
                    ?.call(context, index)
                    .navigatorObservers ??
                const <NavigatorObserver>[],
            onGenerateRoute:
                data?.tabViewDataBuilder?.call(context, index).onGenerateRoute,
            onUnknownRoute:
                data?.tabViewDataBuilder?.call(context, index).onUnknownRoute,
            routes: data?.tabViewDataBuilder?.call(context, index).routes,
            builder: (context) {
              return _buildCupertinoPageScaffold(
                context,
                index,
                data,
                tabBar,
                useMaterial,
              );
            },
            restorationScopeId: data?.restorationScopeIdTabView,
          );
        }

        return _buildCupertinoPageScaffold(
          context,
          index,
          data,
          tabBar,
          useMaterial,
        );
      },
      restorationId: data?.restorationId ?? restorationId,
    );

    // Ensure that there is Material widget at the root page level
    // as there can be Material widgets used on ios
    return result.withMaterial(useLegacyMaterial &&
        context.findAncestorWidgetOfExactType<Material>() == null);
  }

  CupertinoPageScaffold _buildCupertinoPageScaffold(
    BuildContext context,
    int index,
    CupertinoTabScaffoldData? data,
    CupertinoTabBar tabBar,
    bool useMaterial,
  ) {
    final appBar = data?.appBarBuilder?.call(context, index) ??
        appBarBuilder?.call(context, index)?.createCupertinoWidget(context);

    final child = data?.bodyBuilder?.call(context, index) ??
        bodyBuilder?.call(context, index);

    assert(child != null);

    return CupertinoPageScaffold(
      //key Not used
      navigationBar: appBar,
      child: iosContentPad(
        context,
        child!.withMaterial(useMaterial),
        appBar,
        tabBar,
      ),
      backgroundColor: data?.backgroundColor ?? pageBackgroundColor,
      resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
    );
  }

  Widget iosContentPad(
    BuildContext context,
    Widget child,
    ObstructingPreferredSizeWidget? navigationBar,
    CupertinoTabBar tabBar,
  ) {
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

    if (iosContentBottomPadding) {
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

  final int? initialIndex;
}

class CupertinoTabControllerData {
  CupertinoTabControllerData({
    this.initialIndex,
  });

  final int? initialIndex;
}

class MaterialTabController extends ChangeNotifier {
  MaterialTabController({int initialIndex = 0})
      : _index = initialIndex,
        assert(initialIndex >= 0);

  int get index => _index;
  int _index;
  set index(int value) {
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
  MaterialTabController? _materialController;
  CupertinoTabController? _cupertinoController;

  final MaterialTabControllerData? android;
  final CupertinoTabControllerData? ios;

  final int _initialIndex;

  PlatformTabController({
    int initialIndex = 0,
    this.android,
    this.ios,
  })  : _initialIndex = initialIndex,
        assert(initialIndex >= 0);

  CupertinoTabController? _cupertino(BuildContext context) {
    _init(context);
    return _cupertinoController;
  }

  MaterialTabController? _material(BuildContext context) {
    _init(context);
    return _materialController;
  }

  int index(BuildContext context) {
    _init(context);

    return _materialController?.index ?? _cupertinoController?.index ?? 0;
  }

  void setIndex(BuildContext context, int index) {
    assert(index >= 0);

    _init(context);

    _materialController?.index = index;
    _cupertinoController?.index = index;
  }

  void _init(BuildContext context) {
    if (isMaterial(context)) {
      if (_materialController == null) {
        int useIndex = android?.initialIndex ?? _initialIndex;
        if (_cupertinoController != null) {
          useIndex = _cupertinoController?.index ?? 0;

          _cupertinoController?.removeListener(_listener);
          _cupertinoController?.dispose();
          _cupertinoController = null;
        }
        _materialController = MaterialTabController(
          initialIndex: useIndex,
        )..addListener(_listener);
      }
    }
    if (isCupertino(context)) {
      if (_cupertinoController == null) {
        int useIndex = ios?.initialIndex ?? _initialIndex;
        if (_materialController != null) {
          useIndex = _materialController?.index ?? 0;

          _materialController?.removeListener(_listener);
          _materialController?.dispose();
          _materialController = null;
        }

        _cupertinoController = CupertinoTabController(
          initialIndex: useIndex,
        )..addListener(_listener);
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

/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoApp, CupertinoThemeData;
import 'package:flutter/material.dart'
    show
        MaterialApp,
        ScaffoldMessengerState,
        Theme,
        ThemeData,
        ThemeMode,
        kThemeAnimationDuration;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    // ignore: unused_element
    this.highContrastDarkTheme,
    // ignore: unused_element
    this.highContrastTheme,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery,
  });

  final Key? widgetKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final bool? useInheritedMediaQuery;
}

abstract class _BaseRouterData {
  _BaseRouterData({
    this.widgetKey,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    // ignore: unused_element
    this.highContrastDarkTheme,
    // ignore: unused_element
    this.highContrastTheme,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    // ignore: unused_element
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery,
  });

  final Key? widgetKey;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  final String? restorationScopeId;

  final ScrollBehavior? scrollBehavior;

  final bool? useInheritedMediaQuery;
}

class MaterialAppData extends _BaseData {
  MaterialAppData({
    super.widgetKey,
    super.navigatorKey,
    super.home,
    super.routes,
    super.initialRoute,
    super.onGenerateRoute,
    super.onUnknownRoute,
    super.navigatorObservers,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.restorationScopeId,
    super.scrollBehavior,
    super.useInheritedMediaQuery,
    this.theme,
    this.debugShowMaterialGrid,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
    this.themeAnimationCurve = Curves.linear,
    this.themeAnimationDuration = kThemeAnimationDuration,
  });

  final ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Curve themeAnimationCurve;
  final Duration themeAnimationDuration;
}

class MaterialAppRouterData extends _BaseRouterData {
  MaterialAppRouterData({
    super.widgetKey,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.scrollBehavior,
    super.useInheritedMediaQuery,
    this.theme,
    this.debugShowMaterialGrid,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
    this.themeAnimationCurve = Curves.linear,
    this.themeAnimationDuration = kThemeAnimationDuration,
  });

  final ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Curve themeAnimationCurve;
  final Duration themeAnimationDuration;
}

class CupertinoAppData extends _BaseData {
  CupertinoAppData({
    super.widgetKey,
    super.navigatorKey,
    super.home,
    super.routes,
    super.initialRoute,
    super.onGenerateRoute,
    super.onUnknownRoute,
    super.navigatorObservers,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.scrollBehavior,
    super.useInheritedMediaQuery,
    this.theme,
  });

  final CupertinoThemeData? theme;
}

class CupertinoAppRouterData extends _BaseRouterData {
  CupertinoAppRouterData({
    super.widgetKey,
    super.builder,
    super.title,
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.shortcuts,
    super.actions,
    super.onGenerateInitialRoutes,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.routeInformationProvider,
    super.routeInformationParser,
    super.routerDelegate,
    super.routerConfig,
    super.backButtonDispatcher,
    super.scrollBehavior,
    super.useInheritedMediaQuery,
    this.theme,
  });

  final CupertinoThemeData? theme;
}

class PlatformApp extends PlatformWidgetBase<CupertinoApp, MaterialApp> {
  final Key? widgetKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;

  final PlatformBuilder<MaterialAppData>? material;
  final PlatformBuilder<CupertinoAppData>? cupertino;
  final PlatformBuilder<MaterialAppRouterData>? materialRouter;
  final PlatformBuilder<CupertinoAppRouterData>? cupertinoRouter;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  final String? restorationScopeId;

  final ScrollBehavior? scrollBehavior;

  final bool? useInheritedMediaQuery;

  const PlatformApp({
    super.key,
    this.widgetKey,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery,
    this.material,
    this.cupertino,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        routerConfig = null,
        backButtonDispatcher = null,
        materialRouter = null,
        cupertinoRouter = null;

  const PlatformApp.router({
    super.key,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.widgetKey,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery,
    PlatformBuilder<MaterialAppRouterData>? material,
    PlatformBuilder<CupertinoAppRouterData>? cupertino,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        material = null,
        cupertino = null,
        materialRouter = material,
        cupertinoRouter = cupertino;

  @override
  createMaterialWidget(BuildContext context) {
    final dataRouter = materialRouter?.call(context, platform(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null ||
        routerConfig != null ||
        dataRouter?.routerConfig != null) {
      assert(dataRouter?.routerDelegate != null ||
          routerDelegate != null ||
          dataRouter?.routerConfig != null ||
          routerConfig != null);

      return MaterialApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate,
        routerConfig: dataRouter?.routerConfig ?? routerConfig,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        theme: (dataRouter?.theme ?? Theme.of(context))
            .copyWith(platform: TargetPlatform.android),
        darkTheme:
            dataRouter?.darkTheme?.copyWith(platform: TargetPlatform.android),
        highContrastDarkTheme: dataRouter?.highContrastDarkTheme,
        highContrastTheme: dataRouter?.highContrastTheme,
        themeMode: dataRouter?.themeMode ?? ThemeMode.system,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        debugShowMaterialGrid: dataRouter?.debugShowMaterialGrid ?? false,
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.widgetKey ?? widgetKey,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scaffoldMessengerKey: dataRouter?.scaffoldMessengerKey,
        scrollBehavior: dataRouter?.scrollBehavior ?? scrollBehavior,
        useInheritedMediaQuery: dataRouter?.useInheritedMediaQuery ??
            useInheritedMediaQuery ??
            false,
        themeAnimationCurve: dataRouter?.themeAnimationCurve ?? Curves.linear,
        themeAnimationDuration:
            dataRouter?.themeAnimationDuration ?? kThemeAnimationDuration,
      );
    } else {
      final data = material?.call(context, platform(context));
      return MaterialApp(
        key: data?.widgetKey ?? widgetKey,
        navigatorKey: data?.navigatorKey ?? navigatorKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        theme: (data?.theme ?? Theme.of(context))
            .copyWith(platform: TargetPlatform.android),
        debugShowMaterialGrid: data?.debugShowMaterialGrid ?? false,
        darkTheme: data?.darkTheme?.copyWith(platform: TargetPlatform.android),
        themeMode: data?.themeMode ?? ThemeMode.system,
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        highContrastDarkTheme: data?.highContrastDarkTheme,
        highContrastTheme: data?.highContrastTheme,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scaffoldMessengerKey: data?.scaffoldMessengerKey,
        scrollBehavior: data?.scrollBehavior ?? scrollBehavior,
        useInheritedMediaQuery:
            data?.useInheritedMediaQuery ?? useInheritedMediaQuery ?? false,
        themeAnimationCurve: data?.themeAnimationCurve ?? Curves.linear,
        themeAnimationDuration:
            data?.themeAnimationDuration ?? kThemeAnimationDuration,
      );
    }
  }

  @override
  createCupertinoWidget(BuildContext context) {
    final dataRouter = cupertinoRouter?.call(context, platform(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null ||
        routerConfig != null ||
        dataRouter?.routerConfig != null) {
      assert(dataRouter?.routerDelegate != null ||
          routerDelegate != null ||
          dataRouter?.routerConfig != null ||
          routerConfig != null);

      return CupertinoApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate,
        routerConfig: dataRouter?.routerConfig ?? routerConfig,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        theme: dataRouter?.theme,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.widgetKey ?? widgetKey,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: dataRouter?.scrollBehavior ?? scrollBehavior,
        useInheritedMediaQuery: dataRouter?.useInheritedMediaQuery ??
            useInheritedMediaQuery ??
            false,
      );
    } else {
      final data = cupertino?.call(context, platform(context));
      return CupertinoApp(
        key: data?.widgetKey ?? widgetKey,
        navigatorKey: data?.navigatorKey ?? navigatorKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        theme: data?.theme,
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: data?.scrollBehavior ?? scrollBehavior,
        useInheritedMediaQuery:
            data?.useInheritedMediaQuery ?? useInheritedMediaQuery ?? false,
      );
    }
  }
}

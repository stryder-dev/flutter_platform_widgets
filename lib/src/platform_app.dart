/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoApp, CupertinoThemeData;
import 'package:flutter/material.dart'
    show MaterialApp, Theme, ThemeData, ThemeMode;
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
    this.highContrastDarkTheme,
    this.highContrastTheme,
  });

  final Key widgetKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Color color;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent> shortcuts;
  final Map<Type, Action<Intent>> actions;
  final InitialRouteListFactory onGenerateInitialRoutes;
  final ThemeData highContrastDarkTheme;
  final ThemeData highContrastTheme;
}

class MaterialAppData extends _BaseData {
  MaterialAppData(
      {Key widgetKey,
      GlobalKey<NavigatorState> navigatorKey,
      Widget home,
      Map<String, WidgetBuilder> routes,
      String initialRoute,
      RouteFactory onGenerateRoute,
      RouteFactory onUnknownRoute,
      List<NavigatorObserver> navigatorObservers,
      TransitionBuilder builder,
      String title,
      GenerateAppTitle onGenerateTitle,
      Color color,
      Locale locale,
      Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
      LocaleListResolutionCallback localeListResolutionCallback,
      LocaleResolutionCallback localeResolutionCallback,
      Iterable<Locale> supportedLocales,
      bool showPerformanceOverlay,
      bool checkerboardRasterCacheImages,
      bool checkerboardOffscreenLayers,
      bool showSemanticsDebugger,
      bool debugShowCheckedModeBanner,
      Map<LogicalKeySet, Intent> shortcuts,
      Map<Type, Action<Intent>> actions,
      InitialRouteListFactory onGenerateInitialRoutes,
      this.theme,
      this.debugShowMaterialGrid,
      this.darkTheme,
      this.themeMode})
      : super(
          widgetKey: widgetKey,
          navigatorKey: navigatorKey,
          home: home,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
        );

  final ThemeData theme;
  final bool debugShowMaterialGrid;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
}

class CupertinoAppData extends _BaseData {
  CupertinoAppData(
      {Key widgetKey,
      GlobalKey<NavigatorState> navigatorKey,
      Widget home,
      Map<String, WidgetBuilder> routes,
      String initialRoute,
      RouteFactory onGenerateRoute,
      RouteFactory onUnknownRoute,
      List<NavigatorObserver> navigatorObservers,
      TransitionBuilder builder,
      String title,
      GenerateAppTitle onGenerateTitle,
      Color color,
      Locale locale,
      Map<LogicalKeySet, Intent> shortcuts,
      Map<Type, Action<Intent>> actions,
      InitialRouteListFactory onGenerateInitialRoutes,
      Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
      LocaleListResolutionCallback localeListResolutionCallback,
      LocaleResolutionCallback localeResolutionCallback,
      Iterable<Locale> supportedLocales,
      bool showPerformanceOverlay,
      bool checkerboardRasterCacheImages,
      bool checkerboardOffscreenLayers,
      bool showSemanticsDebugger,
      bool debugShowCheckedModeBanner,
      this.theme})
      : super(
          widgetKey: widgetKey,
          navigatorKey: navigatorKey,
          home: home,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
        );

  final CupertinoThemeData theme;
}

class PlatformApp extends PlatformWidgetBase<CupertinoApp, MaterialApp> {
  final Key widgetKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Color color;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent> shortcuts;
  final Map<Type, Action<Intent>> actions;
  final InitialRouteListFactory onGenerateInitialRoutes;

  final PlatformBuilder2<MaterialAppData> material;
  final PlatformBuilder2<CupertinoAppData> cupertino;

  PlatformApp({
    Key key,
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
    this.material,
    this.cupertino,
  }) : super(key: key);

  @override
  createMaterialWidget(BuildContext context) {
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
    );
  }

  @override
  createCupertinoWidget(BuildContext context) {
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
    );
  }
}

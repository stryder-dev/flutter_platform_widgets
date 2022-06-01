/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart'
    show PageRoute, BuildContext, RouteSettings, WidgetBuilder;

import 'platform.dart';
import 'platform_provider.dart';
import 'widget_base.dart';

class PageRouteData {
  final WidgetBuilder? builder;
  final RouteSettings? settings;
  final bool? maintainState;
  final bool? fullscreenDialog;

  PageRouteData({
    this.builder,
    this.settings,
    this.maintainState,
    this.fullscreenDialog,
  });
}

class MaterialPageRouteData extends PageRouteData {
  MaterialPageRouteData({
    super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });
}

class CupertinoPageRouteData extends PageRouteData {
  CupertinoPageRouteData({
    super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });
}

PageRoute<T> platformPageRoute<T>({
  required BuildContext context,
  WidgetBuilder? builder,
  RouteSettings? settings,
  bool? maintainState,
  bool? fullscreenDialog,
  String? iosTitle,
  PlatformBuilder<MaterialPageRouteData>? material,
  PlatformBuilder<CupertinoPageRouteData>? cupertino,
  PlatformBuilder? customData,
  PageRoute<T> Function<T>(BuildContext, PageRouteData, Object?)?
      customPageRoute,
}) {
  final pageRoute = PageRouteData(
    builder: builder,
    settings: settings,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
  );

  if (isMaterial(context)) {
    return _materialPageRoute<T>(context, material, pageRoute);
  } else if (isCupertino(context)) {
    return _cupertinoPageRoute(context, cupertino, pageRoute, iosTitle);
  } else if (isCustom(context)) {
    final provider = PlatformProvider.of(context);
    final currentPlatform = platform(context);

    if (customPageRoute != null) {
      return customPageRoute(
        context,
        pageRoute,
        customData?.call(context, currentPlatform),
      );
    }

    final platformBuilder = provider?.customWidgetBuilders?[currentPlatform];

    final builder = platformBuilder?.pageRouteBuilder;
    if (builder != null) {
      return builder(
        context,
        pageRoute,
        customData?.call(context, currentPlatform),
      );
    }
  }

  if (isMaterialFallback(context)) {
    return _materialPageRoute<T>(context, material, pageRoute);
  } else if (isCupertinoFallback(context)) {
    return _cupertinoPageRoute(context, cupertino, pageRoute, iosTitle);
  }

  throw UnsupportedError(
      'This platform is not supported: $defaultTargetPlatform');
}

PageRoute<T> _materialPageRoute<T>(
  BuildContext context,
  PlatformBuilder<MaterialPageRouteData>? material,
  PageRouteData pageRoute,
) {
  final data = material?.call(context, platform(context));

  return MaterialPageRoute<T>(
    builder: data?.builder ?? pageRoute.builder!,
    settings: data?.settings ?? pageRoute.settings,
    maintainState: data?.maintainState ?? pageRoute.maintainState ?? true,
    fullscreenDialog:
        data?.fullscreenDialog ?? pageRoute.fullscreenDialog ?? false,
  );
}

PageRoute<T> _cupertinoPageRoute<T>(
  BuildContext context,
  PlatformBuilder<CupertinoPageRouteData>? cupertino,
  PageRouteData pageRoute,
  String? iosTitle,
) {
  final data = cupertino?.call(context, platform(context));

  return CupertinoPageRoute<T>(
    builder: data?.builder ?? pageRoute.builder!,
    settings: data?.settings ?? pageRoute.settings,
    maintainState: data?.maintainState ?? pageRoute.maintainState ?? true,
    fullscreenDialog:
        data?.fullscreenDialog ?? pageRoute.fullscreenDialog ?? false,
    title: iosTitle,
  );
}

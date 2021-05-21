/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart'
    show PageRoute, BuildContext, RouteSettings, WidgetBuilder;

import 'platform.dart';
import 'widget_base.dart';

class _BasePageRouteData {
  final WidgetBuilder? builder;
  final RouteSettings? settings;
  final bool? maintainState;
  final bool? fullscreenDialog;

  _BasePageRouteData(
    this.builder,
    this.settings,
    this.maintainState,
    this.fullscreenDialog,
  );
}

class MaterialPageRouteData extends _BasePageRouteData {
  MaterialPageRouteData(
    WidgetBuilder? builder,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
  ) : super(
          builder,
          settings,
          maintainState,
          fullscreenDialog,
        );
}

class CupertinoPageRouteData extends _BasePageRouteData {
  CupertinoPageRouteData(
    WidgetBuilder? builder,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
  ) : super(
          builder,
          settings,
          maintainState,
          fullscreenDialog,
        );
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
}) {
  if (isMaterial(context)) {
    final data = material?.call(context, platform(context));

    return MaterialPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
    );
  } else {
    final data = cupertino?.call(context, platform(context));

    return CupertinoPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      title: iosTitle,
    );
  }
}

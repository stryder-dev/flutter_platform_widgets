/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart'
    show PageRoute, BuildContext, RouteSettings, WidgetBuilder;
import 'package:flutter_platform_widgets/src/extensions/build_context.dart';

import 'platform.dart';
import 'widget_base.dart';

class _BasePageRouteData {
  final WidgetBuilder? builder;
  final RouteSettings? settings;
  final bool? maintainState;
  final bool? fullscreenDialog;
  final bool? allowSnapshotting;

  _BasePageRouteData({
    this.builder,
    this.settings,
    this.maintainState,
    this.fullscreenDialog,
    this.allowSnapshotting,
  });
}

class MaterialPageRouteData extends _BasePageRouteData {
  MaterialPageRouteData({
    super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
  });
}

class CupertinoPageRouteData extends _BasePageRouteData {
  CupertinoPageRouteData({
    super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
  });
}

PageRoute<T> platformPageRoute<T>({
  required BuildContext context,
  WidgetBuilder? builder,
  RouteSettings? settings,
  bool? maintainState,
  bool? fullscreenDialog,
  String? iosTitle,
  bool allowSnapshotting = true,
  PlatformBuilder<MaterialPageRouteData>? material,
  PlatformBuilder<CupertinoPageRouteData>? cupertino,
}) {
  if (context.isMaterialDesign) {
    final data = material?.call(context, platform(context));

    return MaterialPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else {
    final data = cupertino?.call(context, platform(context));

    return CupertinoPageRoute<T>(
      builder: data?.builder ?? builder!,
      settings: data?.settings ?? settings,
      maintainState: data?.maintainState ?? maintainState ?? true,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      title: iosTitle,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  }
}

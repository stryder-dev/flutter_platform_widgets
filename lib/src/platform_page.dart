/*
 * flutter_platform_widgets
 * Copyright (c) 2021 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoPage;
import 'package:flutter/material.dart' show MaterialPage;
import 'package:flutter/widgets.dart' show BuildContext, Page, Widget, LocalKey;
import 'package:flutter_platform_widgets/src/extensions/build_context.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BasePageData {
  /// The content to be shown in the [Route] created by this page.
  final Widget? child;

  /// {@macro flutter.widgets.ModalRoute.maintainState}
  final bool? maintainState;

  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  final bool? fullscreenDialog;

  /// The key associated with this page.
  ///
  /// This key will be used for comparing pages in [canUpdate].
  final LocalKey? key;

  /// The name of the route (e.g., "/settings").
  ///
  /// If null, the route is anonymous.
  final String? name;

  /// Restoration ID to save and restore the state of the [Route] configured by
  /// this page.
  ///
  /// If no restoration ID is provided, the [Route] will not restore its state.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// The arguments passed to this route.
  ///
  /// May be used when building the route, e.g. in [Navigator.onGenerateRoute].
  final Object? arguments;

  final bool? allowSnapshotting;

  _BasePageData({
    this.child,
    this.name,
    this.maintainState,
    this.fullscreenDialog,
    this.key,
    this.restorationId,
    this.arguments,
    this.allowSnapshotting,
  });
}

class MaterialPageData extends _BasePageData {
  MaterialPageData({
    super.child,
    super.name,
    super.maintainState,
    super.fullscreenDialog,
    super.key,
    super.restorationId,
    super.arguments,
    super.allowSnapshotting,
  });
}

class CupertinoPageData extends _BasePageData {
  CupertinoPageData({
    super.child,
    super.name,
    super.maintainState,
    super.fullscreenDialog,
    super.key,
    super.restorationId,
    super.arguments,
    super.allowSnapshotting,
    this.title,
  });

  /// {@macro flutter.cupertino.CupertinoRouteTransitionMixin.title}
  final String? title;
}

Page platformPage({
  required BuildContext context,
  Widget? child,
  String? title,
  String? name,
  bool? maintainState,
  bool? fullscreenDialog,
  LocalKey? key,
  String? restorationId,
  Object? arguments,
  bool allowSnapshotting = true,
  PlatformBuilder<MaterialPageData>? material,
  PlatformBuilder<CupertinoPageData>? cupertino,
}) {
  if (context.isMaterialDesign) {
    final data = material?.call(context, platform(context));

    return MaterialPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  } else {
    final data = cupertino?.call(context, platform(context));

    return CupertinoPage(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      title: data?.title ?? title,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
    );
  }
}

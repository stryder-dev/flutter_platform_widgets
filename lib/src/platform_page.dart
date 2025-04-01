/*
 * flutter_platform_widgets
 * Copyright (c) 2021 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoPage;
import 'package:flutter/material.dart' show MaterialPage;
import 'package:flutter/widgets.dart'
    show BuildContext, LocalKey, Page, PopInvokedWithResultCallback, Widget;

import 'platform.dart';
import 'widget_base.dart';

void _defaultPopInvokedHandler(bool didPop, Object? result) {}

abstract class _BasePageData<T> {
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

  final bool? canPop;

  final PopInvokedWithResultCallback<T>? onPopInvoked;

  const _BasePageData({
    this.child,
    this.name,
    this.maintainState,
    this.fullscreenDialog,
    this.key,
    this.restorationId,
    this.arguments,
    this.allowSnapshotting,
    this.canPop,
    this.onPopInvoked,
  });
}

class MaterialPageData<T> extends _BasePageData<T> {
  const MaterialPageData({
    super.child,
    super.name,
    super.maintainState,
    super.fullscreenDialog,
    super.key,
    super.restorationId,
    super.arguments,
    super.allowSnapshotting,
    super.canPop,
    super.onPopInvoked,
  });
}

class CupertinoPageData<T> extends _BasePageData<T> {
  const CupertinoPageData({
    super.child,
    super.name,
    super.maintainState,
    super.fullscreenDialog,
    super.key,
    super.restorationId,
    super.arguments,
    super.allowSnapshotting,
    this.title,
    super.canPop,
    super.onPopInvoked,
  });

  /// {@macro flutter.cupertino.CupertinoRouteTransitionMixin.title}
  final String? title;
}

Page platformPage<T>({
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
  bool canPop = true,
  PopInvokedWithResultCallback<T>? onPopInvoked,
  PlatformBuilder<MaterialPageData<T>>? material,
  PlatformBuilder<CupertinoPageData<T>>? cupertino,
}) {
  if (isMaterial(context)) {
    final data = material?.call(context, platform(context));

    return MaterialPage<T>(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
      canPop: data?.canPop ?? canPop,
      onPopInvoked:
          data?.onPopInvoked ?? onPopInvoked ?? _defaultPopInvokedHandler,
    );
  } else {
    final data = cupertino?.call(context, platform(context));

    return CupertinoPage<T>(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      name: data?.name ?? name,
      maintainState: data?.maintainState ?? maintainState ?? true,
      arguments: data?.arguments ?? arguments,
      fullscreenDialog: data?.fullscreenDialog ?? fullscreenDialog ?? false,
      restorationId: data?.restorationId ?? restorationId,
      title: data?.title ?? title,
      allowSnapshotting: data?.allowSnapshotting ?? allowSnapshotting,
      canPop: data?.canPop ?? canPop,
      onPopInvoked:
          data?.onPopInvoked ?? onPopInvoked ?? _defaultPopInvokedHandler,
    );
  }
}

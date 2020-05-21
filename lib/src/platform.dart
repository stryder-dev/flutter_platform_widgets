/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:ui';

import 'package:flutter/cupertino.dart'
    show showCupertinoDialog, showCupertinoModalPopup;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show Theme, showDialog, showModalBottomSheet;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/// Extends on [TargetPlatform] to include web
enum PlatformTarget {
  /// Android: <https://www.android.com/>
  android,

  /// Fuchsia: <https://fuchsia.googlesource.com/>
  fuchsia,

  /// iOS: <https://www.apple.com/ios/>
  iOS,

  /// Linux: <https://www.linux.org>
  linux,

  /// macOS: <https://www.apple.com/macos>
  macOS,

  /// Windows: <https://www.windows.com>
  windows,

  web,
}

PlatformStyle _platformStyle(BuildContext context) {
  final platform = PlatformProvider.of(context)?.platform;

  final platformStyle = PlatformProvider.of(context)?.settings?.platformStyle;

  if (platform == null && kIsWeb) {
    return platformStyle?.web ?? PlatformStyle.Material;
  }

  switch (platform ?? Theme.of(context).platform) {
    case TargetPlatform.android:
      return platformStyle?.android ?? PlatformStyle.Material;
    case TargetPlatform.fuchsia:
      return platformStyle?.fuchsia ?? PlatformStyle.Material;
    case TargetPlatform.iOS:
      return platformStyle?.ios ?? PlatformStyle.Cupertino;
    case TargetPlatform.linux:
      return platformStyle?.linux ?? PlatformStyle.Material;
    case TargetPlatform.macOS:
      return platformStyle?.macos ?? PlatformStyle.Cupertino;
    case TargetPlatform.windows:
      return platformStyle?.windows ?? PlatformStyle.Material;
  }

  return PlatformStyle.Material;
}

bool isMaterial(BuildContext context) {
  return _platformStyle(context) == PlatformStyle.Material;
}

bool isCupertino(BuildContext context) {
  return _platformStyle(context) == PlatformStyle.Cupertino;
}

PlatformTarget platform(BuildContext context) {
  if (kIsWeb) {
    return PlatformTarget.web;
  }

  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
      return PlatformTarget.android;
    case TargetPlatform.fuchsia:
      return PlatformTarget.fuchsia;
    case TargetPlatform.iOS:
      return PlatformTarget.iOS;
    case TargetPlatform.linux:
      return PlatformTarget.linux;
    case TargetPlatform.macOS:
      return PlatformTarget.macOS;
    case TargetPlatform.windows:
      return PlatformTarget.windows;
  }

  return null;
}

Future<T> showPlatformDialog<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  @Deprecated('Use barrierDismissible.') bool androidBarrierDismissible = true,
  bool barrierDismissible,
  RouteSettings routeSettings,
  bool useRootNavigator = true,
  bool materialUseSafeArea = true,
}) {
  if (isMaterial(context)) {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible ?? androidBarrierDismissible,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      useSafeArea: materialUseSafeArea,
    );
  } else {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible ?? false,
    );
  }
}

class MaterialModalSheetData {
  final Color backgroundColor;
  final double elevation;
  final ShapeBorder shape;
  final bool isScrollControlled;
  final bool useRootNavigator;
  final Clip clipBehavior;
  final Color barrierColor;
  final bool enableDrag;
  final bool isDismissible;

  MaterialModalSheetData({
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.isScrollControlled = false,
    this.useRootNavigator = false,
    this.clipBehavior,
    this.barrierColor,
    this.enableDrag = false,
    this.isDismissible = false,
  })  : assert(isScrollControlled != null),
        assert(useRootNavigator != null),
        assert(enableDrag != null),
        assert(isDismissible != null);
}

class CupertinoModalSheetData {
  final ImageFilter imageFilter;
  final bool semanticsDismissible;
  final bool useRootNavigator;

  CupertinoModalSheetData({
    this.imageFilter,
    this.semanticsDismissible,
    this.useRootNavigator = true,
  }) : assert(useRootNavigator != null);
}

/// Displays either the showModalBottomSheet for material
/// or showCupertinoModalPopup for cupertino
Future<T> showPlatformModalSheet<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  @Deprecated('Use material = MaterialModalSheetData(backgroundColor)')
      Color androidBackgroundColor,
  @Deprecated('Use material = MaterialModalSheetData(elevation)')
      double androidElevation,
  @Deprecated('Use material = MaterialModalSheetData(shape)')
      ShapeBorder androidShape,
  @Deprecated('Use material = MaterialModalSheetData(isScrollControlled)')
      bool androidIsScrollControlled = false,
  @Deprecated('Use material = MaterialModalSheetData(useRootNavigator)')
      bool androidUseRootNavigator = false,
  @Deprecated('Use material = MaterialModalSheetData(clipBehavior)')
      Clip androidClipBehavior,
  @Deprecated('Use material = MaterialModalSheetData(barrierColor)')
      Color androidBarrierColor,
  @Deprecated('Use material = MaterialModalSheetData(enableDrag)')
      bool androidEnableDrag = true,
  @Deprecated('Use material = MaterialModalSheetData(isDismissible)')
      bool androidIsDismissible = true,
  MaterialModalSheetData material,
  @Deprecated('Use cupertino = CupertinoModalSheetData(imageFilter)')
      ImageFilter iosImageFilter,
  @Deprecated('Use cupertino = CupertinoModalSheetData(semanticsDismissible)')
      bool iosSemanticsDismissible,
  @Deprecated('Use cupertino = CupertinoModalSheetData(useRootNavigator)')
      bool iosUseRootNavigator = true,
  CupertinoModalSheetData cupertino,
}) {
  if (isMaterial(context)) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      backgroundColor: material?.backgroundColor ?? androidBackgroundColor,
      elevation: material?.elevation ?? androidElevation,
      shape: material?.shape ?? androidShape,
      isScrollControlled:
          material?.isScrollControlled ?? androidIsScrollControlled,
      useRootNavigator: material?.useRootNavigator ?? androidUseRootNavigator,
      clipBehavior: material?.clipBehavior ?? androidClipBehavior,
      barrierColor: material?.barrierColor ?? androidBarrierColor,
      enableDrag: material?.enableDrag ?? androidEnableDrag,
      isDismissible: material?.isDismissible ?? androidIsDismissible,
    );
  } else {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: builder,
      filter: cupertino?.imageFilter ?? iosImageFilter,
      semanticsDismissible:
          cupertino?.semanticsDismissible ?? iosSemanticsDismissible,
      useRootNavigator: cupertino?.useRootNavigator ?? iosUseRootNavigator,
    );
  }
}

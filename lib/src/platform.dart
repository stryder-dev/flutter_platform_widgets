/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:ui';

import 'package:flutter/cupertino.dart'
    show
        CupertinoDynamicColor,
        CupertinoTheme,
        CupertinoThemeData,
        showCupertinoDialog,
        showCupertinoModalPopup;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show Theme, ThemeData, Colors, showDialog, showModalBottomSheet;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;

const Color _kModalBarrierColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x33000000),
  darkColor: Color(0x7A000000),
);

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

  final platformStyle = PlatformProvider.of(context)?.settings.platformStyle;

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
}

bool isMaterial(BuildContext context) {
  return _platformStyle(context) == PlatformStyle.Material;
}

bool isCupertino(BuildContext context) {
  return _platformStyle(context) == PlatformStyle.Cupertino;
}

T platformThemeData<T>(
  BuildContext context, {
  required T Function(ThemeData theme) material,
  required T Function(CupertinoThemeData theme) cupertino,
}) {
  return isMaterial(context)
      ? material(Theme.of(context))
      : cupertino(CupertinoTheme.of(context));
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
}

abstract class _DialogBaseData {
  final WidgetBuilder? builder;
  final bool? barrierDismissible;
  final RouteSettings? routeSettings;
  final bool? useRootNavigator;
  final String? barrierLabel;
  final Offset? anchorPoint;
  final bool? requestFocus;

  const _DialogBaseData({
    this.builder,
    this.barrierDismissible,
    this.routeSettings,
    this.useRootNavigator,
    this.barrierLabel,
    this.anchorPoint,
    this.requestFocus,
  });
}

class MaterialDialogData extends _DialogBaseData {
  final bool? useSafeArea;
  final Color? barrierColor;
  final TraversalEdgeBehavior? traversalEdgeBehavior;
  final AnimationStyle? animationStyle;

  const MaterialDialogData({
    super.builder,
    super.barrierDismissible,
    super.routeSettings,
    super.useRootNavigator,
    super.barrierLabel,
    super.anchorPoint,
    super.requestFocus,
    this.useSafeArea,
    this.barrierColor,
    this.traversalEdgeBehavior,
    this.animationStyle,
  });
}

class CupertinoDialogData extends _DialogBaseData {
  const CupertinoDialogData({
    super.builder,
    super.barrierDismissible,
    super.routeSettings,
    super.useRootNavigator,
    super.barrierLabel,
    super.anchorPoint,
    super.requestFocus,
  });
}

Future<T?> showPlatformDialog<T>({
  required BuildContext context,
  MaterialDialogData? material,
  CupertinoDialogData? cupertino,
  WidgetBuilder? builder,
  bool? barrierDismissible,
  RouteSettings? routeSettings,
  bool useRootNavigator = true,
  String? barrierLabel,
  Offset? anchorPoint,
  bool? requestFocus,
}) {
  if (isMaterial(context)) {
    assert(material?.builder != null || builder != null);

    return showDialog<T>(
      context: context,
      builder: material?.builder ?? builder!,
      barrierDismissible:
          material?.barrierDismissible ?? barrierDismissible ?? true,
      routeSettings: material?.routeSettings ?? routeSettings,
      useRootNavigator: material?.useRootNavigator ?? useRootNavigator,
      useSafeArea: material?.useSafeArea ?? true,
      barrierColor: material?.barrierColor ?? Colors.black54,
      barrierLabel: material?.barrierLabel ?? barrierLabel,
      anchorPoint: material?.anchorPoint ?? anchorPoint,
      traversalEdgeBehavior: material?.traversalEdgeBehavior,
      animationStyle: material?.animationStyle,
      requestFocus: material?.requestFocus ?? requestFocus,
    );
  } else {
    assert(cupertino?.builder != null || builder != null);

    return showCupertinoDialog<T>(
      context: context,
      builder: cupertino?.builder ?? builder!,
      routeSettings: cupertino?.routeSettings ?? routeSettings,
      useRootNavigator: cupertino?.useRootNavigator ?? useRootNavigator,
      barrierDismissible:
          cupertino?.barrierDismissible ?? barrierDismissible ?? false,
      barrierLabel: cupertino?.barrierLabel ?? barrierLabel,
      anchorPoint: cupertino?.anchorPoint ?? anchorPoint,
      requestFocus: material?.requestFocus ?? requestFocus,
    );
  }
}

abstract class _ModalSheetBaseData {
  const _ModalSheetBaseData({this.anchorPoint, this.requestFocus});

  final Offset? anchorPoint;
  final bool? requestFocus;
}

class MaterialModalSheetData extends _ModalSheetBaseData {
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool? isScrollControlled;
  final bool? useRootNavigator;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final bool? enableDrag;
  final bool? isDismissible;
  final RouteSettings? routeSettings;
  final AnimationController? transitionAnimationController;
  final BoxConstraints? constraints;
  final bool? useSafeArea;
  final String? barrierLabel;
  final double? scrollControlDisabledMaxHeightRatio;
  final bool? showDragHandle;
  final AnimationStyle? sheetAnimationStyle;

  const MaterialModalSheetData({
    super.anchorPoint,
    super.requestFocus,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.isScrollControlled,
    this.useRootNavigator,
    this.clipBehavior,
    this.barrierColor,
    this.enableDrag,
    this.isDismissible,
    this.routeSettings,
    this.transitionAnimationController,
    this.constraints,
    this.useSafeArea,
    this.barrierLabel,
    this.scrollControlDisabledMaxHeightRatio,
    this.showDragHandle,
    this.sheetAnimationStyle,
  });
}

class CupertinoModalSheetData extends _ModalSheetBaseData {
  final ImageFilter? imageFilter;
  final bool? semanticsDismissible;
  final bool? useRootNavigator;
  final Color? barrierColor;
  final bool? barrierDismissible;
  final RouteSettings? routeSettings;

  const CupertinoModalSheetData({
    super.anchorPoint,
    super.requestFocus,
    this.imageFilter,
    this.semanticsDismissible,
    this.useRootNavigator,
    this.barrierColor,
    this.barrierDismissible,
    this.routeSettings,
  });
}

/// Displays either the showModalBottomSheet for material
/// or showCupertinoModalPopup for cupertino
Future<T?> showPlatformModalSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  MaterialModalSheetData? material,
  CupertinoModalSheetData? cupertino,
  Offset? anchorPoint,
  bool? requestFocus,
}) {
  if (isMaterial(context)) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      backgroundColor: material?.backgroundColor,
      elevation: material?.elevation,
      shape: material?.shape,
      isScrollControlled: material?.isScrollControlled ?? false,
      useRootNavigator: material?.useRootNavigator ?? false,
      clipBehavior: material?.clipBehavior,
      barrierColor: material?.barrierColor,
      enableDrag: material?.enableDrag ?? true,
      isDismissible: material?.isDismissible ?? true,
      routeSettings: material?.routeSettings,
      transitionAnimationController: material?.transitionAnimationController,
      constraints: material?.constraints,
      anchorPoint: material?.anchorPoint ?? anchorPoint,
      useSafeArea: material?.useSafeArea ?? false,
      barrierLabel: material?.barrierLabel,
      scrollControlDisabledMaxHeightRatio:
          material?.scrollControlDisabledMaxHeightRatio ??
          _defaultScrollControlDisabledMaxHeightRatio,
      showDragHandle: material?.showDragHandle,
      sheetAnimationStyle: material?.sheetAnimationStyle,
      requestFocus: material?.requestFocus ?? requestFocus,
    );
  } else {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: builder,
      filter: cupertino?.imageFilter,
      semanticsDismissible: cupertino?.semanticsDismissible ?? false,
      useRootNavigator: cupertino?.useRootNavigator ?? true,
      barrierColor: cupertino?.barrierColor ?? _kModalBarrierColor,
      barrierDismissible: cupertino?.barrierDismissible ?? true,
      routeSettings: cupertino?.routeSettings,
      anchorPoint: cupertino?.anchorPoint ?? anchorPoint,
      requestFocus: cupertino?.requestFocus ?? requestFocus,
    );
  }
}

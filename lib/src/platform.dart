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
    show
        Colors,
        Theme,
        ThemeData,
        showAdaptiveDialog,
        showDialog,
        showModalBottomSheet;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_platform_widgets/src/extensions/build_context.dart';

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
  return context.isMaterialDesign
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

@immutable
abstract class _DialogBaseData {
  final WidgetBuilder? builder;
  final bool? barrierDismissible;
  final RouteSettings? routeSettings;
  final bool? useRootNavigator;
  final String? barrierLabel;
  final Offset? anchorPoint;
  final Color barrierColor;

  const _DialogBaseData({
    this.builder,
    this.barrierDismissible,
    this.routeSettings,
    this.useRootNavigator,
    this.barrierLabel,
    // ignore: unused_element
    this.barrierColor = Colors.black54,
    this.anchorPoint,
  });
}

class MaterialDialogData extends _DialogBaseData {
  final bool? useSafeArea;

  const MaterialDialogData({
    super.builder,
    super.barrierDismissible,
    super.routeSettings,
    super.useRootNavigator,
    super.barrierLabel,
    super.anchorPoint,
    this.useSafeArea,
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
  });
}

// You can use [AlertDialog.adaptive] widget in the builder if
// useOfficalLogic is set to true, you also can use PlatformAlertDialog
Future<T?> showPlatformDialog<T>({
  required BuildContext context,
  MaterialDialogData? material,
  CupertinoDialogData? cupertino,
  WidgetBuilder? builder,
  bool? barrierDismissible,
  RouteSettings? routeSettings,
  bool useRootNavigator = true,
  String? barrierLabel,
  Color barrierColor = Colors.black54,
  Offset? anchorPoint,
  bool useOfficalLogic = true,
}) {
  if (useOfficalLogic) {
    assert(material?.builder != null ||
        cupertino?.builder != null ||
        builder != null);
    if (context.isMaterialDesign) {
      return showAdaptiveDialog(
        context: context,
        builder: material?.builder?.call ?? builder!,
        barrierDismissible: material?.barrierDismissible ?? barrierDismissible,
        routeSettings: material?.routeSettings ?? routeSettings,
        useRootNavigator: material?.useRootNavigator ?? useRootNavigator,
        barrierLabel: material?.barrierLabel ?? barrierLabel,
        anchorPoint: material?.anchorPoint ?? anchorPoint,
        barrierColor: material?.barrierColor ?? barrierColor,
      );
    }
    return showAdaptiveDialog<T>(
      context: context,
      builder: cupertino?.builder ?? builder!,
      barrierDismissible: cupertino?.barrierDismissible ?? barrierDismissible,
      routeSettings: cupertino?.routeSettings ?? routeSettings,
      useRootNavigator: cupertino?.useRootNavigator ?? useRootNavigator,
      barrierLabel: cupertino?.barrierLabel ?? barrierLabel,
      anchorPoint: cupertino?.anchorPoint ?? anchorPoint,
      barrierColor: cupertino?.barrierColor ?? barrierColor,
    );
  }

  if (context.isCupertinoDesign) {
    assert(cupertino?.builder != null || builder != null);

    if (cupertino?.barrierColor != null) {
      throw ArgumentError.value(
        cupertino?.barrierColor,
        'barrierColor',
        'If useOfficalLogic is false then barrierColor barrierColor is not'
            ' supported, please pass null to barrierColor or pass true to'
            ' useOfficalLogic',
      );
    }
    return showCupertinoDialog<T>(
      context: context,
      builder: cupertino?.builder ?? builder!,
      routeSettings: cupertino?.routeSettings ?? routeSettings,
      useRootNavigator: cupertino?.useRootNavigator ?? useRootNavigator,
      barrierDismissible:
          cupertino?.barrierDismissible ?? barrierDismissible ?? false,
      barrierLabel: cupertino?.barrierLabel ?? barrierLabel,
      anchorPoint: cupertino?.anchorPoint ?? anchorPoint,
    );
  }
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
  );
}

abstract class _ModalSheetBaseData {
  _ModalSheetBaseData({
    this.anchorPoint,
  });

  final Offset? anchorPoint;
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

  MaterialModalSheetData({
    super.anchorPoint,
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
  });
}

class CupertinoModalSheetData extends _ModalSheetBaseData {
  final ImageFilter? imageFilter;
  final bool? semanticsDismissible;
  final bool? useRootNavigator;
  final Color? barrierColor;
  final bool? barrierDismissible;
  final RouteSettings? routeSettings;

  CupertinoModalSheetData({
    super.anchorPoint,
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
}) {
  if (context.isMaterialDesign) {
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
      anchorPoint: material?.anchorPoint,
      useSafeArea: material?.useSafeArea ?? false,
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
      anchorPoint: cupertino?.anchorPoint,
    );
  }
}

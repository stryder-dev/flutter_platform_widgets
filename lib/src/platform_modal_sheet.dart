import 'dart:ui';

import 'package:flutter/cupertino.dart'
    show CupertinoDynamicColor, showCupertinoModalPopup;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show showModalBottomSheet;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'platform.dart';

const Color _kModalBarrierColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x33000000),
  darkColor: Color(0x7A000000),
);

class ModalSheetData {
  ModalSheetData({
    this.anchorPoint,
    this.routeSettings,
    this.isDismissible,
    this.barrierColor,
    this.useRootNavigator,
    this.builder,
  });

  final Offset? anchorPoint;
  final bool? useRootNavigator;
  final Color? barrierColor;
  final bool? isDismissible;
  final RouteSettings? routeSettings;
  final WidgetBuilder? builder;
}

class MaterialModalSheetData extends ModalSheetData {
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool? isScrollControlled;
  final Clip? clipBehavior;
  final bool? enableDrag;
  final AnimationController? transitionAnimationController;
  final BoxConstraints? constraints;

  MaterialModalSheetData({
    super.builder,
    super.anchorPoint,
    super.isDismissible,
    super.useRootNavigator,
    super.barrierColor,
    super.routeSettings,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.isScrollControlled,
    this.clipBehavior,
    this.enableDrag,
    this.transitionAnimationController,
    this.constraints,
  });
}

class CupertinoModalSheetData extends ModalSheetData {
  final ImageFilter? imageFilter;
  final bool? semanticsDismissible;

  CupertinoModalSheetData({
    super.builder,
    super.anchorPoint,
    super.useRootNavigator,
    super.barrierColor,
    super.routeSettings,
    this.imageFilter,
    this.semanticsDismissible,
    bool? barrierDismissible,
  }) : super(isDismissible: barrierDismissible);
}

/// Displays either the showModalBottomSheet for material
/// or showCupertinoModalPopup for cupertino
Future<T?> showPlatformModalSheet<T>({
  required BuildContext context,
  required WidgetBuilder? builder,
  bool? useRootNavigator,
  Color? barrierColor,
  bool? isDismissible,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  PlatformBuilder<MaterialModalSheetData>? material,
  PlatformBuilder<CupertinoModalSheetData>? cupertino,
  PlatformBuilder? customData,
  Future<T?> Function(
          BuildContext, PlatformTarget, ModalSheetData, PlatformBuilder?)?
      customModal,
}) {
  final modalData = ModalSheetData(
    builder: builder,
    anchorPoint: anchorPoint,
    barrierColor: barrierColor,
    isDismissible: isDismissible,
    routeSettings: routeSettings,
    useRootNavigator: useRootNavigator,
  );

  if (isMaterial(context)) {
    return _showMaterialModalBottomSheet<T>(context, modalData, material);
  } else if (isCupertino(context)) {
    return _showCupertinolModalBottomSheet<T>(context, modalData, cupertino);
  } else if (isCustom(context)) {
    final provider = PlatformProvider.of(context);
    final currentPlatform = platform(context);

    if (customModal != null) {
      return customModal.call(
        context,
        platform(context),
        modalData,
        customData?.call(context, currentPlatform),
      );
    }

    final platformBuilder = provider?.customWidgetBuilders?[currentPlatform];
    final showModal = platformBuilder?.showPlatformModalSheet;
    if (showModal != null) {
      return showModal.call(
        context,
        modalData,
        customData?.call(context, currentPlatform),
      );
    }
  }

  if (isMaterialFallback(context)) {
    return _showMaterialModalBottomSheet<T>(context, modalData, material);
  } else if (isCupertinoFallback(context)) {
    return _showCupertinolModalBottomSheet<T>(context, modalData, cupertino);
  }

  throw UnsupportedError(
      'This platform is not supported: $defaultTargetPlatform');
}

Future<T?> _showMaterialModalBottomSheet<T>(
  BuildContext context,
  ModalSheetData modalData,
  PlatformBuilder<MaterialModalSheetData>? material,
) {
  final data = material?.call(context, platform(context));

  assert(data?.builder != null || modalData.builder != null);

  return showModalBottomSheet<T>(
    context: context,
    builder: data?.builder ?? modalData.builder!,
    backgroundColor: data?.backgroundColor,
    elevation: data?.elevation,
    shape: data?.shape,
    isScrollControlled: data?.isScrollControlled ?? false,
    useRootNavigator:
        data?.useRootNavigator ?? modalData.useRootNavigator ?? false,
    clipBehavior: data?.clipBehavior,
    barrierColor: data?.barrierColor ?? modalData.barrierColor,
    enableDrag: data?.enableDrag ?? true,
    isDismissible: data?.isDismissible ?? modalData.isDismissible ?? true,
    routeSettings: data?.routeSettings ?? modalData.routeSettings,
    transitionAnimationController: data?.transitionAnimationController,
    constraints: data?.constraints,
    anchorPoint: data?.anchorPoint ?? modalData.anchorPoint,
  );
}

Future<T?> _showCupertinolModalBottomSheet<T>(
  BuildContext context,
  ModalSheetData modalData,
  PlatformBuilder<CupertinoModalSheetData>? cupertino,
) {
  final data = cupertino?.call(context, platform(context));

  assert(data?.builder != null || modalData.builder != null);

  return showCupertinoModalPopup<T>(
    context: context,
    builder: data?.builder ?? modalData.builder!,
    filter: data?.imageFilter,
    semanticsDismissible: data?.semanticsDismissible,
    useRootNavigator:
        data?.useRootNavigator ?? modalData.useRootNavigator ?? true,
    barrierColor:
        data?.barrierColor ?? modalData.barrierColor ?? _kModalBarrierColor,
    barrierDismissible: data?.isDismissible ?? modalData.isDismissible ?? true,
    routeSettings: data?.routeSettings ?? modalData.routeSettings,
    anchorPoint: data?.anchorPoint ?? modalData.anchorPoint,
  );
}

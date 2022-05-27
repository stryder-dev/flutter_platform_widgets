import 'dart:ui';

import 'package:flutter/cupertino.dart'
    show CupertinoDynamicColor, showCupertinoModalPopup;
import 'package:flutter/material.dart' show showModalBottomSheet;
import 'package:flutter/widgets.dart';

import 'platform.dart';

const Color _kModalBarrierColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x33000000),
  darkColor: Color(0x7A000000),
);

abstract class _BaseData {
  _BaseData({
    this.anchorPoint,
  });

  final Offset? anchorPoint;
}

class MaterialModalSheetData extends _BaseData {
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool isScrollControlled;
  final bool useRootNavigator;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final bool enableDrag;
  final bool isDismissible;
  final RouteSettings? routeSettings;
  final AnimationController? transitionAnimationController;
  final BoxConstraints? constraints;

  MaterialModalSheetData({
    super.anchorPoint,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.isScrollControlled = false,
    this.useRootNavigator = false,
    this.clipBehavior,
    this.barrierColor,
    this.enableDrag = false,
    this.isDismissible = false,
    this.routeSettings,
    this.transitionAnimationController,
    this.constraints,
  });
}

class CupertinoModalSheetData extends _BaseData {
  final ImageFilter? imageFilter;
  final bool? semanticsDismissible;
  final bool useRootNavigator;
  final Color barrierColor;
  final bool barrierDismissible;
  final RouteSettings? routeSettings;

  CupertinoModalSheetData({
    super.anchorPoint,
    this.imageFilter,
    this.semanticsDismissible,
    this.useRootNavigator = true,
    this.barrierColor = _kModalBarrierColor,
    this.barrierDismissible = true,
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
      anchorPoint: material?.anchorPoint,
    );
  } else {
    return showCupertinoModalPopup<T>(
        context: context,
        builder: builder,
        filter: cupertino?.imageFilter,
        semanticsDismissible: cupertino?.semanticsDismissible,
        useRootNavigator: cupertino?.useRootNavigator ?? true,
        barrierColor: cupertino?.barrierColor ?? _kModalBarrierColor,
        barrierDismissible: cupertino?.barrierDismissible ?? true,
        routeSettings: cupertino?.routeSettings,
        anchorPoint: cupertino?.anchorPoint);
  }
}

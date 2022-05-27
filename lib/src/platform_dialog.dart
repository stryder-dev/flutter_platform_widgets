import 'package:flutter/cupertino.dart' show showCupertinoDialog;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show showDialog, Colors;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

class _BaseData {
  _BaseData({
    this.builder,
    this.barrierDismissible,
    this.routeSettings,
    this.useRootNavigator,
    this.barrierLabel,
  });

  final WidgetBuilder? builder;
  final bool? barrierDismissible;
  final RouteSettings? routeSettings;
  final bool? useRootNavigator;
  final String? barrierLabel;
}

class MaterialDialogData extends _BaseData {
  MaterialDialogData({
    super.builder,
    super.barrierDismissible,
    super.routeSettings,
    super.useRootNavigator,
    super.barrierLabel,
    this.materialUseSafeArea,
    this.materialBarrierColor,
  });

  final bool? materialUseSafeArea;
  final Color? materialBarrierColor;
}

class CupertinoDialogData extends _BaseData {
  CupertinoDialogData({
    super.builder,
    super.barrierDismissible,
    super.routeSettings,
    super.useRootNavigator,
    super.barrierLabel,
  });
}

Future<T?> showPlatformDialog<T>({
  required BuildContext context,
  required WidgetBuilder? builder,
  bool? barrierDismissible,
  RouteSettings? routeSettings,
  bool useRootNavigator = true,
  String? barrierLabel,
  PlatformBuilder<MaterialDialogData>? material,
  PlatformBuilder<CupertinoDialogData>? cupertino,
  Future<T?> Function(Widget, PlatformTarget)? custom,
}) {
  if (isMaterial(context)) {
    final data = material?.call(context, platform(context));

    assert(data?.builder != null || builder != null);

    return showDialog<T>(
      context: context,
      builder: data?.builder ?? builder ?? (_) => SizedBox.shrink(),
      barrierDismissible:
          data?.barrierDismissible ?? barrierDismissible ?? true,
      routeSettings: data?.routeSettings ?? routeSettings,
      useRootNavigator: data?.useRootNavigator ?? useRootNavigator,
      useSafeArea: data?.materialUseSafeArea ?? true,
      //child: , deprecated
      barrierColor: data?.materialBarrierColor ?? Colors.black54,
      barrierLabel: data?.barrierLabel ?? barrierLabel,
    );
  } else if (isCupertino(context)) {
    final data = cupertino?.call(context, platform(context));

    assert(data?.builder != null || builder != null);
    return showCupertinoDialog<T>(
      context: context,
      builder: data?.builder ?? builder ?? (_) => SizedBox.shrink(),
      routeSettings: data?.routeSettings ?? routeSettings,
      useRootNavigator: data?.useRootNavigator ?? useRootNavigator,
      barrierDismissible:
          data?.barrierDismissible ?? barrierDismissible ?? false,
      barrierLabel: data?.barrierLabel ?? barrierLabel,
    );
  } else if (isCustom(context) && custom != null) {
    return custom(
      builder?.call(context) ?? SizedBox.shrink(),
      platform(context),
    );
  }

  throw new UnsupportedError(
      'This platform is not supported: $defaultTargetPlatform');
}

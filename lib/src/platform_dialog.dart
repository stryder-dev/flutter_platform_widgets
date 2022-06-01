import 'package:flutter/cupertino.dart' show showCupertinoDialog;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show showDialog, Colors;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_provider.dart';
import 'widget_base.dart';

class DialogData {
  DialogData({
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

class MaterialDialogData extends DialogData {
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

class CupertinoDialogData extends DialogData {
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
  PlatformBuilder? customData,
  Future<T?> Function(
          BuildContext, PlatformTarget, DialogData, PlatformBuilder?)?
      customDialog,
}) {
  final dialogData = DialogData(
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    builder: builder,
    routeSettings: routeSettings,
    useRootNavigator: useRootNavigator,
  );

  if (isMaterial(context)) {
    return _showMaterialDialog<T>(context, dialogData, material);
  } else if (isCupertino(context)) {
    return _showCupertinoDialog<T>(context, dialogData, cupertino);
  } else if (isCustom(context)) {
    final provider = PlatformProvider.of(context);
    final currentPlatform = platform(context);

    if (customDialog != null) {
      return customDialog(
        context,
        platform(context),
        dialogData,
        customData?.call(context, currentPlatform),
      );
    }

    final platformBuilder = provider?.customWidgetBuilders?[currentPlatform];
    final showDialog = platformBuilder?.showDialog;
    if (showDialog != null) {
      return showDialog(
        context,
        dialogData,
        customData?.call(context, currentPlatform),
      );
    }
  }

  if (isMaterialFallback(context)) {
    return _showMaterialDialog<T>(context, dialogData, material);
  } else if (isCupertinoFallback(context)) {
    return _showCupertinoDialog<T>(context, dialogData, cupertino);
  }

  throw UnsupportedError(
      'This platform is not supported: $defaultTargetPlatform');
}

Future<T?> _showMaterialDialog<T>(
  BuildContext context,
  DialogData dialogData,
  PlatformBuilder<MaterialDialogData>? material,
) {
  final data = material?.call(context, platform(context));

  assert(data?.builder != null || dialogData.builder != null);

  return showDialog<T>(
    context: context,
    builder: data?.builder ?? dialogData.builder ?? (_) => SizedBox.shrink(),
    barrierDismissible:
        data?.barrierDismissible ?? dialogData.barrierDismissible ?? true,
    routeSettings: data?.routeSettings ?? dialogData.routeSettings,
    useRootNavigator:
        data?.useRootNavigator ?? dialogData.useRootNavigator ?? true,
    useSafeArea: data?.materialUseSafeArea ?? true,
    //child: , deprecated
    barrierColor: data?.materialBarrierColor ?? Colors.black54,
    barrierLabel: data?.barrierLabel ?? dialogData.barrierLabel,
  );
}

Future<T?> _showCupertinoDialog<T>(
  BuildContext context,
  DialogData dialogData,
  PlatformBuilder<CupertinoDialogData>? cupertino,
) {
  final data = cupertino?.call(context, platform(context));

  assert(data?.builder != null || dialogData.builder != null);

  return showCupertinoDialog<T>(
    context: context,
    builder: data?.builder ?? dialogData.builder ?? (_) => SizedBox.shrink(),
    routeSettings: data?.routeSettings ?? dialogData.routeSettings,
    useRootNavigator:
        data?.useRootNavigator ?? dialogData.useRootNavigator ?? true,
    barrierDismissible:
        data?.barrierDismissible ?? dialogData.barrierDismissible ?? false,
    barrierLabel: data?.barrierLabel ?? dialogData.barrierLabel,
  );
}

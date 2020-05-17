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

PlatformStyle _platformStyle(BuildContext context) {
  final platformStyle = PlatformProvider.of(context)?.settings?.platformStyle;

  if (kIsWeb) {
    return platformStyle?.web ?? PlatformStyle.Material;
  }

  switch (Theme.of(context).platform) {
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

Future<T> showPlatformDialog<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  bool androidBarrierDismissible = true,
  RouteSettings routeSettings,
  bool useRootNavigator = true,
}) {
  if (isMaterial(context)) {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: androidBarrierDismissible,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
    );
  } else {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
    );
  }
}

/// Displays either the showModalBottomSheet for material
/// or showCupertinoModalPopup for cupertino
Future<T> showPlatformModalSheet<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  Color androidBackgroundColor,
  double androidElevation,
  ShapeBorder androidShape,
  bool androidIsScrollControlled = false,
  bool androidUseRootNavigator = false,
  Clip androidClipBehavior,
  Color androidBarrierColor,
  bool androidEnableDrag = true,
  bool androidIsDismissible = true,
  ImageFilter iosImageFilter,
  bool iosSemanticsDismissible,
  bool iosUseRootNavigator = true,
}) {
  if (isMaterial(context)) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      backgroundColor: androidBackgroundColor,
      elevation: androidElevation,
      shape: androidShape,
      isScrollControlled: androidIsScrollControlled,
      useRootNavigator: androidUseRootNavigator,
      clipBehavior: androidClipBehavior,
      barrierColor: androidBarrierColor,
      enableDrag: androidEnableDrag,
      isDismissible: androidIsDismissible,
    );
  } else {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: builder,
      filter: iosImageFilter,
      semanticsDismissible: iosSemanticsDismissible,
      useRootNavigator: iosUseRootNavigator,
    );
  }
}

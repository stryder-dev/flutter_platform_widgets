/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show showCupertinoDialog, showCupertinoModalPopup;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show Theme, showDialog, showModalBottomSheet;
import 'package:flutter/widgets.dart';

bool isMaterial(BuildContext context) {
  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
      return true;
    case TargetPlatform.iOS:
      return false;
    default:
      return true;
  }
}

bool isCupertino(BuildContext context) {
  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
      return false;
    case TargetPlatform.iOS:
      return true;
    default:
      return false;
  }
}

Future<T> showPlatformDialog<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  androidBarrierDismissible = false,
}) {
  if (isMaterial(context)) {
    return showDialog<T>(
        context: context,
        builder: builder,
        barrierDismissible: androidBarrierDismissible);
  } else {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
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
    );
  } else {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: builder,
    );
  }
}

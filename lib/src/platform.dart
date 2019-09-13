/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart'
    show showCupertinoDialog, showCupertinoModalPopup;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show showDialog, showModalBottomSheet;
import 'package:flutter/widgets.dart';

bool _forceMaterial = false;

void changeToMaterialPlatform() {
  _forceMaterial = true;
  _forceCupertino = false;
}

bool _forceCupertino = false;

void changeToCupertinoPlatform() {
  _forceCupertino = true;
  _forceMaterial = false;
}

void changeToAutoDetectPlatform() {
  _forceMaterial = false;
  _forceCupertino = false;
}

bool get isMaterial =>
    _forceMaterial || (!_forceCupertino && _isMaterialCompatible);

bool get isCupertino =>
    _forceCupertino || (!_forceMaterial && _isCupertinoCompatible);

bool get _isMaterialCompatible =>
    kIsWeb ||
    Platform.isWindows ||
    Platform.isAndroid ||
    Platform.isFuchsia ||
    Platform.isLinux;

bool get _isCupertinoCompatible =>
    !kIsWeb && (Platform.isIOS || Platform.isMacOS);

Future<T> showPlatformDialog<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  androidBarrierDismissible = false,
}) {
  if (isMaterial) {
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
}) {
  if (isMaterial) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      backgroundColor: androidBackgroundColor,
      elevation: androidElevation,
      shape: androidShape,
      isScrollControlled: androidIsScrollControlled,
      useRootNavigator: androidUseRootNavigator,
    );
  } else {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: builder,
    );
  }
}

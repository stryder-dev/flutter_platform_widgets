/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoTheme, CupertinoThemeData;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeData;
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
  final platformStyle = PlatformProvider.of(context)?.settings.platformStyle;

  return _platformStyleImpl(context, platformStyle);
}

PlatformStyle _fallbackPlatformStyle(BuildContext context) {
  final platformStyle =
      PlatformProvider.of(context)?.settings.fallbackPlatformStyle;

  return _platformStyleImpl(context, platformStyle);
}

PlatformStyle _platformStyleImpl(
    BuildContext context, PlatformStyleData? platformStyle) {
  final platform = PlatformProvider.of(context)?.platform;

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

bool isCustom(BuildContext context) {
  return _platformStyle(context) == PlatformStyle.Custom;
}

bool isMaterialFallback(BuildContext context) {
  return _fallbackPlatformStyle(context) == PlatformStyle.Material;
}

bool isCupertinoFallback(BuildContext context) {
  return _fallbackPlatformStyle(context) == PlatformStyle.Cupertino;
}

T platformThemeData<T>(
  BuildContext context, {
  required T Function(ThemeData theme) material,
  required T Function(CupertinoThemeData theme) cupertino,
  T Function(ThemeData theme, CupertinoThemeData cupertinoTheme)? custom,
}) {
  if (custom != null && isCustom(context)) {
    return custom.call(Theme.of(context), CupertinoTheme.of(context));
  }

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

typedef PlatformTargetBuilder<T> = Widget Function(
  T widget,
  Object? data,
);

class CustomWidgetBuilder {
  final PlatformTargetBuilder<PlatformAlertDialog>? alertDialogBuilder;
  final PlatformTargetBuilder<PlatformAppBar>? appBarBuilder;
  final PlatformTargetBuilder<PlatformApp>? appBuilder;
  final PlatformTargetBuilder<PlatformCircularProgressIndicator>?
      circularProgressIndicatorBuilder;
  final PlatformTargetBuilder<PlatformDialogAction>? dialogActionBuilder;
  final PlatformTargetBuilder<PlatformElevatedButton>? elevatedButtonBuilder;
  final PlatformTargetBuilder<PlatformIconButton>? iconButtonBuilder;
  final PlatformTargetBuilder<PlatformNavBar>? navBarBuilder;
  final PlatformTargetBuilder<PlatformScaffold>? scaffoldBuilder;
  final PlatformTargetBuilder<PlatformSlider>? sliderBuilder;
  final PlatformTargetBuilder<PlatformSwitch>? switchBuilder;

  final PlatformTargetBuilder<PlatformTextButton>? textButtonBuilder;
  final PlatformTargetBuilder<PlatformTextField>? textFieldBuilder;
  final PlatformTargetBuilder<PlatformTextFormField>? textFormFieldBuilder;

  CustomWidgetBuilder({
    this.alertDialogBuilder,
    this.appBarBuilder,
    this.appBuilder,
    this.circularProgressIndicatorBuilder,
    this.dialogActionBuilder,
    this.elevatedButtonBuilder,
    this.iconButtonBuilder,
    this.navBarBuilder,
    this.scaffoldBuilder,
    this.sliderBuilder,
    this.switchBuilder,
    this.textButtonBuilder,
    this.textFieldBuilder,
    this.textFormFieldBuilder,
  });
}

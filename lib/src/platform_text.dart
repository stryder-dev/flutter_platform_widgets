/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/material.dart' show Theme;
import 'package:flutter/widgets.dart';

import 'platform.dart' show isMaterial;
import 'platform_provider.dart' show PlatformProvider;
import 'platform_theme.dart' show PlatformTheme;

String formatData(BuildContext context, String data) {
  if (isMaterial(context)) {
    final providerState = PlatformProvider.of(context);
    final matchMaterialCaseForPlatformText =
        providerState?.settings.matchMaterialCaseForPlatformText ?? true;

    final m3 = PlatformTheme.of(context)?.isMaterial3 ??
        Theme.of(context).useMaterial3;

    // If it material3 and we want to match the casing as defined for material3 then do not return ALL CAPS
    if (m3 && matchMaterialCaseForPlatformText) {
      return data;
    }

    return data.toUpperCase();
  }
  return data;
}

typedef Text _TextBuilder(BuildContext context);

class PlatformText extends StatelessWidget {
  final _TextBuilder _textBuilder;

  const PlatformText._(Key? key, this._textBuilder) : super(key: key);

  factory PlatformText(
    String data, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    bool? softWrap,
    TextOverflow? overflow,
    @Deprecated(
      'Use textScaler instead. '
      'This feature was removed after version 3.16',
    )
    double? textScaleFactor,
    TextScaler? textScaler,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    ui.TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) {
    return PlatformText._(
        key,
        (BuildContext context) => Text(
              formatData(context, data),
              key: key,
              style: style,
              textAlign: textAlign,
              textDirection: textDirection,
              softWrap: softWrap,
              overflow: overflow,
              textScaler: textScaler,
              maxLines: maxLines,
              locale: locale,
              semanticsLabel: semanticsLabel,
              strutStyle: strutStyle,
              textWidthBasis: textWidthBasis,
              textHeightBehavior: textHeightBehavior,
              selectionColor: selectionColor,
              //deprecated textScaleFactor: textScaleFactor,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return _textBuilder(context);
  }
}

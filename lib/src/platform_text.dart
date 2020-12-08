/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';

import 'platform.dart' show isMaterial;

String formatData(BuildContext context, String data) {
  if (isMaterial(context)) {
    return data.toUpperCase();
  }
  return data;
}

typedef Text _TextBuilder(BuildContext context);

class PlatformText extends StatelessWidget {
  final _TextBuilder _textBuilder;

  PlatformText._(Key? key, this._textBuilder) : super(key: key);

  factory PlatformText(
    String data, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    ui.TextHeightBehavior? textHeightBehavior,
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
              textScaleFactor: textScaleFactor,
              maxLines: maxLines,
              locale: locale,
              semanticsLabel: semanticsLabel,
              strutStyle: strutStyle,
              textWidthBasis: textWidthBasis,
              textHeightBehavior: textHeightBehavior,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return _textBuilder(context);
  }
}

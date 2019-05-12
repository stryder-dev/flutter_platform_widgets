/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show CupertinoTextField, CupertinoColors, OverlayVisibilityMode;
import 'package:flutter/material.dart' show InputDecoration, TextField;
import 'package:flutter/services.dart'
    show
        Brightness,
        TextInputFormatter,
        TextInputType,
        TextInputAction,
        TextCapitalization;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const TextStyle _kDefaultTextStyle = TextStyle(
  fontFamily: '.SF Pro Text',
  fontSize: 17.0,
  letterSpacing: -0.38,
  color: CupertinoColors.black,
  decoration: TextDecoration.none,
);
const BorderSide _kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoColors.lightBackgroundGray,
  style: BorderStyle.solid,
  width: 0.0,
);
const Border _kDefaultRoundedBorder = Border(
  top: _kDefaultRoundedBorderSide,
  bottom: _kDefaultRoundedBorderSide,
  left: _kDefaultRoundedBorderSide,
  right: _kDefaultRoundedBorderSide,
);
const BoxDecoration _kDefaultRoundedBorderDecoration = BoxDecoration(
  border: _kDefaultRoundedBorder,
  borderRadius: BorderRadius.all(Radius.circular(4.0)),
);

class MaterialTextFieldData {
  MaterialTextFieldData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.textAlign,
    this.textDirection,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.onTap,
  });

  final Key widgetKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final GestureTapCallback onTap;
}

class CupertinoTextFieldData {
  CupertinoTextFieldData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.decoration,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.suffix,
    this.suffixMode,
    this.clearButtonMode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.textAlign,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
  });

  final Key widgetKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry padding;
  final String placeholder;
  final TextStyle placeholderStyle;
  final Widget prefix;
  final OverlayVisibilityMode prefixMode;
  final Widget suffix;
  final OverlayVisibilityMode suffixMode;
  final OverlayVisibilityMode clearButtonMode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
}

class PlatformTextField
    extends PlatformWidgetBase<CupertinoTextField, TextField> {
  final Key widgetKey;

  final PlatformBuilder<MaterialTextFieldData> android;
  final PlatformBuilder<CupertinoTextFieldData> ios;

  final TextEditingController controller;
  final FocusNode focusNode;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;

  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;

  PlatformTextField(
      {Key key,
      this.widgetKey,
      this.controller,
      this.focusNode,
      TextInputType keyboardType,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.none,
      TextStyle style,
      this.textAlign = TextAlign.start,
      this.autofocus = false,
      this.obscureText = false,
      this.autocorrect = true,
      this.maxLines = 1,
      this.maxLength,
      this.maxLengthEnforced = true,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth = 2.0,
      this.cursorRadius,
      Color cursorColor,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.android,
      this.ios})
      : cursorColor =
            cursorColor ?? (isMaterial ? null : CupertinoColors.activeBlue),
        style = style ?? (isMaterial ? null : _kDefaultTextStyle),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        super(key: key);

  @override
  TextField createAndroidWidget(BuildContext context) {
    MaterialTextFieldData data;
    if (android != null) {
      data = android(context);
    }

    return TextField(
      key: data?.widgetKey ?? widgetKey,
      autocorrect: data?.autocorrect ?? autocorrect,
      autofocus: data?.autofocus ?? autofocus,
      controller: data?.controller ?? controller,
      cursorColor: data?.cursorColor ?? cursorColor,
      cursorRadius: data?.cursorRadius ?? cursorRadius,
      cursorWidth: data?.cursorWidth ?? cursorWidth,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLengthEnforced: data?.maxLengthEnforced ?? maxLengthEnforced,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding: data?.scrollPadding ?? scrollPadding,
      style: data?.style ?? style,
      textAlign: data?.textAlign ?? textAlign,
      textCapitalization: data?.textCapitalization ?? textCapitalization,
      textInputAction: data?.textInputAction ?? textInputAction,
      decoration: data?.decoration ?? const InputDecoration(),
      textDirection: data?.textDirection,
      enableInteractiveSelection: data?.enableInteractiveSelection ?? false,
      onTap: data?.onTap,
    );
  }

  @override
  CupertinoTextField createIosWidget(BuildContext context) {
    CupertinoTextFieldData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoTextField(
      key: data?.widgetKey ?? widgetKey,
      autocorrect: data?.autocorrect ?? autocorrect,
      autofocus: data?.autofocus ?? autofocus,
      controller: data?.controller ?? controller,
      cursorColor: data?.cursorColor ?? cursorColor,
      cursorRadius: data?.cursorRadius ?? cursorRadius,
      cursorWidth: data?.cursorWidth ?? cursorWidth,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLengthEnforced: data?.maxLengthEnforced ?? maxLengthEnforced,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding: data?.scrollPadding ?? scrollPadding,
      style: data?.style ?? style,
      textAlign: data?.textAlign ?? textAlign,
      textCapitalization: data?.textCapitalization ?? textCapitalization,
      textInputAction: data?.textInputAction ?? textInputAction,
      decoration: data?.decoration ?? _kDefaultRoundedBorderDecoration,
      clearButtonMode: data?.clearButtonMode ?? OverlayVisibilityMode.never,
      padding: data?.padding ?? const EdgeInsets.all(6.0),
      placeholder: data?.placeholder,
      placeholderStyle: data?.placeholderStyle,
      prefix: data?.prefix,
      prefixMode: data?.prefixMode ?? OverlayVisibilityMode.always,
      suffix: data?.suffix,
      suffixMode: data?.suffixMode ?? OverlayVisibilityMode.always,
    );
  }
}

/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show
        CupertinoSearchTextField,
        CupertinoColors,
        OverlayVisibilityMode,
        CupertinoIcons;
import 'package:flutter/material.dart'
    show MaterialStateProperty, SearchBar, Theme;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    //Common
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.backgroundColor,
    this.padding,
    //Mixed
    this.hintText, //Cupertino: placeholder
    this.hintStyle, //Cupertino: placeholderStyle
    this.textStyle, //Cupertino: style
  });
  //Common
  final Key? widgetKey;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  //Mixed
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
}

class MaterialSearchBarData extends _BaseData {
  MaterialSearchBarData({
    // Common
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.onTap,
    super.onChanged,
    super.backgroundColor,
    super.padding,
    // Mixed
    super.hintText,
    super.hintStyle,
    super.textStyle,
    //Material
    this.leading,
    this.trailing,
    this.constraints,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.overlayColor,
    this.side,
    this.shape,
  });

  // final String? hintText;
  final Widget? leading;
  final Iterable<Widget>? trailing;
  final BoxConstraints? constraints;
  final MaterialStateProperty<double?>? elevation;
  final MaterialStateProperty<Color?>? shadowColor;
  final MaterialStateProperty<Color?>? surfaceTintColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final MaterialStateProperty<BorderSide?>? side;
  final MaterialStateProperty<OutlinedBorder?>? shape;
}

class CupertinoSearchBarData extends _BaseData {
  CupertinoSearchBarData({
    //Common
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.onTap,
    super.onChanged,
    super.backgroundColor,
    super.padding,
    //Mixed
    super.hintText,
    super.hintStyle,
    super.textStyle,
    //Cupertino
    this.onSubmitted,
    this.decoration,
    this.borderRadius,
    this.keyboardType,
    this.itemColor = CupertinoColors.secondaryLabel,
    this.itemSize = 20.0,
    this.prefixInsets = const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 3),
    this.prefixIcon = const Icon(CupertinoIcons.search),
    this.suffixInsets = const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 2),
    this.suffixIcon = const Icon(CupertinoIcons.xmark_circle_fill),
    this.suffixMode = OverlayVisibilityMode.editing,
    this.onSuffixTap,
    this.restorationId,
    this.smartQuotesType,
    this.smartDashesType,
    this.enableIMEPersonalizedLearning = true,
    this.autofocus = false,
    this.autocorrect = true,
    this.enabled,
  })  : assert(
          !((decoration != null) && (backgroundColor != null)),
          'Cannot provide both a background color and a decoration\n'
          'To provide both, use "decoration: BoxDecoration(color: '
          'backgroundColor)"',
        ),
        assert(
          !((decoration != null) && (borderRadius != null)),
          'Cannot provide both a border radius and a decoration\n'
          'To provide both, use "decoration: BoxDecoration(borderRadius: '
          'borderRadius)"',
        );
  final ValueChanged<String>? onSubmitted;
  final BoxDecoration? decoration;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType;
  final Color itemColor;
  final double itemSize;
  final EdgeInsetsGeometry prefixInsets;
  final Widget prefixIcon;
  final EdgeInsetsGeometry suffixInsets;
  final Icon suffixIcon;
  final OverlayVisibilityMode suffixMode;
  final VoidCallback? onSuffixTap;
  final String? restorationId;

  final SmartQuotesType? smartQuotesType;
  final SmartDashesType? smartDashesType;
  final bool enableIMEPersonalizedLearning;
  final bool autofocus;
  final bool autocorrect;
  final bool? enabled;
}

class PlatformSearchBar
    extends PlatformWidgetBase<CupertinoSearchTextField, SearchBar> {
  //Common
  final Key? widgetKey;

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  //Mixed
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  //Platform
  final PlatformBuilder<MaterialSearchBarData>? material;
  final PlatformBuilder<CupertinoSearchBarData>? cupertino;

  PlatformSearchBar({
    //Common
    super.key,
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.backgroundColor,
    this.padding,
    //Mixed
    this.hintText,
    this.hintStyle,
    this.textStyle,
    //Platform
    this.material,
    this.cupertino,
  });

  @override
  SearchBar createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return SearchBar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      focusNode: data?.focusNode ?? focusNode,
      onTap: data?.onTap ?? onTap,
      onChanged: data?.onChanged ?? onChanged,
      backgroundColor: (data?.backgroundColor != null)
          ? MaterialStateProperty.all<Color>(data!.backgroundColor!)
          : (backgroundColor != null)
              ? MaterialStateProperty.all<Color>(backgroundColor!)
              : Theme.of(context).searchBarTheme.backgroundColor,
      //TODO:The  same padding on material is bigger than cupertino
      padding: (data?.padding != null)
          ? MaterialStateProperty.all<EdgeInsetsGeometry>(data!.padding!)
          : (padding != null)
              ? MaterialStateProperty.all<EdgeInsetsGeometry>(padding!)
              : Theme.of(context).searchBarTheme.padding,
      //Mixed
      hintText: data?.hintText ?? hintText,
      hintStyle: MaterialStateProperty.all<TextStyle>(
        data?.hintStyle ?? hintStyle ?? TextStyle(),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        data?.textStyle ?? textStyle ?? TextStyle(),
      ),
      //Material only
      leading: data?.leading,
      trailing: data?.trailing,
      constraints: data?.constraints,
      elevation: data?.elevation,
      shadowColor: data?.shadowColor,
      surfaceTintColor: data?.surfaceTintColor,
      overlayColor: data?.overlayColor,
      side: data?.side,
      shape: data?.shape,
    );
  }

  @override
  CupertinoSearchTextField createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    return CupertinoSearchTextField(
      //Common
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      focusNode: data?.focusNode ?? focusNode,
      onTap: data?.onTap ?? onTap,
      onChanged: data?.onChanged ?? onChanged,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      padding: data?.padding ??
          padding ??
          const EdgeInsetsDirectional.fromSTEB(5.5, 8, 5.5, 8),
      //Mixed
      placeholder: data?.hintText ?? hintText,
      placeholderStyle: data?.hintStyle ?? hintStyle,
      style: data?.textStyle ?? textStyle,
      //Cupertino only
      onSubmitted: data?.onSubmitted,
      decoration: data?.decoration,
      borderRadius: data?.borderRadius,
      keyboardType: data?.keyboardType,
      itemColor: data?.itemColor ?? CupertinoColors.secondaryLabel,
      itemSize: data?.itemSize ?? 20.0,
      prefixInsets: data?.prefixInsets ??
          const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 3),
      prefixIcon: data?.prefixIcon ?? const Icon(CupertinoIcons.search),
      suffixInsets: data?.suffixInsets ??
          const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 2),
      suffixIcon:
          data?.suffixIcon ?? const Icon(CupertinoIcons.xmark_circle_fill),
      suffixMode: data?.suffixMode ?? OverlayVisibilityMode.editing,
      onSuffixTap: data?.onSuffixTap,
      restorationId: data?.restorationId,
      smartQuotesType: data?.smartQuotesType,
      smartDashesType: data?.smartDashesType,
      enableIMEPersonalizedLearning:
          data?.enableIMEPersonalizedLearning ?? true,
      autofocus: data?.autofocus ?? false,
      autocorrect: data?.autocorrect ?? true,
      enabled: data?.enabled,
    );
  }
}

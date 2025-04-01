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
    show AdaptiveTextSelectionToolbar, SearchBar;
import 'package:flutter/services.dart' show TextCapitalization, TextInputAction;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  const _BaseData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.autofocus,
    this.enabled,
  });

  final Key? widgetKey;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final bool? enabled;
}

class MaterialSearchBarData extends _BaseData {
  const MaterialSearchBarData({
    // Common
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.onTap,
    super.onChanged,
    super.autofocus,
    super.keyboardType,
    super.enabled,

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
    this.padding,
    this.backgroundColor,
    this.hintStyle,
    this.textStyle,
    this.hintText,
    this.onSubmitted,
    this.textCapitalization,
    this.textInputAction,
    this.contextMenuBuilder,
    this.onTapOutside,
    this.scrollPadding,
  });

  // final String? hintText;
  final Widget? leading;
  final Iterable<Widget>? trailing;
  final BoxConstraints? constraints;
  final WidgetStateProperty<double?>? elevation;
  final WidgetStateProperty<Color?>? shadowColor;
  final WidgetStateProperty<Color?>? surfaceTintColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final WidgetStateProperty<BorderSide?>? side;
  final WidgetStateProperty<OutlinedBorder?>? shape;
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<TextStyle?>? hintStyle;
  final WidgetStateProperty<TextStyle?>? textStyle;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TapRegionCallback? onTapOutside;
  final EdgeInsets? scrollPadding;
}

class CupertinoSearchBarData extends _BaseData {
  const CupertinoSearchBarData({
    //Common
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.onTap,
    super.onChanged,
    super.autofocus,
    super.keyboardType,
    super.enabled,

    //Cupertino
    this.onSubmitted,
    this.decoration,
    this.borderRadius,
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
    this.enableIMEPersonalizedLearning,
    this.autocorrect,
    this.padding,
    this.backgroundColor,
    this.placeholderStyle,
    this.style,
    this.placeholder,
    this.cursorColor,
    this.cursorHeight,
    this.cursorOpacityAnimates,
    this.cursorRadius,
    this.cursorWidth,
  }) : assert(
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
  final bool? enableIMEPersonalizedLearning;
  final bool? autocorrect;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final TextStyle? placeholderStyle;
  final TextStyle? style;
  final String? placeholder;
  final Color? cursorColor;
  final double? cursorHeight;
  final bool? cursorOpacityAnimates;
  final Radius? cursorRadius;
  final double? cursorWidth;
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
  final TextInputType? keyboardType;
  final bool? autoFocus;
  final bool? enabled;

  //Mixed
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  //Platform
  final PlatformBuilder<MaterialSearchBarData>? material;
  final PlatformBuilder<CupertinoSearchBarData>? cupertino;

  const PlatformSearchBar({
    //Common
    super.key,
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.backgroundColor,
    this.keyboardType,
    this.autoFocus,
    this.enabled,
    //Mixed
    this.hintText,
    this.hintStyle,
    this.textStyle,
    //Platform
    this.material,
    this.cupertino,
  });

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  SearchBar createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    final backgroundColor = this.backgroundColor;
    final hintStyle = this.hintStyle;
    final textStyle = this.textStyle;
    return SearchBar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      focusNode: data?.focusNode ?? focusNode,
      onTap: data?.onTap ?? onTap,
      onChanged: data?.onChanged ?? onChanged,

      backgroundColor:
          data?.backgroundColor ??
          (backgroundColor != null
              ? WidgetStateProperty.all<Color>(backgroundColor)
              : null),
      hintText: data?.hintText ?? hintText,
      hintStyle:
          data?.hintStyle ??
          (hintStyle != null
              ? WidgetStateProperty.all<TextStyle>(hintStyle)
              : null),
      textStyle:
          data?.textStyle ??
          (textStyle != null
              ? WidgetStateProperty.all<TextStyle>(textStyle)
              : null),
      autoFocus: data?.autofocus ?? autoFocus ?? false,
      keyboardType: data?.keyboardType ?? keyboardType,

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
      padding: data?.padding,
      onSubmitted: data?.onSubmitted,
      textCapitalization: data?.textCapitalization,
      textInputAction: data?.textInputAction,
      enabled: data?.enabled ?? enabled ?? true,
      contextMenuBuilder:
          data?.contextMenuBuilder ?? _defaultContextMenuBuilder,
      onTapOutside: data?.onTapOutside,
      scrollPadding: data?.scrollPadding ?? const EdgeInsets.all(20.0),
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
      padding:
          data?.padding ?? const EdgeInsetsDirectional.fromSTEB(5.5, 8, 5.5, 8),
      placeholder: data?.placeholder ?? hintText,
      placeholderStyle: data?.placeholderStyle ?? hintStyle,
      style: data?.style ?? textStyle,
      autofocus: data?.autofocus ?? autoFocus ?? false,
      keyboardType: data?.keyboardType ?? keyboardType ?? TextInputType.text,

      //Cupertino only
      onSubmitted: data?.onSubmitted,
      decoration: data?.decoration,
      borderRadius: data?.borderRadius,
      itemColor: data?.itemColor ?? CupertinoColors.secondaryLabel,
      itemSize: data?.itemSize ?? 20.0,
      prefixInsets:
          data?.prefixInsets ??
          const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 3),
      prefixIcon: data?.prefixIcon ?? const Icon(CupertinoIcons.search),
      suffixInsets:
          data?.suffixInsets ??
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
      autocorrect: data?.autocorrect ?? true,
      enabled: data?.enabled ?? enabled,
      cursorColor: data?.cursorColor,
      cursorHeight: data?.cursorHeight,
      cursorOpacityAnimates: data?.cursorOpacityAnimates ?? true,
      cursorRadius: data?.cursorRadius ?? const Radius.circular(2.0),
      cursorWidth: data?.cursorWidth ?? 2.0,
    );
  }
}

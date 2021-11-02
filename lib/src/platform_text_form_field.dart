import 'package:flutter/cupertino.dart'
    show CupertinoTextFormFieldRow, CupertinoColors;
import 'package:flutter/material.dart'
    show InputCounterWidgetBuilder, InputDecoration, TextFormField;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

class MaterialTextFormFieldData {
  final Key? widgetKey;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final bool? enableIMEPersonalizedLearning;
  final String? restorationId;

  MaterialTextFormFieldData({
    this.widgetKey,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus,
    this.readOnly,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.maxLengthEnforcement,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.enableIMEPersonalizedLearning,
    this.restorationId,
  });
}

class CupertinoTextFormFieldData {
  final Key? widgetKey;
  final Widget? prefix;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final String? initialValue;
  final BoxDecoration? decoration;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final String? placeholder;
  final TextStyle? placeholderStyle;
  final TextDirection? textDirection;

  CupertinoTextFormFieldData({
    this.widgetKey,
    this.prefix,
    this.padding,
    this.controller,
    this.initialValue,
    this.decoration,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus,
    this.readOnly,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.placeholder,
    this.placeholderStyle,
    this.textDirection,
  });
}

class PlatformTextFormField
    extends PlatformWidgetBase<CupertinoTextFormFieldRow, TextFormField> {
  final Key? widgetKey;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;

  final String? hintText;

  final PlatformBuilder<MaterialTextFormFieldData>? material;
  final PlatformBuilder<CupertinoTextFormFieldData>? cupertino;

  const PlatformTextFormField({
    Key? key,
    this.widgetKey,
    this.controller,
    this.initialValue,
    this.focusNode,
    TextInputType? keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus,
    this.readOnly,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.maxLines = 1,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.hintText,
    this.material,
    this.cupertino,
  })  : keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        super(key: key);

  @override
  TextFormField createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    final hintText = this.hintText;
    final decoration = hintText == null
        ? (data?.decoration ?? const InputDecoration())
        : _inputDecorationWithHint(
            hintText,
            data?.decoration ?? const InputDecoration(),
          );

    return TextFormField(
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      initialValue: data?.initialValue ?? initialValue,
      focusNode: data?.focusNode ?? focusNode,
      decoration: decoration,
      keyboardType: data?.keyboardType ?? keyboardType,
      textCapitalization: data?.textCapitalization ??
          textCapitalization ??
          TextCapitalization.none,
      textInputAction: data?.textInputAction ?? textInputAction,
      style: data?.style ?? style,
      strutStyle: data?.strutStyle ?? strutStyle,
      textAlign: data?.textAlign ?? textAlign ?? TextAlign.start,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      autofocus: data?.autofocus ?? autofocus ?? false,
      readOnly: data?.readOnly ?? readOnly ?? false,
      toolbarOptions: data?.toolbarOptions ?? toolbarOptions,
      showCursor: data?.showCursor ?? showCursor,
      obscuringCharacter: data?.obscuringCharacter ?? obscuringCharacter ?? '•',
      obscureText: data?.obscureText ?? obscureText ?? false,
      autocorrect: data?.autocorrect ?? autocorrect ?? true,
      smartDashesType: data?.smartDashesType ?? smartDashesType,
      smartQuotesType: data?.smartQuotesType ?? smartQuotesType,
      enableSuggestions: data?.enableSuggestions ?? enableSuggestions ?? true,
      maxLines: data?.maxLines ?? maxLines,
      minLines: data?.minLines ?? minLines,
      expands: data?.expands ?? expands ?? false,
      maxLength: data?.maxLength ?? maxLength,
      onChanged: data?.onChanged ?? onChanged,
      onTap: data?.onTap ?? onTap,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onFieldSubmitted: data?.onFieldSubmitted ?? onFieldSubmitted,
      onSaved: data?.onSaved ?? onSaved,
      validator: data?.validator ?? validator,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      enabled: data?.enabled ?? enabled,
      cursorWidth: data?.cursorWidth ?? cursorWidth ?? 2.0,
      cursorHeight: data?.cursorHeight ?? cursorHeight,
      cursorColor: data?.cursorColor ?? cursorColor,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      scrollPadding:
          data?.scrollPadding ?? scrollPadding ?? const EdgeInsets.all(20),
      enableInteractiveSelection: data?.enableInteractiveSelection ??
          enableInteractiveSelection ??
          true,
      selectionControls: data?.selectionControls ?? selectionControls,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      autofillHints: data?.autofillHints ?? autofillHints,
      autovalidateMode: data?.autovalidateMode ?? autovalidateMode,
      textDirection: data?.textDirection,
      maxLengthEnforcement: data?.maxLengthEnforcement,
      cursorRadius: data?.cursorRadius,
      buildCounter: data?.buildCounter,
      scrollController: data?.scrollController,
      enableIMEPersonalizedLearning:
          data?.enableIMEPersonalizedLearning ?? true,
      restorationId: data?.restorationId,
      //autovalidate: , deprecated
      //maxLengthEnforced: , deprecated
    );
  }

  @override
  CupertinoTextFormFieldRow createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoTextFormFieldRow(
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      initialValue: data?.initialValue ?? initialValue,
      focusNode: data?.focusNode ?? focusNode,
      decoration: data?.decoration,
      keyboardType: data?.keyboardType ?? keyboardType,
      textCapitalization: data?.textCapitalization ??
          textCapitalization ??
          TextCapitalization.none,
      textInputAction: data?.textInputAction ?? textInputAction,
      style: data?.style ?? style,
      strutStyle: data?.strutStyle ?? strutStyle,
      textAlign: data?.textAlign ?? textAlign ?? TextAlign.start,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      autofocus: data?.autofocus ?? autofocus ?? false,
      readOnly: data?.readOnly ?? readOnly ?? false,
      toolbarOptions: data?.toolbarOptions ?? toolbarOptions,
      showCursor: data?.showCursor ?? showCursor,
      obscuringCharacter: data?.obscuringCharacter ?? obscuringCharacter ?? '•',
      obscureText: data?.obscureText ?? obscureText ?? false,
      autocorrect: data?.autocorrect ?? autocorrect ?? true,
      smartDashesType: data?.smartDashesType ?? smartDashesType,
      smartQuotesType: data?.smartQuotesType ?? smartQuotesType,
      enableSuggestions: data?.enableSuggestions ?? enableSuggestions ?? true,
      maxLines: data?.maxLines ?? maxLines,
      minLines: data?.minLines ?? minLines,
      expands: data?.expands ?? expands ?? false,
      maxLength: data?.maxLength ?? maxLength,
      onChanged: data?.onChanged ?? onChanged,
      onTap: data?.onTap ?? onTap,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onFieldSubmitted: data?.onFieldSubmitted ?? onFieldSubmitted,
      onSaved: data?.onSaved ?? onSaved,
      validator: data?.validator ?? validator,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      enabled: data?.enabled ?? enabled,
      cursorWidth: data?.cursorWidth ?? cursorWidth ?? 2.0,
      cursorHeight: data?.cursorHeight ?? cursorHeight,
      cursorColor: data?.cursorColor ?? cursorColor,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      scrollPadding:
          data?.scrollPadding ?? scrollPadding ?? const EdgeInsets.all(20),
      enableInteractiveSelection: data?.enableInteractiveSelection ??
          enableInteractiveSelection ??
          true,
      selectionControls: data?.selectionControls ?? selectionControls,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      autofillHints: data?.autofillHints ?? autofillHints,
      autovalidateMode: data?.autovalidateMode ??
          autovalidateMode ??
          AutovalidateMode.disabled,
      prefix: data?.prefix,
      padding: data?.padding ?? const EdgeInsets.all(6.0),
      placeholder: data?.placeholder ?? hintText,
      placeholderStyle: data?.placeholderStyle ??
          const TextStyle(
            fontWeight: FontWeight.w400,
            color: CupertinoColors.placeholderText,
          ),
      textDirection: data?.textDirection,
    );
  }

  InputDecoration _inputDecorationWithHint(
    String hintText,
    InputDecoration inputDecoration,
  ) {
    return inputDecoration.copyWith(
      hintText: inputDecoration.hintText ?? hintText,
    );
  }
}

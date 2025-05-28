import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/cupertino.dart'
    show
        CupertinoAdaptiveTextSelectionToolbar,
        CupertinoColors,
        CupertinoTextFormFieldRow;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    show
        AdaptiveTextSelectionToolbar,
        InputCounterWidgetBuilder,
        InputDecoration,
        TextFormField;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.controller,
    this.initialValue,
    this.focusNode,
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
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.contextMenuBuilder,
    this.restorationId,
    this.spellCheckConfiguration,
  });

  final Key? widgetKey;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
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
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final String? restorationId;
  final SpellCheckConfiguration? spellCheckConfiguration;
}

class MaterialTextFormFieldData extends _BaseData {
  final InputDecoration? decoration;

  final MaxLengthEnforcement? maxLengthEnforcement;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollController? scrollController;
  final bool? enableIMEPersonalizedLearning;

  final MouseCursor? mouseCursor;
  final TapRegionCallback? onTapOutside;
  final TextMagnifierConfiguration? magnifierConfiguration;

  final bool? canRequestFocus;
  final Clip? clipBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final bool? cursorOpacityAnimates;
  final DragStartBehavior? dragStartBehavior;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final ui.BoxHeightStyle? selectionHeightStyle;
  final ui.BoxWidthStyle? selectionWidthStyle;
  final UndoHistoryController? undoController;
  final Color? cursorErrorColor;
  final bool? onTapAlwaysCalled;
  final WidgetStatesController? statesController;
  final String? forceErrorText;
  final bool? ignorePointers;
  final Object? groupId;
  final TapRegionUpCallback? onTapUpOutside;
  final bool? stylusHandwritingEnabled;
  final FormFieldErrorBuilder? errorBuilder;

  MaterialTextFormFieldData({
    super.widgetKey,
    super.controller,
    super.initialValue,
    super.focusNode,
    super.keyboardType,
    super.textCapitalization,
    super.textInputAction,
    super.style,
    super.strutStyle,
    super.textDirection,
    super.textAlign,
    super.textAlignVertical,
    super.autofocus,
    super.readOnly,
    super.showCursor,
    super.obscuringCharacter,
    super.obscureText,
    super.autocorrect,
    super.smartDashesType,
    super.smartQuotesType,
    super.enableSuggestions,
    super.maxLines,
    super.minLines,
    super.expands,
    super.maxLength,
    super.onChanged,
    super.onTap,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.validator,
    super.inputFormatters,
    super.enabled,
    super.cursorWidth,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorColor,
    super.keyboardAppearance,
    super.scrollPadding,
    super.enableInteractiveSelection,
    super.selectionControls,
    super.scrollPhysics,
    super.autofillHints,
    super.autovalidateMode,
    super.contextMenuBuilder,
    super.restorationId,
    super.spellCheckConfiguration,
    this.decoration,
    this.maxLengthEnforcement,
    this.buildCounter,
    this.scrollController,
    this.enableIMEPersonalizedLearning,
    this.mouseCursor,
    this.onTapOutside,
    this.magnifierConfiguration,
    this.canRequestFocus,
    this.clipBehavior,
    this.contentInsertionConfiguration,
    this.cursorOpacityAnimates,
    this.dragStartBehavior,
    this.onAppPrivateCommand,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.undoController,
    this.cursorErrorColor,
    this.onTapAlwaysCalled,
    this.statesController,
    this.forceErrorText,
    this.groupId,
    this.ignorePointers,
    this.onTapUpOutside,
    this.stylusHandwritingEnabled,
    this.errorBuilder,
  });
}

class CupertinoTextFormFieldData extends _BaseData {
  final Widget? prefix;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final String? placeholder;
  final TextStyle? placeholderStyle;

  CupertinoTextFormFieldData({
    super.widgetKey,
    super.controller,
    super.initialValue,
    super.focusNode,
    super.keyboardType,
    super.textCapitalization,
    super.textInputAction,
    super.style,
    super.strutStyle,
    super.textDirection,
    super.textAlign,
    super.textAlignVertical,
    super.autofocus,
    super.readOnly,
    super.showCursor,
    super.obscuringCharacter,
    super.obscureText,
    super.autocorrect,
    super.smartDashesType,
    super.smartQuotesType,
    super.enableSuggestions,
    super.maxLines,
    super.minLines,
    super.expands,
    super.maxLength,
    super.onChanged,
    super.onTap,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.validator,
    super.inputFormatters,
    super.enabled,
    super.cursorWidth,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorColor,
    super.keyboardAppearance,
    super.scrollPadding,
    super.enableInteractiveSelection,
    super.selectionControls,
    super.scrollPhysics,
    super.autofillHints,
    super.autovalidateMode,
    super.contextMenuBuilder,
    super.restorationId,
    super.spellCheckConfiguration,
    this.decoration,
    this.prefix,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
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
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final String? restorationId;
  final SpellCheckConfiguration? spellCheckConfiguration;

  final String? hintText;

  final PlatformBuilder<MaterialTextFormFieldData>? material;
  final PlatformBuilder<CupertinoTextFormFieldData>? cupertino;

  static Widget _defaultMaterialContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  static Widget _defaultCupertinoContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return CupertinoAdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  const PlatformTextFormField({
    super.key,
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
    this.contextMenuBuilder,
    this.restorationId,
    this.spellCheckConfiguration,
    this.hintText,
    this.material,
    this.cupertino,
  }) : keyboardType =
           keyboardType ??
           (maxLines == 1 ? TextInputType.text : TextInputType.multiline);

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
      textCapitalization:
          data?.textCapitalization ??
          textCapitalization ??
          TextCapitalization.none,
      textInputAction: data?.textInputAction ?? textInputAction,
      style: data?.style ?? style,
      strutStyle: data?.strutStyle ?? strutStyle,
      textAlign: data?.textAlign ?? textAlign ?? TextAlign.start,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      autofocus: data?.autofocus ?? autofocus ?? false,
      readOnly: data?.readOnly ?? readOnly ?? false,
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
      enableInteractiveSelection:
          data?.enableInteractiveSelection ??
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
      restorationId: data?.restorationId ?? restorationId,
      mouseCursor: data?.mouseCursor,
      contextMenuBuilder:
          data?.contextMenuBuilder ??
          contextMenuBuilder ??
          _defaultMaterialContextMenuBuilder,
      onTapOutside: data?.onTapOutside,
      magnifierConfiguration: data?.magnifierConfiguration,
      spellCheckConfiguration:
          data?.spellCheckConfiguration ?? spellCheckConfiguration,
      canRequestFocus: data?.canRequestFocus ?? true,
      clipBehavior: data?.clipBehavior ?? Clip.hardEdge,
      contentInsertionConfiguration: data?.contentInsertionConfiguration,
      cursorOpacityAnimates: data?.cursorOpacityAnimates,
      dragStartBehavior: data?.dragStartBehavior ?? DragStartBehavior.start,
      onAppPrivateCommand: data?.onAppPrivateCommand,
      selectionHeightStyle:
          data?.selectionHeightStyle ?? ui.BoxHeightStyle.tight,
      selectionWidthStyle: data?.selectionWidthStyle ?? ui.BoxWidthStyle.tight,
      undoController: data?.undoController,
      cursorErrorColor: data?.cursorErrorColor,
      onTapAlwaysCalled: data?.onTapAlwaysCalled ?? false,
      statesController: data?.statesController,
      forceErrorText: data?.forceErrorText,
      ignorePointers: data?.ignorePointers,
      groupId: data?.groupId ?? EditableText,
      onTapUpOutside: data?.onTapUpOutside,
      stylusHandwritingEnabled:
          data?.stylusHandwritingEnabled ??
          EditableText.defaultStylusHandwritingEnabled,
      errorBuilder: data?.errorBuilder,
      // toolbarOptions: , Deprecated
      // scribbleEnabled: deprecated
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
      textCapitalization:
          data?.textCapitalization ??
          textCapitalization ??
          TextCapitalization.none,
      textInputAction: data?.textInputAction ?? textInputAction,
      style: data?.style ?? style,
      strutStyle: data?.strutStyle ?? strutStyle,
      textAlign: data?.textAlign ?? textAlign ?? TextAlign.start,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      autofocus: data?.autofocus ?? autofocus ?? false,
      readOnly: data?.readOnly ?? readOnly ?? false,
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
      enableInteractiveSelection:
          data?.enableInteractiveSelection ??
          enableInteractiveSelection ??
          true,
      selectionControls: data?.selectionControls ?? selectionControls,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      autofillHints: data?.autofillHints ?? autofillHints,
      autovalidateMode:
          data?.autovalidateMode ??
          autovalidateMode ??
          AutovalidateMode.disabled,
      prefix: data?.prefix,
      padding: data?.padding ?? const EdgeInsets.all(6.0),
      placeholder: data?.placeholder ?? hintText,
      placeholderStyle:
          data?.placeholderStyle ??
          const TextStyle(
            fontWeight: FontWeight.w400,
            color: CupertinoColors.placeholderText,
          ),
      textDirection: data?.textDirection,
      contextMenuBuilder:
          data?.contextMenuBuilder ??
          contextMenuBuilder ??
          _defaultCupertinoContextMenuBuilder,
      restorationId: data?.restorationId ?? restorationId,
      spellCheckConfiguration:
          data?.spellCheckConfiguration ?? spellCheckConfiguration,
      // toolbarOptions: , Deprecated
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

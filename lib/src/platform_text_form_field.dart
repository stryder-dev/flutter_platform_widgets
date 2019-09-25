// Copyright 2015 The Chromium Authors. All rights reserved.
// Copyright 2019 Kevin Whitaker
//Redistribution and use in source and binary forms, with or without modification,
//are permitted provided that the following conditions are met:
//
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
//      copyright notice, this list of conditions and the following
//      disclaimer in the documentation and/or other materials provided
//      with the distribution.
//    * Neither the name of Google Inc. nor the names of its
//      contributors may be used to endorse or promote products derived
//      from this software without specific prior written permission.
//
//THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'platform_text_field.dart';

class PlatformTextFormField extends FormField<String> {
  PlatformTextFormField(
      {Key key,
      this.controller,
      String initialValue,
      FocusNode focusNode,
      TextInputType keyboardType,
      TextCapitalization textCapitalization = TextCapitalization.none,
      TextInputAction textInputAction,
      TextStyle style,
      StrutStyle strutStyle,
      TextDirection textDirection,
      TextAlign textAlign = TextAlign.start,
      TextAlignVertical textAlignVertical,
      bool autofocus = false,
      bool readOnly = false,
      ToolbarOptions toolbarOptions,
      bool showCursor,
      bool obscureText = false,
      bool autocorrect = true,
      bool autovalidate = false,
      bool maxLengthEnforced = true,
      int maxLines = 1,
      int minLines,
      bool expands = false,
      int maxLength,
      ValueChanged<String> onChanged,
      GestureTapCallback onTap,
      VoidCallback onEditingComplete,
      ValueChanged<String> onFieldSubmitted,
      FormFieldSetter<String> onSaved,
      FormFieldValidator<String> validator,
      List<TextInputFormatter> inputFormatters,
      bool enabled = true,
      double cursorWidth = 2.0,
      Radius cursorRadius,
      Color cursorColor,
      Brightness keyboardAppearance,
      EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
      bool enableInteractiveSelection = true,
      PlatformBuilder<MaterialTextFieldData> android,
      PlatformBuilder<CupertinoTextFieldData> ios})
      : assert(initialValue == null || controller == null),
        assert(textAlign != null),
        assert(autofocus != null),
        assert(readOnly != null),
        assert(obscureText != null),
        assert(autocorrect != null),
        assert(autovalidate != null),
        assert(maxLengthEnforced != null),
        assert(scrollPadding != null),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          'minLines can\'t be greater than maxLines',
        ),
        assert(expands != null),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(maxLength == null || maxLength > 0),
        assert(enableInteractiveSelection != null),
        super(
          key: key,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          autovalidate: autovalidate,
          enabled: enabled,
          builder: (FormFieldState<String> field) {
            final _PlatformTextFormFieldState state = field;
            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            return Container(
              margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
                child: Column(children: [
              PlatformTextField(
                android: field.hasError
                    ? (_) => MaterialTextFieldData(
                          widgetKey: android(_).widgetKey,
                          controller: android(_).controller,
                          focusNode: android(_).focusNode,
                          decoration: android(_)
                                  .decoration
                                  ?.copyWith(errorText: field.errorText) ??
                              InputDecoration(errorText: field.errorText),
                          keyboardType: android(_).keyboardType,
                          textInputAction: android(_).textInputAction,
                          textCapitalization: android(_).textCapitalization,
                          style: android(_).style,
                          textAlign: android(_).textAlign,
                          textDirection: android(_).textDirection,
                          autofocus: android(_).autofocus,
                          obscureText: android(_).obscureText,
                          autocorrect: android(_).autocorrect,
                          maxLines: android(_).maxLines,
                          maxLength: android(_).maxLength,
                          maxLengthEnforced: android(_).maxLengthEnforced,
                          onChanged: android(_).onChanged,
                          onEditingComplete: android(_).onEditingComplete,
                          onSubmitted: android(_).onSubmitted,
                          inputFormatters: android(_).inputFormatters,
                          enabled: android(_).enabled,
                          cursorWidth: android(_).cursorWidth,
                          cursorRadius: android(_).cursorRadius,
                          cursorColor: android(_).cursorColor,
                          keyboardAppearance: android(_).keyboardAppearance,
                          scrollPadding: android(_).scrollPadding,
                          enableInteractiveSelection:
                              android(_).enableInteractiveSelection,
                          onTap: android(_).onTap,
                          buildCounter: android(_).buildCounter,
                          dragStartBehavior: android(_).dragStartBehavior,
                          expands: android(_).expands,
                          minLines: android(_).minLines,
                          scrollPhysics: android(_).scrollPhysics,
                          strutStyle: android(_).strutStyle,
                          scrollController: android(_).scrollController,
                          readOnly: android(_).readOnly,
                          showCursor: android(_).showCursor,
                          textAlignVertical: android(_).textAlignVertical,
                          toolbarOptions: android(_).toolbarOptions,
                        )
                    : android,
                ios: field.hasError
                    ? (_) => CupertinoTextFieldData(
                          widgetKey: ios(_).widgetKey,
                          controller: ios(_).controller,
                          focusNode: ios(_).focusNode,
                          decoration: ios(_).decoration?.copyWith(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Color(Colors.redAccent.value))) ??
                              BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Color(Colors.redAccent.value))),
                          padding: ios(_).padding,
                          placeholder: ios(_).placeholder,
                          placeholderStyle: ios(_).placeholderStyle,
                          prefix: ios(_).prefix,
                          prefixMode: ios(_).prefixMode,
                          suffix: ios(_).suffix,
                          suffixMode: ios(_).suffixMode,
                          clearButtonMode: ios(_).clearButtonMode,
                          keyboardType: ios(_).keyboardType,
                          textInputAction: ios(_).textInputAction,
                          textCapitalization: ios(_).textCapitalization,
                          style: ios(_).style,
                          textAlign: ios(_).textAlign,
                          autofocus: ios(_).autofocus,
                          obscureText: ios(_).obscureText,
                          autocorrect: ios(_).autocorrect,
                          maxLines: ios(_).maxLines,
                          maxLength: ios(_).maxLength,
                          maxLengthEnforced: ios(_).maxLengthEnforced,
                          onChanged: ios(_).onChanged,
                          onEditingComplete: ios(_).onEditingComplete,
                          onSubmitted: ios(_).onSubmitted,
                          inputFormatters: ios(_).inputFormatters,
                          enabled: ios(_).enabled,
                          cursorWidth: ios(_).cursorWidth,
                          cursorRadius: ios(_).cursorRadius,
                          cursorColor: ios(_).cursorColor,
                          keyboardAppearance: ios(_).keyboardAppearance,
                          scrollPadding: ios(_).scrollPadding,
                          enableInteractiveSelection:
                              ios(_).enableInteractiveSelection,
                          onTap: ios(_).onTap,
                          dragStartBehavior: ios(_).dragStartBehavior,
                          expands: ios(_).expands,
                          minLines: ios(_).minLines,
                          scrollPhysics: ios(_).scrollPhysics,
                          strutStyle: ios(_).strutStyle,
                          scrollController: ios(_).scrollController,
                          readOnly: ios(_).readOnly,
                          showCursor: ios(_).showCursor,
                          textAlignVertical: ios(_).textAlignVertical,
                          toolbarOptions: ios(_).toolbarOptions,
                        )
                    : ios,
                controller: state._effectiveController,
                focusNode: focusNode,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                style: style,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textCapitalization: textCapitalization,
                autofocus: autofocus,
                toolbarOptions: toolbarOptions,
                readOnly: readOnly,
                showCursor: showCursor,
                obscureText: obscureText,
                autocorrect: autocorrect,
                maxLengthEnforced: maxLengthEnforced,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                onChanged: onChangedHandler,
                onTap: onTap,
                onEditingComplete: onEditingComplete,
                onSubmitted: onFieldSubmitted,
                inputFormatters: inputFormatters,
                enabled: enabled,
                cursorWidth: cursorWidth,
                cursorRadius: cursorRadius,
                cursorColor: cursorColor,
                scrollPadding: scrollPadding,
                keyboardAppearance: keyboardAppearance,
                enableInteractiveSelection: enableInteractiveSelection,
              ),
              field.hasError && isCupertino(field.context)
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: PlatformText(
                        field.errorText,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Color(Colors.red.value)),
                      ))
                  : Container()
            ]));
          },
        );
  final TextEditingController controller;

  @override
  _PlatformTextFormFieldState createState() => _PlatformTextFormFieldState();
}

class _PlatformTextFormFieldState extends FormFieldState<String> {
  TextEditingController _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  @override
  PlatformTextFormField get widget => super.widget;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(PlatformTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null)
        _controller =
            TextEditingController.fromValue(oldWidget.controller.value);
      if (widget.controller != null) {
        setValue(widget.controller.text);
        if (oldWidget.controller == null) _controller = null;
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController.text = widget.initialValue;
    });
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value)
      didChange(_effectiveController.text);
  }
}

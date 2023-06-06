/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show
        CupertinoPicker,
        CupertinoButton,
        CupertinoColors,
        showCupertinoModalPopup;

import 'package:flutter/material.dart'
    show
        DropdownMenuItem,
        DropdownButtonBuilder,
        DropdownButton,
        kMinInteractiveDimension;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    required this.items,
    required this.onChanged,
    this.value,
  });
  final Key? widgetKey;
  final List<DropdownMenuItem> items;
  final ValueChanged<dynamic> onChanged;
  final dynamic value;
}

class MaterialDropdownButtonData extends _BaseData {
  MaterialDropdownButtonData({
    // Common
    super.widgetKey,
    required super.items,
    required super.onChanged,
    super.value,

    //Material
    this.selectedItemBuilder,
    this.hint,
    this.disabledHint,
    this.onTap,
    this.elevation = 8,
    this.style,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight = kMinInteractiveDimension,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.dropdownColor,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
    this.borderRadius,
    this.padding,
  });
  final DropdownButtonBuilder? selectedItemBuilder;
  final Widget? hint;
  final Widget? disabledHint;
  final VoidCallback? onTap;
  final int elevation;
  final TextStyle? style;
  final Widget? underline;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double itemHeight;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? dropdownColor;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
}

class CupertinoDropdownButtonData extends _BaseData {
  CupertinoDropdownButtonData({
    //Common
    super.widgetKey,
    required super.items,
    required super.onChanged,
    super.value,

    //Cupertino
  });
}

class PlatformDropdownButton
    extends PlatformWidgetBase<CupertinoButton, DropdownButton> {
  //Common
  final Key? widgetKey;
  final List<DropdownMenuItem> items;
  final ValueChanged<dynamic> onChanged;
  final dynamic value;

  //Platform
  final PlatformBuilder<MaterialDropdownButtonData>? material;
  final PlatformBuilder<CupertinoDropdownButtonData>? cupertino;

  PlatformDropdownButton({
    //Common
    super.key,
    this.widgetKey,
    required this.items,
    required this.onChanged,
    this.value,
    //Platform
    this.material,
    this.cupertino,
  });

  @override
  DropdownButton createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return DropdownButton(
      //Common
      key: data?.widgetKey ?? widgetKey,
      items: data?.items ?? items,
      onChanged: data?.onChanged ?? onChanged,
      value: data?.value ?? value,

      //Material only
      selectedItemBuilder: data?.selectedItemBuilder,
      hint: data?.hint,
      disabledHint: data?.disabledHint,
      onTap: data?.onTap,
      elevation: data?.elevation ?? 8,
      style: data?.style,
      underline: data?.underline,
      icon: data?.icon,
      iconDisabledColor: data?.iconDisabledColor,
      iconEnabledColor: data?.iconEnabledColor,
      iconSize: data?.iconSize ?? 24.0,
      isDense: data?.isDense ?? false,
      isExpanded: data?.isExpanded ?? false,
      itemHeight: data?.itemHeight ?? kMinInteractiveDimension,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      autofocus: data?.autofocus ?? false,
      dropdownColor: data?.dropdownColor,
      menuMaxHeight: data?.menuMaxHeight,
      enableFeedback: data?.enableFeedback,
      alignment: data?.alignment ?? AlignmentDirectional.centerStart,
      borderRadius: data?.borderRadius,
      padding: data?.padding,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    void _showCupertinoPicker() {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: CupertinoPicker(
              itemExtent: 32.0,
              onSelectedItemChanged: (int index) {
                if (data?.onChanged != null)
                  data?.onChanged(items[index].value);
                else
                  onChanged(items[index].value);
              },
              children: data?.items != null
                  ? data!.items.map((e) => e.child).toList()
                  : items.map((e) => e.child).toList(),
            ),
          ),
        ),
      );
    }

    return CupertinoButton(
      // Common
      key: data?.widgetKey ?? widgetKey,
      onPressed: () {
        _showCupertinoPicker();
      },
      child: data?.value != null
          ? Text('${data!.value}')
          : value != null
              ? Text('$value')
              : Text('Cupertino'),
    );
  }
}

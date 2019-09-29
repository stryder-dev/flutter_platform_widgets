/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show DropdownButton, DropdownMenuItem;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

class PlatformSelectItem<T> {
  PlatformSelectItem({
    this.id,
    this.label,
    this.data,
  });

  final T id;
  final String label;
  final dynamic data;
}

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.initialValue,
    this.availableValues,
    this.onChanged,
  });

  final Key widgetKey;

  final PlatformSelectItem initialValue;
  final List<PlatformSelectItem> availableValues;
  final ValueChanged<PlatformSelectItem> onChanged;
}

class MaterialSelectData extends _BaseData {
  MaterialSelectData({
    Key widgetKey,
    PlatformSelectItem initialValue,
    List<PlatformSelectItem> availableValues,
    ValueChanged<PlatformSelectItem> onChanged,
    this.disabledHint,
    this.elevation,
    this.hint,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize,
    this.isDense,
    this.isExpanded,
    this.style,
    this.underline,
  }) : super(
            widgetKey: widgetKey,
            initialValue: initialValue,
            availableValues: availableValues,
            onChanged: onChanged);

  final Widget disabledHint;
  final int elevation;
  final Widget hint;
  final Widget icon;
  final Color iconDisabledColor;
  final Color iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final TextStyle style;
  final Widget underline;
}

class CupertinoSelectData extends _BaseData {
  CupertinoSelectData({
    Key widgetKey,
    PlatformSelectItem initialValue,
    ValueChanged<PlatformSelectItem> onChanged,
    List<PlatformSelectItem> availableValues,
    this.pickerHeight,
    this.itemHeight,
  }) : super(
            widgetKey: widgetKey,
            initialValue: initialValue,
            onChanged: onChanged,
            availableValues: availableValues);
  
  final double pickerHeight;
  final double itemHeight;
}

class PlatformSelect extends PlatformWidgetBase<CupertinoButton, DropdownButton<PlatformSelectItem>> {
  final Key widgetKey;

  PlatformSelectItem initialValue;
  List<PlatformSelectItem> availableValues;
  final ValueChanged<PlatformSelectItem> onChanged;
  PlatformSelectItem _currentValue;

  final PlatformBuilder<MaterialSelectData> android;
  final PlatformBuilder<CupertinoSelectData> ios;

  PlatformSelect(
      {Key key,
      this.widgetKey,
      @required this.initialValue,
      @required this.availableValues,
      @required this.onChanged,
      this.android,
      this.ios})
      : assert(initialValue != null),
        assert(availableValues != null),
        super(key: key) {
          this._currentValue = this.initialValue;
        }

  @override
  DropdownButton<PlatformSelectItem> createAndroidWidget(BuildContext context) {
    MaterialSelectData data;
    if (android != null) {
      data = android(context);
    }

    List<DropdownMenuItem<PlatformSelectItem>> items = (data?.availableValues ?? availableValues)
      .map<DropdownMenuItem<PlatformSelectItem>>((PlatformSelectItem item) {
        return DropdownMenuItem<PlatformSelectItem>(
          value: item,
          child: Text(item.label),
        );
      })
      .toList();

    return DropdownButton<PlatformSelectItem>(
      key: data?.widgetKey ?? widgetKey,
      value: data?.initialValue ?? initialValue,
      icon: data?.icon,
      iconSize: data?.iconSize,
      elevation: data?.elevation,
      style: data?.style,
      underline: data?.underline,
      onChanged: data?.onChanged ?? onChanged,
      items: items
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    CupertinoSelectData data;
    if (ios != null) {
      data = ios(context);
    }

    availableValues = data?.availableValues ?? availableValues;
    initialValue = data?.initialValue ?? initialValue;

    CupertinoButton button = CupertinoButton(
      child: Row(
        children: <Widget>[
          Text(initialValue.label),
          Icon(
            IconData(
              0xf3d1,
              fontFamily: CupertinoIcons.iconFont,
              fontPackage: CupertinoIcons.iconFontPackage
            )
          )
        ],
      ),
      onPressed: () async {
        await showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: data?.pickerHeight ?? 216.0,
              padding: const EdgeInsets.only(top: 6.0),
              color: CupertinoColors.white,
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 22.0,
                ),
                child: GestureDetector(
                  // Blocks taps from propagating to the modal sheet and popping.
                  onTap: () { },
                  child: SafeArea(
                    top: false,
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: availableValues.indexOf(initialValue)
                      ),
                      itemExtent: data?.itemHeight ?? 32.0,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        (data?.onChanged ?? onChanged)(availableValues[index]);
                      },
                      children: List<Widget>.generate(availableValues.length, (int index) {
                        return Center(
                          child: Text(availableValues[index].label),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    return button;
  }
}
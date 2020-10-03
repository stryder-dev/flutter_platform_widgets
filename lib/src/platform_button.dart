/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton, CupertinoColors;
import 'package:flutter/material.dart'
    show
        Brightness,
        ButtonTextTheme,
        FlatButton,
        MaterialButton,
        MaterialTapTargetSize,
        RaisedButton,
        VisualDensity;
import 'package:flutter/rendering.dart' show MouseCursor;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const double _kMinInteractiveDimensionCupertino = 44.0;

abstract class _BaseData {
  _BaseData(
      {this.widgetKey,
      this.child,
      this.color,
      this.onPressed,
      this.padding,
      this.disabledColor});

  final Key widgetKey;
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Color disabledColor;
}

class MaterialFlatButtonData extends _BaseData {
  MaterialFlatButtonData({
    Key widgetKey,
    Widget child,
    Color color,
    VoidCallback onPressed,
    EdgeInsetsGeometry padding,
    Color disabledColor,
    this.animationDuration,
    this.colorBrightness,
    this.disabledElevation,
    this.disabledTextColor,
    this.elevation,
    this.highlightColor,
    this.highlightElevation,
    this.onHighlightChanged,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.focusElevation,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.hoverElevation,
    this.autofocus,
    this.onLongPress,
    this.visualDensity,
    this.mouseCursor,
    this.height,
    this.minWidth,
  }) : super(
          widgetKey: widgetKey,
          child: child,
          color: color,
          onPressed: onPressed,
          padding: padding,
          disabledColor: disabledColor,
        );

  final Duration animationDuration;
  final Brightness colorBrightness;

  final double disabledElevation;
  final Color disabledTextColor;
  final double elevation;
  final Color highlightColor;
  final double highlightElevation;
  final ValueChanged<bool> onHighlightChanged;
  final ShapeBorder shape;
  final Color splashColor;
  final Color textColor;
  final ButtonTextTheme textTheme;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final double focusElevation;
  final Color focusColor;
  final Color hoverColor;
  final FocusNode focusNode;
  final double hoverElevation;
  final bool autofocus;
  final VoidCallback onLongPress;
  final VisualDensity visualDensity;
  final MouseCursor mouseCursor;
  final double height;
  final double minWidth;
}

class MaterialRaisedButtonData extends _BaseData {
  MaterialRaisedButtonData({
    Key widgetKey,
    Widget child,
    Color color,
    VoidCallback onPressed,
    EdgeInsetsGeometry padding,
    Color disabledColor,
    this.animationDuration,
    this.colorBrightness,
    this.disabledElevation,
    this.disabledTextColor,
    this.elevation,
    this.highlightColor,
    this.highlightElevation,
    this.onHighlightChanged,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.focusElevation,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.hoverElevation,
    this.autofocus,
    this.onLongPress,
    this.visualDensity,
    this.mouseCursor,
  }) : super(
          widgetKey: widgetKey,
          child: child,
          color: color,
          onPressed: onPressed,
          padding: padding,
          disabledColor: disabledColor,
        );

  final Duration animationDuration;
  final Brightness colorBrightness;

  final double disabledElevation;
  final Color disabledTextColor;
  final double elevation;
  final Color highlightColor;
  final double highlightElevation;
  final ValueChanged<bool> onHighlightChanged;
  final ShapeBorder shape;
  final Color splashColor;
  final Color textColor;
  final ButtonTextTheme textTheme;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final double focusElevation;
  final Color focusColor;
  final Color hoverColor;
  final FocusNode focusNode;
  final double hoverElevation;
  final bool autofocus;
  final VoidCallback onLongPress;
  final VisualDensity visualDensity;
  final MouseCursor mouseCursor;
}

class CupertinoButtonData extends _BaseData {
  CupertinoButtonData({
    Key widgetKey,
    Widget child,
    Color color,
    VoidCallback onPressed,
    EdgeInsetsGeometry padding,
    Color disabledColor,
    this.borderRadius,
    this.minSize,
    this.pressedOpacity,
  }) : super(
            widgetKey: widgetKey,
            child: child,
            color: color,
            onPressed: onPressed,
            padding: padding,
            disabledColor: disabledColor);

  final BorderRadius borderRadius;
  final double minSize;
  final double pressedOpacity;
}

class CupertinoFilledButtonData extends _BaseData {
  CupertinoFilledButtonData({
    Key widgetKey,
    Widget child,
    VoidCallback onPressed,
    EdgeInsetsGeometry padding,
    Color disabledColor,
    this.borderRadius,
    this.minSize,
    this.pressedOpacity,
  }) : super(
            widgetKey: widgetKey,
            child: child,
            onPressed: onPressed,
            padding: padding,
            disabledColor: disabledColor);

  final BorderRadius borderRadius;
  final double minSize;
  final double pressedOpacity;
}

class PlatformButton
    extends PlatformWidgetBase<CupertinoButton, MaterialButton> {
  final Key widgetKey;

  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Color disabledColor;

  final PlatformBuilder2<MaterialRaisedButtonData> material;
  final PlatformBuilder2<MaterialFlatButtonData> materialFlat;
  final PlatformBuilder2<CupertinoButtonData> cupertino;
  final PlatformBuilder2<CupertinoFilledButtonData> cupertinoFilled;

  PlatformButton({
    Key key,
    this.widgetKey,
    this.child,
    this.onPressed,
    this.color,
    this.disabledColor,
    this.padding,
    this.material,
    this.materialFlat,
    this.cupertino,
    this.cupertinoFilled,
  }) : super(key: key);

  @override
  MaterialButton createMaterialWidget(BuildContext context) {
    if (materialFlat != null) {
      final dataFlat = materialFlat(context, platform(context));

      return FlatButton(
        key: dataFlat?.widgetKey ?? widgetKey,
        child: dataFlat?.child ?? child,
        onPressed: dataFlat?.onPressed ?? onPressed,
        color: dataFlat?.color ?? color,
        colorBrightness: dataFlat?.colorBrightness,
        disabledColor: dataFlat?.disabledColor ?? disabledColor,
        disabledTextColor: dataFlat?.disabledTextColor,
        highlightColor: dataFlat?.highlightColor,
        onHighlightChanged: dataFlat?.onHighlightChanged,
        padding: dataFlat?.padding ?? padding,
        shape: dataFlat?.shape,
        splashColor: dataFlat?.splashColor,
        textColor: dataFlat?.textColor,
        textTheme: dataFlat?.textTheme,
        clipBehavior: dataFlat?.clipBehavior ?? Clip.none,
        materialTapTargetSize: dataFlat?.materialTapTargetSize,
        focusColor: dataFlat?.focusColor,
        focusNode: dataFlat?.focusNode,
        hoverColor: dataFlat?.hoverColor,
        autofocus: dataFlat?.autofocus ?? false,
        onLongPress: dataFlat?.onLongPress,
        visualDensity: dataFlat?.visualDensity,
        mouseCursor: dataFlat?.mouseCursor,
        height: dataFlat?.height,
        minWidth: dataFlat?.minWidth,
      );
    }

    final dataRaised = material?.call(context, platform(context));

    return RaisedButton(
      key: dataRaised?.widgetKey ?? widgetKey,
      child: dataRaised?.child ?? child,
      onPressed: dataRaised?.onPressed ?? onPressed,
      animationDuration: dataRaised?.animationDuration,
      color: dataRaised?.color ?? color,
      colorBrightness: dataRaised?.colorBrightness,
      disabledColor: dataRaised?.disabledColor ?? disabledColor,
      disabledElevation: dataRaised?.disabledElevation,
      disabledTextColor: dataRaised?.disabledTextColor,
      elevation: dataRaised?.elevation,
      highlightColor: dataRaised?.highlightColor,
      highlightElevation: dataRaised?.highlightElevation,
      onHighlightChanged: dataRaised?.onHighlightChanged,
      padding: dataRaised?.padding ?? padding,
      shape: dataRaised?.shape,
      splashColor: dataRaised?.splashColor,
      textColor: dataRaised?.textColor,
      textTheme: dataRaised?.textTheme,
      clipBehavior: dataRaised?.clipBehavior ?? Clip.none,
      materialTapTargetSize: dataRaised?.materialTapTargetSize,
      focusElevation: dataRaised?.focusElevation,
      focusColor: dataRaised?.focusColor,
      hoverColor: dataRaised?.hoverColor,
      focusNode: dataRaised?.focusNode,
      hoverElevation: dataRaised?.hoverElevation,
      autofocus: dataRaised?.autofocus ?? false,
      onLongPress: dataRaised?.onLongPress,
      visualDensity: dataRaised?.visualDensity,
      mouseCursor: dataRaised?.mouseCursor,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    if (cupertinoFilled != null) {
      final filledData = cupertinoFilled(context, platform(context));

      return CupertinoButton.filled(
        key: filledData?.widgetKey ?? widgetKey,
        child: filledData?.child ?? child,
        onPressed: filledData?.onPressed ?? onPressed,
        borderRadius: filledData?.borderRadius ??
            const BorderRadius.all(const Radius.circular(8.0)),
        minSize: filledData?.minSize ?? _kMinInteractiveDimensionCupertino,
        padding: filledData?.padding ?? padding,
        pressedOpacity: filledData?.pressedOpacity ?? 0.4,
        disabledColor: filledData?.disabledColor ??
            disabledColor ??
            CupertinoColors.quaternarySystemFill,
      );
    }

    final data = cupertino?.call(context, platform(context));

    return CupertinoButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child,
      onPressed: data?.onPressed ?? onPressed,
      borderRadius: data?.borderRadius ??
          const BorderRadius.all(const Radius.circular(8.0)),
      color: data?.color ?? color,
      minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
      padding: data?.padding ?? padding,
      pressedOpacity: data?.pressedOpacity ?? 0.4,
      disabledColor: data?.disabledColor ??
          disabledColor ??
          CupertinoColors.quaternarySystemFill,
    );
  }
}

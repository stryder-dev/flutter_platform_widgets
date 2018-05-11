/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart' show IconButton;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.icon, this.onPressed, this.padding, this.color});

  final Icon icon;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color color;
}

class CupertinoIconButtonData extends _BaseData {
  CupertinoIconButtonData(
      {Icon icon,
      VoidCallback onPressed,
      EdgeInsets padding,
      Color color,
      this.borderRadius,
      this.minSize: 44.0,
      this.pressedOpacity: 0.1})
      : super(icon: icon, onPressed: onPressed, padding: padding, color: color);

  final BorderRadius borderRadius;
  final double minSize;
  final double pressedOpacity;
}

class MaterialIconButtonData extends _BaseData {
  MaterialIconButtonData(
      {Icon icon,
      VoidCallback onPressed,
      EdgeInsets padding,
      Color color,
      this.alignment,
      this.disabledColor,
      this.highlightColor,
      this.iconSize: 24.0,
      this.splashColor,
      this.tooltip})
      : super(icon: icon, onPressed: onPressed, padding: padding, color: color);

  final AlignmentGeometry alignment;
  final Color disabledColor;
  final Color highlightColor;
  final double iconSize;
  final Color splashColor;
  final String tooltip;
}

class PlatformIconButton extends PlatformWidgetBase<CupertinoButton, Widget> {
  final Key widgetKey;

  final Icon icon;
  final Icon iosIcon;
  final Icon androidIcon;
  final VoidCallback onPressed;
  final Color color;
  final EdgeInsets padding;

  final PlatformBuilder<MaterialIconButtonData> android;
  final PlatformBuilder<CupertinoIconButtonData> ios;

  PlatformIconButton(
      {Key key,
      this.widgetKey,
      this.icon,
      this.iosIcon,
      this.androidIcon,
      this.onPressed,
      this.color,
      this.padding,
      this.android,
      this.ios})
      : super(key: key);

  @override
  Widget createAndroidWidget(BuildContext context) {
    MaterialIconButtonData data;
    if (android != null) {
      data = android(context);
    }

    return IconButton(
      key: widgetKey,
      icon: data?.icon ?? androidIcon ?? icon,
      onPressed: data?.onPressed ?? onPressed,
      padding: data?.padding ?? padding ?? const EdgeInsets.all(8.0),
      color: data?.color ?? color,
      alignment: data?.alignment ?? Alignment.center,
      disabledColor: data?.disabledColor,
      highlightColor: data?.highlightColor,
      iconSize: data?.iconSize ?? 24.0,
      splashColor: data?.splashColor,
      tooltip: data?.tooltip,
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    CupertinoIconButtonData data;
    if (android != null) {
      data = ios(context);
    }

    return CupertinoButton(
      child: data?.icon ?? iosIcon ?? icon,
      onPressed: data?.onPressed ?? onPressed,
      padding: data?.padding ?? padding ?? const EdgeInsets.all(0.0),
      color: data?.color ?? color,
      borderRadius: data?.borderRadius ??
          const BorderRadius.all(const Radius.circular(8.0)),
      minSize: data?.minSize ?? 44.0,
      pressedOpacity: data?.pressedOpacity ?? 0.1,
    );
  }
}

// PlatformIconButton(
//   iosIcon: CupertinoIcons.flag, //type IconData
//   androidIcon: Icons.flag, //type IconData
//   onPressed: () => {},
//   ios: (_) => CupertinoIconButtonData(icon: CupertinoIcons.flag),
//   android: (_) => MaterialIconButtonData(icon: Icons.flag),
// )

// Widget materialButtonIcon(IconData icon) {
//   return Material(
//     child: IconButton(
//       icon: Icon(icon),
//       onPressed: () => {},
//     ),
//   );
// }

// Widget cupertinoButtonIcon(IconData icon) {
//   return CupertinoButton(
//     padding: EdgeInsets.all(6.0),
//     child: Icon(
//       icon,
//       size: 28.0,
//     ),
//     onPressed: () => {},
//   );
// }

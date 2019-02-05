/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoAlertDialog;
import 'package:flutter/material.dart' show AlertDialog;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.widgetKey, this.actions, this.content, this.title});

  final Key widgetKey;
  final List<Widget> actions;
  final Widget content;
  final Widget title;
}

class MaterialAlertDialogData extends _BaseData {
  MaterialAlertDialogData(
      {Key widgetKey,
      List<Widget> actions,
      Widget content,
      Widget title,
      this.contentTextStyle,
      this.backgroundColor,
      this.elevation,
      this.shape,
      this.contentPadding,
      this.semanticLabel,
      this.titlePadding})
      : super(
            widgetKey: widgetKey,
            actions: actions,
            content: content,
            title: title);

  final EdgeInsetsGeometry contentPadding;
  final String semanticLabel;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle contentTextStyle;
  final Color backgroundColor;
  final double elevation;
  final ShapeBorder shape;
}

class CupertinoAlertDialogData extends _BaseData {
  CupertinoAlertDialogData(
      {Key widgetKey,
      List<Widget> actions,
      Widget content,
      Widget title,
      this.scrollController,
      this.actionScrollController})
      : super(
            widgetKey: widgetKey,
            actions: actions,
            content: content,
            title: title);

  final ScrollController scrollController;
  final ScrollController actionScrollController;
}

class PlatformAlertDialog
    extends PlatformWidgetBase<CupertinoAlertDialog, AlertDialog> {
  final Key widgetKey;
  final List<Widget> actions;
  final Widget content;
  final Widget title;

  final PlatformBuilder<MaterialAlertDialogData> android;
  final PlatformBuilder<CupertinoAlertDialogData> ios;

  PlatformAlertDialog(
      {Key key,
      this.widgetKey,
      this.actions,
      this.content,
      this.title,
      this.ios,
      this.android})
      : super(key: key);

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    MaterialAlertDialogData data;
    if (android != null) {
      data = android(context);
    }

    return AlertDialog(
        key: data?.widgetKey ?? widgetKey,
        actions: data?.actions ?? actions,
        content: data?.content ?? content,
        contentPadding: data?.contentPadding ??
            const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
        semanticLabel: data?.semanticLabel,
        title: data?.title ?? title,
        titlePadding: data?.titlePadding,
        contentTextStyle: data?.contentTextStyle,
        backgroundColor: data?.backgroundColor,
        elevation: data?.elevation,
        shape: data?.shape);
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    CupertinoAlertDialogData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoAlertDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions ?? const <Widget>[],
      content: data?.content ?? content,
      scrollController: data?.scrollController,
      actionScrollController: data?.actionScrollController,
      title: data?.title ?? title,
    );
  }
}

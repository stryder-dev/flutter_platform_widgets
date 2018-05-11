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
  _BaseData({this.actions, this.content, this.title});

  final List<Widget> actions;
  final Widget content;
  final Widget title;
}

class MaterialAlertDialogData extends _BaseData {
  MaterialAlertDialogData(
      {List<Widget> actions,
      Widget content,
      Widget title,
      this.contentPadding,
      this.semanticLabel,
      this.titlePadding})
      : super(actions: actions, content: content, title: title);

  final EdgeInsetsGeometry contentPadding;
  final String semanticLabel;
  final EdgeInsetsGeometry titlePadding;
}

class CupertinoAlertDialogData extends _BaseData {
  CupertinoAlertDialogData(
      {List<Widget> actions,
      Widget content,
      Widget title,
      this.scrollController})
      : super(actions: actions, content: content, title: title);

  final ScrollController scrollController;
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
      key: widgetKey,
      actions: data?.actions ?? actions,
      content: data?.content ?? content,
      contentPadding: data?.contentPadding ??
          const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      semanticLabel: data?.semanticLabel,
      title: data?.title ?? title,
      titlePadding: data?.titlePadding,
    );
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    CupertinoAlertDialogData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoAlertDialog(
      key: widgetKey,
      actions: data?.actions ?? actions,
      content: data?.content ?? content,
      scrollController: data?.scrollController,
      title: data?.title ?? title,
    );
  }
}

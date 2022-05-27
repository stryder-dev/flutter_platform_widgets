/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoAlertDialog;
import 'package:flutter/material.dart' show AlertDialog;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.actions,
    this.content,
    this.title,
  });

  final Key? widgetKey;
  final List<Widget>? actions;
  final Widget? content;
  final Widget? title;
}

class MaterialAlertDialogData extends _BaseData {
  MaterialAlertDialogData({
    super.widgetKey,
    super.actions,
    super.content,
    super.title,
    this.contentTextStyle,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.contentPadding,
    this.semanticLabel,
    this.titlePadding,
    this.titleTextStyle,
    this.scrollable,
    this.actionsOverflowDirection,
    this.actionsPadding,
    this.buttonPadding,
    this.actionsOverflowButtonSpacing,
    this.clipBehavior,
    this.insetPadding,
    this.actionsAlignment,
    this.alignment,
    this.actionsOverflowAlignment,
  });

  final EdgeInsetsGeometry? contentPadding;
  final String? semanticLabel;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? contentTextStyle;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final TextStyle? titleTextStyle;
  final bool? scrollable;
  final VerticalDirection? actionsOverflowDirection;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? buttonPadding;
  final double? actionsOverflowButtonSpacing;
  final Clip? clipBehavior;
  final EdgeInsets? insetPadding;
  final MainAxisAlignment? actionsAlignment;
  final AlignmentGeometry? alignment;
  final OverflowBarAlignment? actionsOverflowAlignment;
}

class CupertinoAlertDialogData extends _BaseData {
  CupertinoAlertDialogData({
    super.widgetKey,
    super.actions,
    super.content,
    super.title,
    this.scrollController,
    this.actionScrollController,
    this.insetAnimationCurve,
    this.insetAnimationDuration,
  });

  final ScrollController? scrollController;
  final ScrollController? actionScrollController;
  final Curve? insetAnimationCurve;
  final Duration? insetAnimationDuration;
}

class PlatformAlertDialog
    extends PlatformWidgetBase<CupertinoAlertDialog, AlertDialog> {
  final Key? widgetKey;
  final List<Widget>? actions;
  final Widget? content;
  final Widget? title;

  final PlatformBuilder<MaterialAlertDialogData>? material;
  final PlatformBuilder<CupertinoAlertDialogData>? cupertino;

  final PlatformBuilder? customData;

  PlatformAlertDialog({
    super.key,
    this.widgetKey,
    this.actions,
    this.content,
    this.title,
    this.material,
    this.cupertino,
    this.customData,
  });

  @protected
  Widget? buildPlatformWidget(BuildContext context, CustomWidgetBuilder b) {
    return b.alertDialogBuilder
        ?.call(this, customData?.call(context, platform(context)));
  }

  @override
  AlertDialog createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

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
      shape: data?.shape,
      titleTextStyle: data?.titleTextStyle,
      scrollable: data?.scrollable ?? false,
      actionsOverflowDirection: data?.actionsOverflowDirection,
      actionsPadding: data?.actionsPadding ?? EdgeInsets.zero,
      buttonPadding: data?.buttonPadding,
      actionsOverflowButtonSpacing: data?.actionsOverflowButtonSpacing,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      insetPadding: data?.insetPadding ?? _defaultInsetPadding,
      actionsAlignment: data?.actionsAlignment,
      alignment: data?.alignment,
      actionsOverflowAlignment: data?.actionsOverflowAlignment,
    );
  }

  @override
  CupertinoAlertDialog createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    Curve? curve = data?.insetAnimationCurve;

    return CupertinoAlertDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions ?? const <Widget>[],
      content: data?.content ?? content,
      scrollController: data?.scrollController,
      actionScrollController: data?.actionScrollController,
      title: data?.title ?? title,
      insetAnimationCurve: curve ?? Curves.decelerate,
      insetAnimationDuration:
          data?.insetAnimationDuration ?? Duration(milliseconds: 100),
    );
  }
}

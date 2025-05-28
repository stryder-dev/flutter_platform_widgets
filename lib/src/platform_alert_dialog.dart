/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoAlertDialog;
import 'package:flutter/material.dart' show AlertDialog, Material;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/src/extensions.dart';

import 'platform.dart';
import 'platform_provider.dart';
import 'widget_base.dart';

const EdgeInsets _defaultInsetPadding = EdgeInsets.symmetric(
  horizontal: 40.0,
  vertical: 24.0,
);

abstract class _BaseData {
  _BaseData({this.widgetKey, this.actions, this.content, this.title});

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
    this.icon,
    this.iconColor,
    this.iconPadding,
    this.shadowColor,
    this.surfaceTintColor,
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
  final Widget? icon;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final Color? shadowColor;
  final Color? surfaceTintColor;
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

class PlatformAlertDialog extends PlatformWidgetBase<Widget, AlertDialog> {
  final Key? widgetKey;
  final List<Widget>? actions;
  final Widget? content;
  final Widget? title;

  final PlatformBuilder<MaterialAlertDialogData>? material;
  final PlatformBuilder<CupertinoAlertDialogData>? cupertino;

  const PlatformAlertDialog({
    super.key,
    this.widgetKey,
    this.actions,
    this.content,
    this.title,
    this.material,
    this.cupertino,
  });

  @override
  AlertDialog createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return AlertDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions,
      content: data?.content ?? content,
      contentPadding: data?.contentPadding,
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
      actionsPadding: data?.actionsPadding,
      buttonPadding: data?.buttonPadding,
      actionsOverflowButtonSpacing: data?.actionsOverflowButtonSpacing,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      insetPadding: data?.insetPadding ?? _defaultInsetPadding,
      actionsAlignment: data?.actionsAlignment,
      alignment: data?.alignment,
      actionsOverflowAlignment: data?.actionsOverflowAlignment,
      icon: data?.icon,
      iconColor: data?.iconColor,
      iconPadding: data?.iconPadding,
      shadowColor: data?.shadowColor,
      surfaceTintColor: data?.surfaceTintColor,
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    final Curve? curve = data?.insetAnimationCurve;

    final providerState = PlatformProvider.of(context);
    final useLegacyMaterial =
        providerState?.settings.legacyIosUsesMaterialWidgets ?? false;
    final useMaterial = providerState?.settings.iosUsesMaterialWidgets ?? false;

    final result = CupertinoAlertDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions ?? const <Widget>[],
      content: (data?.content ?? content)?.withMaterial(useMaterial),
      scrollController: data?.scrollController,
      actionScrollController: data?.actionScrollController,
      title: data?.title ?? title,
      insetAnimationCurve: curve ?? Curves.decelerate,
      insetAnimationDuration:
          data?.insetAnimationDuration ?? const Duration(milliseconds: 100),
    );

    // Ensure that there is Material widget at the root page level
    // as there can be Material widgets used on ios
    return result.withMaterial(
      useLegacyMaterial &&
          context.findAncestorWidgetOfExactType<Material>() == null,
    );
  }
}

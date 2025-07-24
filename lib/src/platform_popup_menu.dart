import 'package:flutter/cupertino.dart'
    show CupertinoActionSheet, CupertinoActionSheetAction, CupertinoButton;
import 'package:flutter/material.dart'
    show
        ButtonStyle,
        PopupMenuButton,
        PopupMenuCanceled,
        PopupMenuDivider,
        PopupMenuEntry,
        PopupMenuItem,
        PopupMenuItemBuilder,
        PopupMenuPosition,
        kMinInteractiveDimension;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_widget.dart';
import 'widget_base.dart';

const _kMenuDividerHeight = 16.0;

class PopupMenuOption {
  final String? label;
  final void Function(PopupMenuOption)? onTap;

  final PlatformBuilder<CupertinoPopupMenuOptionData>? cupertino;
  final PlatformBuilder<MaterialPopupMenuOptionData>? material;

  const PopupMenuOption({
    this.label,
    this.onTap,
    this.cupertino,
    this.material,
  });
}

abstract class _BaseData {
  final Key? key;
  final Widget? child;

  const _BaseData({this.key, this.child});
}

class MaterialPopupMenuOptionData extends _BaseData {
  final bool? enabled;
  final double? height;
  final MouseCursor? mouseCursor;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool withDivider;
  final double dividerHeight;
  final WidgetStateProperty<TextStyle?>? labelTextStyle;

  const MaterialPopupMenuOptionData({
    super.key,
    super.child,
    this.enabled,
    this.height,
    this.mouseCursor,
    this.onTap,
    this.padding,
    this.textStyle,
    this.withDivider = false,
    this.dividerHeight = _kMenuDividerHeight,
    this.labelTextStyle,
  });
}

class CupertinoPopupMenuOptionData extends _BaseData {
  final VoidCallback? onPressed;
  final bool? isDefaultAction;
  final bool? isDestructiveAction;
  final MouseCursor? mouseCursor;

  const CupertinoPopupMenuOptionData({
    super.key,
    super.child,
    this.onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
    this.mouseCursor,
  });
}

class MaterialPopupMenuData {
  final Key? key;
  final Widget? icon;
  final PopupMenuItemBuilder<PopupMenuOption>? itemBuilder;
  final Widget? child;
  final Color? color;
  final double? elevation;
  final bool? enableFeedback;
  final bool? enabled;
  final double? iconSize;
  final PopupMenuOption? initialValue;
  final Offset? offset;
  final PopupMenuCanceled? onCanceled;
  final EdgeInsets? padding;
  final ShapeBorder? shape;
  final String? tooltip;
  final BoxConstraints? constraints;
  final PopupMenuPosition? position;
  final double? splashRadius;
  final Clip clipBehavior;
  final VoidCallback? onOpened;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? iconColor;
  final AnimationStyle? popUpAnimationStyle;
  final bool? useRootNavigator;
  final ButtonStyle? style;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? menuPadding;
  final bool? requestFocus;
  final RouteSettings? routeSettings;

  const MaterialPopupMenuData({
    this.key,
    this.icon,
    this.itemBuilder,
    this.child,
    this.color,
    this.elevation,
    this.enableFeedback,
    this.enabled,
    this.iconSize,
    this.initialValue,
    this.offset,
    this.onCanceled,
    this.padding,
    this.shape,
    this.tooltip,
    this.constraints,
    this.position,
    this.splashRadius,
    this.clipBehavior = Clip.none,
    this.onOpened,
    this.shadowColor,
    this.surfaceTintColor,
    this.iconColor,
    this.popUpAnimationStyle,
    this.useRootNavigator,
    this.style,
    this.borderRadius,
    this.menuPadding,
    this.requestFocus,
    this.routeSettings,
  });
}

class CupertinoPopupMenuData {
  final Key? key;
  final Widget? title;
  final Widget? message;
  final ScrollController? actionScrollController;
  final ScrollController? messageScrollController;
  final List<Widget>? actions;
  final CupertinoPopupMenuCancelButtonData? cancelButtonData;

  const CupertinoPopupMenuData({
    this.key,
    this.title,
    this.message,
    this.actionScrollController,
    this.messageScrollController,
    this.actions,
    this.cancelButtonData,
  });
}

class CupertinoPopupMenuCancelButtonData {
  final Key? key;
  final Widget child;
  final VoidCallback? onPressed;
  final bool? isDefaultAction;
  final bool? isDestructiveAction;
  final MouseCursor? mouseCursor;

  const CupertinoPopupMenuCancelButtonData({
    this.child = const Text('Cancel'),
    this.key,
    this.onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
    this.mouseCursor,
  });
}

class PlatformPopupMenu extends StatelessWidget {
  final List<PopupMenuOption> options;
  final Widget icon;

  final PlatformBuilder<CupertinoPopupMenuData>? cupertino;
  final PlatformBuilder<MaterialPopupMenuData>? material;

  const PlatformPopupMenu({
    required this.options,
    required this.icon,
    this.cupertino,
    this.material,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, _) => _materialPopupMenuButton(context),
      cupertino: (context, _) => _cupertinoPopupBottomSheet(context),
    );
  }

  Widget _cupertinoPopupBottomSheet(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => showPlatformModalSheet(
        context: context,
        builder: (context) => _cupertinoSheetContent(context),
      ),
      child: icon,
    );
  }

  Widget _cupertinoSheetContent(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    final cancelData = data?.cancelButtonData;

    return CupertinoActionSheet(
      key: data?.key ?? key,
      title: data?.title,
      message: data?.message,
      actionScrollController: data?.actionScrollController,
      messageScrollController: data?.messageScrollController,
      actions:
          data?.actions ??
          options.map((option) {
            final data = option.cupertino?.call(context, platform(context));
            return CupertinoActionSheetAction(
              key: data?.key,
              isDefaultAction: data?.isDefaultAction ?? false,
              isDestructiveAction: data?.isDestructiveAction ?? false,
              child: data?.child ?? Text(option.label ?? ''),
              onPressed:
                  data?.onPressed ??
                  () {
                    Navigator.pop(context);
                    option.onTap?.call(option);
                  },
              mouseCursor: data?.mouseCursor,
            );
          }).toList(),
      cancelButton:
          cancelData == null
              ? null
              : CupertinoActionSheetAction(
                key: cancelData.key,
                child: cancelData.child,
                isDefaultAction: cancelData.isDefaultAction ?? false,
                isDestructiveAction: cancelData.isDestructiveAction ?? false,
                onPressed: cancelData.onPressed ?? () => Navigator.pop(context),
                mouseCursor: cancelData.mouseCursor,
              ),
    );
  }

  Widget _materialPopupMenuButton(BuildContext context) {
    final data = material?.call(context, platform(context));

    return PopupMenuButton<PopupMenuOption>(
      onSelected: (option) {
        option.onTap?.call(option);
      },
      icon: data?.icon ?? icon,
      itemBuilder:
          data?.itemBuilder ??
          (context) {
            final items = <PopupMenuEntry<PopupMenuOption>>[];
            for (final option in options) {
              final data = option.material?.call(context, platform(context));
              items.add(
                PopupMenuItem<PopupMenuOption>(
                  value: option,
                  child: data?.child ?? Text(option.label ?? ''),
                  enabled: data?.enabled ?? true,
                  height: data?.height ?? kMinInteractiveDimension,
                  key: data?.key,
                  mouseCursor: data?.mouseCursor,
                  onTap: data?.onTap,
                  padding: data?.padding,
                  textStyle: data?.textStyle,
                  labelTextStyle: data?.labelTextStyle,
                ),
              );
              if (data?.withDivider ?? false) {
                items.add(
                  PopupMenuDivider(
                    height: data?.dividerHeight ?? _kMenuDividerHeight,
                  ),
                );
              }
            }
            return items;
          },
      child: data?.child,
      color: data?.color,
      elevation: data?.elevation,
      enableFeedback: data?.enableFeedback,
      enabled: data?.enabled ?? true,
      iconSize: data?.iconSize,
      initialValue: data?.initialValue,
      key: data?.key ?? key,
      offset: data?.offset ?? Offset.zero,
      onCanceled: data?.onCanceled,
      padding: data?.padding ?? const EdgeInsets.all(8.0),
      shape: data?.shape,
      tooltip: data?.tooltip,
      constraints: data?.constraints,
      position: data?.position ?? PopupMenuPosition.over,
      splashRadius: data?.splashRadius,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      onOpened: data?.onOpened,
      shadowColor: data?.shadowColor,
      surfaceTintColor: data?.surfaceTintColor,
      iconColor: data?.iconColor,
      popUpAnimationStyle: data?.popUpAnimationStyle,
      useRootNavigator: data?.useRootNavigator ?? false,
      style: data?.style,
      borderRadius: data?.borderRadius,
      menuPadding: data?.menuPadding,
      requestFocus: data?.requestFocus,
      routeSettings: data?.routeSettings,
    );
  }
}

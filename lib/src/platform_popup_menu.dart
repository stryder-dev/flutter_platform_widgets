import 'package:flutter/cupertino.dart'
    show CupertinoActionSheet, CupertinoActionSheetAction;
import 'package:flutter/material.dart'
    show
        PopupMenuButton,
        PopupMenuCanceled,
        PopupMenuItem,
        PopupMenuItemBuilder,
        kMinInteractiveDimension;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_widget.dart';
import 'widget_base.dart';

class PopupMenuOption {
  final String label;
  final void Function(PopupMenuOption)? onTap;

  final PlatformBuilder<CupertinoPopupMenuOptionData>? cupertino;
  final PlatformBuilder<MaterialPopupMenuOptionData>? material;

  PopupMenuOption({
    required this.label,
    this.onTap,
    this.cupertino,
    this.material,
  });
}

class MaterialPopupMenuOptionData {
  final Key? key;
  final Widget? child;
  final bool? enabled;
  final double? height;
  final MouseCursor? mouseCursor;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  MaterialPopupMenuOptionData({
    this.key,
    this.child,
    this.enabled,
    this.height,
    this.mouseCursor,
    this.onTap,
    this.padding,
    this.textStyle,
  });
}

class CupertinoPopupMenuOptionData {
  final Key? key;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool? isDefaultAction;
  final bool? isDestructiveAction;

  CupertinoPopupMenuOptionData({
    this.key,
    this.child,
    this.onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
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

  CupertinoPopupMenuData({
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

  CupertinoPopupMenuCancelButtonData({
    this.child = const Text('Cancel'),
    this.key,
    this.onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, _) => _materialPopupMenuButton(context),
      cupertino: (context, _) => _cupertinoPopupBottomSheet(context),
    );
  }

  Widget _cupertinoPopupBottomSheet(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPlatformModalSheet(
          context: context,
          builder: (_) => _cupertinoSheetContent(context),
        );
      },
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
      actions: data?.actions ??
          options.map(
            (option) {
              final data = option.cupertino?.call(context, platform(context));
              return CupertinoActionSheetAction(
                key: data?.key,
                isDefaultAction: data?.isDefaultAction ?? false,
                isDestructiveAction: data?.isDestructiveAction ?? false,
                child: data?.child ?? Text(option.label),
                onPressed: data?.onPressed ??
                    () {
                      Navigator.pop(context);
                      option.onTap?.call(option);
                    },
              );
            },
          ).toList(),
      cancelButton: cancelData == null
          ? null
          : CupertinoActionSheetAction(
              key: cancelData.key,
              child: cancelData.child,
              isDefaultAction: cancelData.isDefaultAction ?? false,
              isDestructiveAction: cancelData.isDestructiveAction ?? false,
              onPressed: cancelData.onPressed ?? () => Navigator.pop(context),
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
      itemBuilder: data?.itemBuilder ??
          (context) => options.map(
                (option) {
                  final data =
                      option.material?.call(context, platform(context));
                  return PopupMenuItem(
                    value: option,
                    child: data?.child ?? Text(option.label),
                    enabled: data?.enabled ?? true,
                    height: data?.height ?? kMinInteractiveDimension,
                    key: data?.key,
                    mouseCursor: data?.mouseCursor,
                    onTap: data?.onTap,
                    padding: data?.padding,
                    textStyle: data?.textStyle,
                  );
                },
              ).toList(),
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
    );
  }
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

  MaterialPopupMenuData({
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
  });
}

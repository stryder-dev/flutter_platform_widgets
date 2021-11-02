/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoNavigationBar;
import 'package:flutter/material.dart' show AppBar, Brightness, TextTheme;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'extensions.dart';
import 'platform.dart';
import 'platform_provider.dart';
import 'widget_base.dart';

//the default has alpha which will cause the content to slide under the header for ios
const Color _kDefaultNavBarBorderColor = const Color(0x4C000000);

const Border _kDefaultNavBarBorder = const Border(
  bottom: const BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.title,
    this.backgroundColor,
    this.leading,
    this.automaticallyImplyLeading,
  });

  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final Key? widgetKey;
  final bool? automaticallyImplyLeading;
}

class MaterialAppBarData extends _BaseData {
  MaterialAppBarData({
    Widget? title,
    Color? backgroundColor,
    Widget? leading,
    Key? widgetKey,
    bool? automaticallyImplyLeading,
    this.actions,
    this.bottom,
    this.bottomOpacity,
    @Deprecated('This property is no longer used, please use systemOverlayStyle instead. ')
        this.brightness,
    this.centerTitle,
    this.elevation,
    this.flexibleSpace,
    this.iconTheme,
    this.primary,
    @Deprecated('This property is no longer used, please use toolbarTextStyle and titleTextStyle instead. ')
        this.textTheme,
    this.titleSpacing,
    this.toolbarOpacity,
    this.actionsIconTheme,
    this.shape,
    this.excludeHeaderSemantics,
    this.shadowColor,
    this.toolbarHeight,
    this.leadingWidth,
    @Deprecated('This property is obsolete and is false by default. ')
        this.backwardsCompatibility,
    this.foregroundColor,
    this.systemOverlayStyle,
    this.titleTextStyle,
    this.toolbarTextStyle,
  }) : super(
          widgetKey: widgetKey,
          title: title,
          backgroundColor: backgroundColor,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
        );

  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  final double? bottomOpacity;
  final Brightness? brightness;
  final bool? centerTitle;
  final double? elevation;
  final Widget? flexibleSpace;
  final IconThemeData? iconTheme;
  final bool? primary;
  final TextTheme? textTheme;
  final double? titleSpacing;
  final double? toolbarOpacity;
  final IconThemeData? actionsIconTheme;
  final ShapeBorder? shape;
  final bool? excludeHeaderSemantics;
  final Color? shadowColor;
  final double? toolbarHeight;
  final double? leadingWidth;
  final bool? backwardsCompatibility;
  final Color? foregroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final TextStyle? titleTextStyle;
  final TextStyle? toolbarTextStyle;
}

class CupertinoNavigationBarData extends _BaseData {
  CupertinoNavigationBarData({
    Widget? title,
    Color? backgroundColor,
    Widget? leading,
    Key? widgetKey,
    bool? automaticallyImplyLeading,
    this.previousPageTitle,
    this.automaticallyImplyMiddle,
    this.padding,
    this.trailing,
    this.border,
    this.transitionBetweenRoutes,
    this.brightness,
    this.heroTag,
    this.noMaterialParent = false,
  }) : super(
            widgetKey: widgetKey,
            title: title,
            backgroundColor: backgroundColor,
            leading: leading,
            automaticallyImplyLeading: automaticallyImplyLeading);

  final Widget? trailing;
  final Border? border;
  final bool? transitionBetweenRoutes;
  final Object? heroTag;
  final bool? automaticallyImplyMiddle;
  final String? previousPageTitle;
  final EdgeInsetsDirectional? padding;
  final Brightness? brightness;

  /// When enabling [iosUsesMaterialWidgets] on [PlatformProvider] settings it will
  /// add a Material widget as a parent to both the leading and trailing widgets.
  /// Setting [noMaterialParent] to true (default false) will remove the [Material] parent
  final bool noMaterialParent;
}

class PlatformAppBar
    extends PlatformWidgetBase<CupertinoNavigationBar, PreferredSizeWidget> {
  final Key? widgetKey;

  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? trailingActions;
  final bool? automaticallyImplyLeading;

  final PlatformBuilder<MaterialAppBarData>? material;
  final PlatformBuilder<CupertinoNavigationBarData>? cupertino;

  PlatformAppBar({
    Key? key,
    this.widgetKey,
    this.title,
    this.backgroundColor,
    this.leading,
    this.trailingActions,
    this.automaticallyImplyLeading,
    this.material,
    this.cupertino,
  }) : super(key: key);

  @override
  PreferredSizeWidget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return AppBar(
      key: data?.widgetKey ?? widgetKey,
      title: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      bottom: data?.bottom,
      actions: data?.actions ?? trailingActions,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      bottomOpacity: data?.bottomOpacity ?? 1.0,
      // ignore: deprecated_member_use
      brightness: data?.brightness,
      centerTitle: data?.centerTitle,
      elevation: data?.elevation,
      flexibleSpace: data?.flexibleSpace,
      iconTheme: data?.iconTheme,
      leading: data?.leading ?? leading,
      primary: data?.primary ?? true,
      // ignore: deprecated_member_use
      textTheme: data?.textTheme,
      titleSpacing: data?.titleSpacing,
      toolbarOpacity: data?.toolbarOpacity ?? 1.0,
      actionsIconTheme: data?.actionsIconTheme,
      shape: data?.shape,
      excludeHeaderSemantics: data?.excludeHeaderSemantics ?? false,
      shadowColor: data?.shadowColor,
      toolbarHeight: data?.toolbarHeight,
      leadingWidth: data?.leadingWidth,
      // ignore: deprecated_member_use
      backwardsCompatibility: data?.backwardsCompatibility,
      foregroundColor: data?.foregroundColor,
      systemOverlayStyle: data?.systemOverlayStyle,
      titleTextStyle: data?.titleTextStyle,
      toolbarTextStyle: data?.toolbarTextStyle,
    );
  }

  @override
  CupertinoNavigationBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    var trailing = trailingActions?.isEmpty ?? true
        ? null
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: trailingActions!,
          );

    final providerState = PlatformProvider.of(context);
    final noMaterialParent = data?.noMaterialParent ?? false;
    final useMaterial = (!noMaterialParent) &&
        (providerState?.settings.iosUsesMaterialWidgets ?? false);

    final heroTag = data?.heroTag;
    if (heroTag != null) {
      return CupertinoNavigationBar(
        key: data?.widgetKey ?? widgetKey,
        middle: data?.title ?? title,
        backgroundColor: data?.backgroundColor ?? backgroundColor,
        automaticallyImplyLeading: data?.automaticallyImplyLeading ??
            automaticallyImplyLeading ??
            true,
        automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
        previousPageTitle: data?.previousPageTitle,
        padding: data?.padding,
        border: data?.border ?? _kDefaultNavBarBorder,
        leading: (data?.leading ?? leading)?.withMaterial(useMaterial),
        trailing: (data?.trailing ?? trailing)?.withMaterial(useMaterial),
        transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
        brightness: data?.brightness,
        heroTag: heroTag,
      );
    }

    return CupertinoNavigationBar(
      key: data?.widgetKey ?? widgetKey,
      middle: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
      previousPageTitle: data?.previousPageTitle,
      padding: data?.padding,
      border: data?.border ?? _kDefaultNavBarBorder,
      leading: (data?.leading ?? leading)?.withMaterial(useMaterial),
      trailing: (data?.trailing ?? trailing)?.withMaterial(useMaterial),
      transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
      brightness: data?.brightness,
      //heroTag: , used above
    );
  }
}

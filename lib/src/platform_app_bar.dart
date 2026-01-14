/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoNavigationBar;
import 'package:flutter/material.dart' show AppBar, Brightness;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'extensions.dart';
import 'parent_widget_finder.dart';
import 'platform.dart';
import 'platform_provider.dart';
import 'widget_base.dart';

//the default has alpha which will cause the content to slide under the header for ios
const Color _kDefaultNavBarBorderColor = Color(0x4C000000);

const Border _kDefaultNavBarBorder = Border(
  bottom: BorderSide(
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
    this.bottom,
  });

  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final Key? widgetKey;
  final bool? automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
}

class MaterialAppBarData extends _BaseData {
  MaterialAppBarData({
    super.title,
    super.backgroundColor,
    super.leading,
    super.widgetKey,
    super.automaticallyImplyLeading,
    super.bottom,
    this.actions,
    this.bottomOpacity,
    this.centerTitle,
    this.elevation,
    this.flexibleSpace,
    this.iconTheme,
    this.primary,
    this.titleSpacing,
    this.toolbarOpacity,
    this.actionsIconTheme,
    this.shape,
    this.excludeHeaderSemantics,
    this.shadowColor,
    this.toolbarHeight,
    this.leadingWidth,
    this.foregroundColor,
    this.systemOverlayStyle,
    this.titleTextStyle,
    this.toolbarTextStyle,
    this.scrolledUnderElevation,
    this.surfaceTintColor,
    this.notificationPredicate,
    this.clipBehavior,
    this.forceMaterialTransparency,
    this.actionsPadding,
    this.useDefaultSemanticsOrder,
    this.animateColor,
    this.automaticallyImplyActions,
  });

  final List<Widget>? actions;
  final double? bottomOpacity;
  final bool? centerTitle;
  final double? elevation;
  final Widget? flexibleSpace;
  final IconThemeData? iconTheme;
  final bool? primary;
  final double? titleSpacing;
  final double? toolbarOpacity;
  final IconThemeData? actionsIconTheme;
  final ShapeBorder? shape;
  final bool? excludeHeaderSemantics;
  final Color? shadowColor;
  final double? toolbarHeight;
  final double? leadingWidth;
  final Color? foregroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final TextStyle? titleTextStyle;
  final TextStyle? toolbarTextStyle;
  final double? scrolledUnderElevation;
  final Color? surfaceTintColor;
  final ScrollNotificationPredicate? notificationPredicate;
  final Clip? clipBehavior;
  final bool? forceMaterialTransparency;
  final EdgeInsetsGeometry? actionsPadding;
  final bool? useDefaultSemanticsOrder;
  final bool? animateColor;
  final bool? automaticallyImplyActions;
}

class CupertinoNavigationBarData extends _BaseData {
  CupertinoNavigationBarData({
    super.backgroundColor,
    super.leading,
    super.widgetKey,
    super.automaticallyImplyLeading,
    super.bottom,
    this.automaticBackgroundVisibility,
    this.previousPageTitle,
    this.automaticallyImplyMiddle,
    this.padding,
    this.trailing,
    this.border,
    this.transitionBetweenRoutes,
    this.brightness,
    this.heroTag,
    this.noMaterialParent = false,
    this.enableBackgroundFilterBlur,
    Widget? middle,
  }) : super(title: middle);

  final Widget? trailing;
  final Border? border;
  final bool? transitionBetweenRoutes;
  final Object? heroTag;
  final bool? automaticallyImplyMiddle;
  final String? previousPageTitle;
  final EdgeInsetsDirectional? padding;
  final Brightness? brightness;
  final bool? automaticBackgroundVisibility;
  final bool? enableBackgroundFilterBlur;

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
  final PreferredSizeWidget? bottom;

  final PlatformBuilder<MaterialAppBarData>? material;
  final PlatformBuilder<CupertinoNavigationBarData>? cupertino;

  const PlatformAppBar({
    super.key,
    this.widgetKey,
    this.title,
    this.backgroundColor,
    this.leading,
    this.trailingActions,
    this.automaticallyImplyLeading,
    this.bottom,
    this.material,
    this.cupertino,
  });

  @override
  PreferredSizeWidget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return AppBar(
      key: data?.widgetKey ?? widgetKey,
      title: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      bottom: data?.bottom ?? bottom,
      actions: data?.actions ?? trailingActions,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      bottomOpacity: data?.bottomOpacity ?? 1.0,
      centerTitle: data?.centerTitle,
      elevation: data?.elevation,
      flexibleSpace: data?.flexibleSpace,
      iconTheme: data?.iconTheme,
      leading: data?.leading ?? leading,
      primary: data?.primary ?? true,
      titleSpacing: data?.titleSpacing,
      toolbarOpacity: data?.toolbarOpacity ?? 1.0,
      actionsIconTheme: data?.actionsIconTheme,
      shape: data?.shape,
      excludeHeaderSemantics: data?.excludeHeaderSemantics ?? false,
      shadowColor: data?.shadowColor,
      toolbarHeight: data?.toolbarHeight,
      leadingWidth: data?.leadingWidth,
      foregroundColor: data?.foregroundColor,
      systemOverlayStyle: data?.systemOverlayStyle,
      titleTextStyle: data?.titleTextStyle,
      toolbarTextStyle: data?.toolbarTextStyle,
      scrolledUnderElevation: data?.scrolledUnderElevation,
      surfaceTintColor: data?.surfaceTintColor,
      notificationPredicate:
          data?.notificationPredicate ?? defaultScrollNotificationPredicate,
      clipBehavior: data?.clipBehavior,
      forceMaterialTransparency: data?.forceMaterialTransparency ?? false,
      actionsPadding: data?.actionsPadding,
      useDefaultSemanticsOrder: data?.useDefaultSemanticsOrder ?? true,
      animateColor: data?.animateColor ?? false,
      automaticallyImplyActions: data?.automaticallyImplyActions ?? true,
    );
  }

  @override
  CupertinoNavigationBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    final trailing = trailingActions?.isEmpty ?? true
        ? null
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: trailingActions!,
          );

    final providerState = PlatformProvider.of(context);
    final noMaterialParent = data?.noMaterialParent ?? false;
    final useMaterial =
        (!noMaterialParent) &&
        (providerState?.settings.iosUsesMaterialWidgets ?? false);

    final heroTag = data?.heroTag;
    if (heroTag != null) {
      return CupertinoNavigationBar(
        key: data?.widgetKey ?? widgetKey,
        middle: _getMiddleCupertinoWidget(context, data),
        backgroundColor: data?.backgroundColor ?? backgroundColor,
        automaticallyImplyLeading:
            data?.automaticallyImplyLeading ??
            automaticallyImplyLeading ??
            true,
        automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
        previousPageTitle: data?.previousPageTitle,
        padding: data?.padding,
        border: data?.border ?? _kDefaultNavBarBorder,
        leading: _getLeadingCupertinoWidget(
          context,
          data,
        )?.withMaterial(useMaterial).withWidgetFinder<CupertinoNavigationBar>(),
        trailing: (data?.trailing ?? trailing)
            ?.withMaterial(useMaterial)
            .withWidgetFinder<CupertinoNavigationBar>(),
        transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
        brightness: data?.brightness,
        heroTag: heroTag,
        automaticBackgroundVisibility:
            data?.automaticBackgroundVisibility ?? true,
        bottom: data?.bottom ?? bottom,
        enableBackgroundFilterBlur: data?.enableBackgroundFilterBlur ?? true,
      );
    }

    return CupertinoNavigationBar(
      key: data?.widgetKey ?? widgetKey,
      middle: _getMiddleCupertinoWidget(context, data),
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
      previousPageTitle: data?.previousPageTitle,
      padding: data?.padding,
      border: data?.border ?? _kDefaultNavBarBorder,
      leading: _getLeadingCupertinoWidget(
        context,
        data,
      )?.withMaterial(useMaterial).withWidgetFinder<CupertinoNavigationBar>(),
      trailing: (data?.trailing ?? trailing)
          ?.withMaterial(useMaterial)
          .withWidgetFinder<CupertinoNavigationBar>(),
      transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
      brightness: data?.brightness,
      automaticBackgroundVisibility:
          data?.automaticBackgroundVisibility ?? true,
      bottom: data?.bottom,
      enableBackgroundFilterBlur: data?.enableBackgroundFilterBlur ?? true,
      //heroTag: , used above
    );
  }

  Widget? _getLeadingCupertinoWidget(
    BuildContext context,
    CupertinoNavigationBarData? data,
  ) {
    final leadingLocal = data?.leading ?? leading;

    return leadingLocal;

    // Currently there is this issue which prevents this from being done properly
    // https://github.com/flutter/flutter/issues/89888

    // final ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
    // final canPop = currentRoute?.canPop ?? false;

    // if (!canPop) {
    //   return leadingLocal;
    // }

    // final useMediaQueryWrapper = PlatformProvider.of(context)
    //         ?.settings
    //         .wrapCupertinoAppBarMiddleWithMediaQuery ??
    //     true;

    // if (!useMediaQueryWrapper) {
    //   return middleLocal;
    // }

    // final leadingWithMediaQuery = MediaQuery(
    //   data: MediaQueryData(
    //       textScaleFactor: MediaQuery.textScaleFactorOf(context)),
    //   child: leadingLocal ?? CupertinoNavigationBarBackButton(),
    // );

    // return leadingWithMediaQuery;
  }

  Widget? _getMiddleCupertinoWidget(
    BuildContext context,
    CupertinoNavigationBarData? data,
  ) {
    final middleLocal = data?.title ?? title;
    if (middleLocal == null) {
      return null;
    }

    final useMediaQueryWrapper =
        PlatformProvider.of(
          context,
        )?.settings.wrapCupertinoAppBarMiddleWithMediaQuery ??
        true;

    if (!useMediaQueryWrapper) {
      return middleLocal;
    }

    final middleWithMediaQuery = MediaQuery(
      data: MediaQueryData(textScaler: MediaQuery.textScalerOf(context)),
      child: middleLocal,
    );

    return middleWithMediaQuery;
  }
}

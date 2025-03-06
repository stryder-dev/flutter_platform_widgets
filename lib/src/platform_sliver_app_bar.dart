/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show CupertinoSliverNavigationBar, NavigationBarBottomMode;
import 'package:flutter/foundation.dart' show AsyncCallback, Brightness;
import 'package:flutter/material.dart' show SliverAppBar, kToolbarHeight;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    //Common
    this.widgetKey,
    this.leading,
    this.automaticallyImplyLeading,
    this.backgroundColor,
    this.stretch,
    this.title,
    this.bottom,
  });

  final Key? widgetKey;
  final Widget? leading;
  final bool? automaticallyImplyLeading;
  final Color? backgroundColor;
  final bool? stretch;
  final Widget? title;
  final PreferredSizeWidget? bottom;
}

class MaterialSliverAppBarData extends _BaseData {
  MaterialSliverAppBarData({
    // Common
    super.widgetKey,
    super.leading,
    super.automaticallyImplyLeading,
    super.backgroundColor,
    super.stretch,
    super.title,
    super.bottom,

    //Material
    this.actions,
    this.flexibleSpace,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.forceElevated = false,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.collapsedHeight,
    this.expandedHeight,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.actionsPadding,
  })  : assert(floating || !snap,
            'The "snap" argument only makes sense for floating app bars.'),
        assert(stretchTriggerOffset > 0.0),
        assert(collapsedHeight == null || collapsedHeight >= toolbarHeight,
            'The "collapsedHeight" argument has to be larger than or equal to [toolbarHeight].');

  // final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final bool forceElevated;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double? collapsedHeight;
  final double? expandedHeight;
  final bool floating;
  final bool pinned;
  final ShapeBorder? shape;
  final bool snap;
  final double stretchTriggerOffset;
  final AsyncCallback? onStretchTrigger;
  final double toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? actionsPadding;
}

class CupertinoSliverAppBarData extends _BaseData {
  CupertinoSliverAppBarData({
    //Common
    super.widgetKey,
    super.leading,
    super.automaticallyImplyLeading,
    super.backgroundColor,
    super.stretch,
    super.title,
    super.bottom,

    //Cupertino
    // this.largeTitle,
    this.automaticallyImplyTitle = true,
    this.alwaysShowMiddle = true,
    this.previousPageTitle,
    this.middle,
    this.trailing,
    this.border = _kDefaultNavBarBorder,
    this.brightness,
    this.padding,
    this.transitionBetweenRoutes = true,
    this.automaticBackgroundVisibility,
    this.bottomMode,
    this.enableBackgroundFilterBlur,
    this.heroTag = _defaultHeroTag,
  }) : assert(
          automaticallyImplyTitle == true || title != null,
          'No title has been provided but automaticallyImplyTitle is also '
          'false. Either provide a title or set automaticallyImplyTitle to '
          'true.',
        );

  // final Widget? largeTitle;
  final bool automaticallyImplyTitle;
  final bool alwaysShowMiddle;
  final String? previousPageTitle;
  final Widget? middle;
  final Widget? trailing;
  final Brightness? brightness;
  final EdgeInsetsDirectional? padding;
  final Border? border;
  final bool transitionBetweenRoutes;
  final Object heroTag;
  final bool? automaticBackgroundVisibility;
  final NavigationBarBottomMode? bottomMode;
  final bool? enableBackgroundFilterBlur;
}

class PlatformSliverAppBar
    extends PlatformWidgetBase<CupertinoSliverNavigationBar, SliverAppBar> {
  //Common
  final Key? widgetKey;

  final Widget? leading;
  final bool? automaticallyImplyLeading;
  final Color? backgroundColor;
  final bool? stretch;
  final Widget? title;
  final PreferredSizeWidget? bottom;

  //Platform
  final PlatformBuilder<MaterialSliverAppBarData>? material;
  final PlatformBuilder<CupertinoSliverAppBarData>? cupertino;

  PlatformSliverAppBar({
    //Common
    super.key,
    this.widgetKey,
    this.leading,
    this.automaticallyImplyLeading,
    this.backgroundColor,
    this.stretch,
    this.title,
    this.bottom,
    //Platform
    this.material,
    this.cupertino,
  });

  @override
  SliverAppBar createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return SliverAppBar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      leading: data?.leading ?? leading,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      stretch: data?.stretch ?? stretch ?? false,
      title: data?.title ?? title,

      //Material only
      actions: data?.actions,
      flexibleSpace: data?.flexibleSpace,
      bottom: data?.bottom ?? bottom,
      elevation: data?.elevation,
      shadowColor: data?.shadowColor,
      forceElevated: data?.forceElevated ?? false,
      foregroundColor: data?.foregroundColor,
      iconTheme: data?.iconTheme,
      actionsIconTheme: data?.actionsIconTheme,
      primary: data?.primary ?? true,
      centerTitle: data?.centerTitle,
      excludeHeaderSemantics: data?.excludeHeaderSemantics ?? false,
      titleSpacing: data?.titleSpacing,
      collapsedHeight: data?.collapsedHeight,
      expandedHeight: data?.expandedHeight,
      floating: data?.floating ?? false,
      pinned: data?.pinned ?? false,
      snap: data?.snap ?? false,
      stretchTriggerOffset: data?.stretchTriggerOffset ?? 100.0,
      onStretchTrigger: data?.onStretchTrigger,
      shape: data?.shape,
      toolbarHeight: data?.toolbarHeight ?? kToolbarHeight,
      leadingWidth: data?.leadingWidth,
      toolbarTextStyle: data?.toolbarTextStyle,
      titleTextStyle: data?.titleTextStyle,
      systemOverlayStyle: data?.systemOverlayStyle,
      forceMaterialTransparency: data?.forceMaterialTransparency ?? false,
      clipBehavior: data?.clipBehavior,
      scrolledUnderElevation: data?.scrolledUnderElevation,
      surfaceTintColor: data?.surfaceTintColor,
      actionsPadding: data?.actionsPadding,
    );
  }

  @override
  CupertinoSliverNavigationBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoSliverNavigationBar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      leading: data?.leading ?? leading,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      stretch: data?.stretch ?? stretch ?? false,
      largeTitle: data?.title ?? title,

      //Cupertino only
      automaticallyImplyTitle: data?.automaticallyImplyTitle ?? true,
      alwaysShowMiddle: data?.alwaysShowMiddle ?? true,
      previousPageTitle: data?.previousPageTitle,
      middle: data?.middle,
      trailing: data?.trailing,
      border: data?.border ?? _kDefaultNavBarBorder,
      brightness: data?.brightness,
      padding: data?.padding,
      transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
      heroTag: data?.heroTag ?? _defaultHeroTag,
      bottom: data?.bottom ?? bottom,
      automaticBackgroundVisibility:
          data?.automaticBackgroundVisibility ?? true,
      bottomMode: data?.bottomMode,
      enableBackgroundFilterBlur: data?.enableBackgroundFilterBlur ?? true,
    );
  }
}

//! Copied from file: /opt/homebrew/Caskroom/flutter/3.10.0/flutter/packages/flutter/lib/src/cupertino/nav_bar.dart
const Color _kDefaultNavBarBorderColor = Color(0x4D000000);

const Border _kDefaultNavBarBorder = Border(
  bottom: BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // 0.0 means one physical pixel
  ),
);

const _HeroTag _defaultHeroTag = _HeroTag(null);

@immutable
class _HeroTag {
  const _HeroTag(this.navigator);

  final NavigatorState? navigator;

  // Let the Hero tag be described in tree dumps.
  @override
  String toString() =>
      'Default Hero tag for Cupertino navigation bars with navigator $navigator';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is _HeroTag && other.navigator == navigator;
  }

  @override
  int get hashCode => identityHashCode(navigator);
}

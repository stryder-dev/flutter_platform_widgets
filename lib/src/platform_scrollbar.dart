/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoScrollbar;
import 'package:flutter/material.dart' show Scrollbar;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    // Common
    this.widgetKey,
    this.child,
    this.controller,
    this.thumbVisibility,
    this.thickness,
    this.radius,
    this.notificationPredicate,
    this.scrollbarOrientation,
  });
  final Key? widgetKey;
  final Widget? child;
  final ScrollController? controller;
  final bool? thumbVisibility;
  final double? thickness;
  final Radius? radius;
  final bool Function(ScrollNotification)? notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;
}

class MaterialScrollbarData extends _BaseData {
  MaterialScrollbarData({
    // Common
    super.widgetKey,
    super.child,
    super.controller,
    super.thumbVisibility,
    super.thickness,
    super.radius,
    super.notificationPredicate,
    super.scrollbarOrientation,

    // Material
    this.trackVisibility,
    this.interactive,
  });

  final bool? trackVisibility;
  final bool? interactive;
}

class CupertinoScrollbarData extends _BaseData {
  CupertinoScrollbarData({
    // Common
    super.widgetKey,
    super.child,
    super.controller,
    super.thumbVisibility,
    super.thickness,
    super.radius,
    super.notificationPredicate,
    super.scrollbarOrientation,

    // Cupertino
    this.thicknessWhileDragging,
    this.radiusWhileDragging,
  })  : assert(thickness != null && thickness < double.infinity),
        assert(thicknessWhileDragging != null &&
            thicknessWhileDragging < double.infinity);
  final double? thicknessWhileDragging;
  final Radius? radiusWhileDragging;
}

class PlatformScrollbar
    extends PlatformWidgetBase<CupertinoScrollbar, Scrollbar> {
  //Common
  final Key? widgetKey;
  final Widget child;
  final ScrollController? controller;
  final bool? thumbVisibility;
  final double? thickness;
  final Radius? radius;
  final bool Function(ScrollNotification)? notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;

  //Platform
  final PlatformBuilder<MaterialScrollbarData>? material;
  final PlatformBuilder<CupertinoScrollbarData>? cupertino;

  PlatformScrollbar({
    //Common
    super.key,
    this.widgetKey,
    required this.child,
    this.controller,
    this.thumbVisibility,
    this.thickness,
    this.radius,
    this.notificationPredicate,
    this.scrollbarOrientation,
    //Platform
    this.material,
    this.cupertino,
  });

  @override
  Scrollbar createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return Scrollbar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child,
      controller: data?.controller ?? controller,
      thumbVisibility: data?.thumbVisibility ?? thumbVisibility,
      thickness: data?.thickness ?? thickness,
      radius: data?.radius ?? radius,
      notificationPredicate:
          data?.notificationPredicate ?? notificationPredicate,
      scrollbarOrientation: data?.scrollbarOrientation ?? scrollbarOrientation,

      //Material only
      trackVisibility: data?.trackVisibility,
      interactive: data?.interactive,
      // showTrackOnHover: deprecated,
    );
  }

  @override
  CupertinoScrollbar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    return CupertinoScrollbar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      child: data?.child ?? child,
      thumbVisibility: data?.thumbVisibility ?? thumbVisibility,
      thickness:
          data?.thickness ?? thickness ?? CupertinoScrollbar.defaultThickness,
      radius: data?.radius ?? radius ?? CupertinoScrollbar.defaultRadius,
      notificationPredicate:
          data?.notificationPredicate ?? notificationPredicate,
      scrollbarOrientation: data?.scrollbarOrientation ?? scrollbarOrientation,

      //Cupertino only
      thicknessWhileDragging: data?.thicknessWhileDragging ??
          CupertinoScrollbar.defaultThicknessWhileDragging,
      radiusWhileDragging: data?.radiusWhileDragging ??
          CupertinoScrollbar.defaultRadiusWhileDragging,
    );
  }
}

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
    required this.child,
    this.controller,
    this.thumbVisibility,
    this.thickness,
    this.radius,
    this.notificationPredicate,
    this.scrollbarOrientation,
    this.isAlwaysShown,
  });
  final Key? widgetKey;
  final Widget child;
  final ScrollController? controller;
  final bool? thumbVisibility;
  final double? thickness;
  final Radius? radius;
  final bool Function(ScrollNotification)? notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;
  final bool? isAlwaysShown;
}

class MaterialScrollbarData extends _BaseData {
  MaterialScrollbarData({
    // Common
    super.widgetKey,
    required super.child,
    super.controller,
    super.thumbVisibility,
    super.thickness,
    super.radius,
    super.notificationPredicate,
    super.scrollbarOrientation,
    super.isAlwaysShown,

    // Material
    this.trackVisibility,
    this.interactive,
    @Deprecated(
      'Use ScrollbarThemeData.trackVisibility to resolve based on the current state instead. '
      'This feature was deprecated after v3.4.0-19.0.pre.',
    )
    this.showTrackOnHover,
    @Deprecated(
      'Use ScrollbarThemeData.thickness to resolve based on the current state instead. '
      'This feature was deprecated after v2.9.0-1.0.pre.',
    )
    this.hoverThickness,
  }) : assert(
            thumbVisibility == null || isAlwaysShown == null,
            'Scrollbar thumb appearance should only be controlled with thumbVisibility, '
            'isAlwaysShown is deprecated.');

  final bool? trackVisibility;
  final bool? interactive;
  final bool? showTrackOnHover;
  final double? hoverThickness;
}

class CupertinoScrollbarData extends _BaseData {
  CupertinoScrollbarData({
    // Common
    super.widgetKey,
    required super.child,
    super.controller,
    super.thumbVisibility,
    super.thickness,
    super.radius,
    super.notificationPredicate,
    super.scrollbarOrientation,
    super.isAlwaysShown,

    // Cupertino
    this.thicknessWhileDragging,
    this.radiusWhileDragging,
  })  : assert(thickness! < double.infinity),
        assert(thicknessWhileDragging! < double.infinity),
        assert(
            isAlwaysShown == null || thumbVisibility == null,
            'Scrollbar thumb appearance should only be controlled with thumbVisibility, '
            'isAlwaysShown is deprecated.');
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
  final bool? isAlwaysShown;

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
    @Deprecated(
      'Use thumbVisibility instead. '
      'This feature was deprecated after v2.9.0-1.0.pre.',
    )
    this.isAlwaysShown,
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
      isAlwaysShown: data?.isAlwaysShown ?? isAlwaysShown,

      //Material only
      trackVisibility: data?.trackVisibility,
      interactive: data?.interactive,
      showTrackOnHover: data?.showTrackOnHover,
      hoverThickness: data?.hoverThickness,
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
      isAlwaysShown: data?.isAlwaysShown ?? isAlwaysShown,

      //Cupertino only
      thicknessWhileDragging: data?.thicknessWhileDragging ??
          CupertinoScrollbar.defaultThicknessWhileDragging,
      radiusWhileDragging: data?.radiusWhileDragging ??
          CupertinoScrollbar.defaultRadiusWhileDragging,
    );
  }
}

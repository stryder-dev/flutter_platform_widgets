/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

class PlatformWidget extends PlatformWidgetBase<Widget, Widget> {
  final PlatformBuilder<Widget?>? material;
  final PlatformBuilder<Widget?>? cupertino;
  final PlatformBuilder<Widget?>? custom;

  PlatformWidget({
    super.key,
    this.cupertino,
    this.material,
    this.custom,
  });

  @override
  Widget createMaterialWidget(BuildContext context) {
    return material?.call(context, platform(context)) ?? SizedBox.shrink();
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    return cupertino?.call(context, platform(context)) ?? SizedBox.shrink();
  }

  @override
  Widget createCustomWidget(BuildContext context) {
    return custom?.call(context, platform(context)) ?? SizedBox.shrink();
  }
}

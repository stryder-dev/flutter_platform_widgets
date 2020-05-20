/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

class PlatformWidget extends PlatformWidgetBase<Widget, Widget> {
  final PlatformBuilder<Widget> android;
  final PlatformBuilder<Widget> ios;

  final PlatformBuilder2<Widget> material;
  final PlatformBuilder2<Widget> cupertino;

  PlatformWidget({
    Key key,
    this.ios,
    this.android,
    this.cupertino,
    this.material,
  }) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context) {
    if (android == null && material == null) {
      return SizedBox.shrink();
    } else {
      return android?.call(context) ??
          material?.call(context, platform(context));
    }
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    if (ios == null && cupertino == null) {
      return SizedBox.shrink();
    } else {
      return ios?.call(context) ?? cupertino?.call(context, platform(context));
    }
  }
}

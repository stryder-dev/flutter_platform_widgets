/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

class PlatformWidget extends PlatformWidgetBase<Widget, Widget> {
  final PlatformBuilder2<Widget> material;
  final PlatformBuilder2<Widget> cupertino;

  PlatformWidget({
    Key key,
    this.cupertino,
    this.material,
  }) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context) {
    if (material == null) {
      return SizedBox.shrink();
    } else {
      return material?.call(context, platform(context));
    }
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    if (cupertino == null) {
      return SizedBox.shrink();
    } else {
      return cupertino?.call(context, platform(context));
    }
  }
}

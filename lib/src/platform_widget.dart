/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

import 'widget_base.dart';

class PlatformWidget extends PlatformWidgetBase<Widget, Widget> {
  final PlatformBuilder<Widget> android;
  final PlatformBuilder<Widget> ios;

  PlatformWidget({Key key, this.ios, this.android}) : super(key: key);

  @override
  Widget createAndroidWidget(BuildContext context) {
    if (android == null) {
      return Container();
    } else {
      return android(context);
    }
  }

  @override
  Widget createIosWidget(BuildContext context) {
    if (ios == null) {
      return Container();
    } else {
      return ios(context);
    }
  }
}

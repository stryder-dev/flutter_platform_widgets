/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart';

import 'platform.dart';

PageRoute<T> platformPageRoute<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  RouteSettings settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String iosTitle,
}) {
  if (isMaterial(context)) {
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  } else {
    return CupertinoPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      title: iosTitle,
    );
  }
}

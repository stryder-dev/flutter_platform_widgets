/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'platform.dart';

typedef T PlatformBuilder<T>(BuildContext context);

abstract class PlatformWidgetBase<I extends Widget, A extends Widget>
    extends StatelessWidget {
  PlatformWidgetBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMaterial(context)) {
      return createAndroidWidget(context);
    } else if (isCupertino(context)) {
      return createIosWidget(context);
    }

    return throw new UnsupportedError(
        'This platform is not supported: $defaultTargetPlatform');
  }

  I createIosWidget(BuildContext context);

  A createAndroidWidget(BuildContext context);
}

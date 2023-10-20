/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/src/extensions/build_context.dart';

import 'platform.dart';

typedef T PlatformBuilder<T>(BuildContext context, PlatformTarget platform);
typedef T PlatformIndexBuilder<T>(
    BuildContext context, PlatformTarget platform, int index);

abstract class PlatformWidgetBase<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const PlatformWidgetBase({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isMaterialDesign) {
      return createMaterialWidget(context);
    } else if (context.isCupertinoDesign) {
      return createCupertinoWidget(context);
    }

    return throw new UnsupportedError(
        'This platform is not supported: $defaultTargetPlatform');
  }

  I createCupertinoWidget(BuildContext context);

  A createMaterialWidget(BuildContext context);
}

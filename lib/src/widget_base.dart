/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_provider.dart';

typedef T PlatformBuilder<T>(BuildContext context, PlatformTarget platform);
typedef T PlatformIndexBuilder<T>(
    BuildContext context, PlatformTarget platform, int index);

abstract class PlatformWidgetBase<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const PlatformWidgetBase({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMaterial(context)) {
      return createMaterialWidget(context);
    } else if (isCupertino(context)) {
      return createCupertinoWidget(context);
    } else if (isCustom(context)) {
      return createCustomWidget(context);
    }

    throw new UnsupportedError(
        'This platform is not supported: $defaultTargetPlatform');
  }

  I createCupertinoWidget(BuildContext context);

  A createMaterialWidget(BuildContext context);

  @protected
  CustomBuilder? findCustomBuilder(
    BuildContext context,
    List<CustomBuilder> builders,
  ) {
    return null;
  }

  @protected
  Widget? buildPlatformWidget(BuildContext context, CustomBuilder b) {
    return null;
  }

  Widget createCustomWidget(BuildContext context) {
    final provider = PlatformProvider.of(context);

    final builders = provider?.customWidgetBuilders;
    final platform = provider?.platform;

    //print(this.runtimeType);
    if (builders != null &&
        platform != null &&
        builders.containsKey(platform)) {
      final widgetBuilders = builders[platform];

      if (widgetBuilders != null) {
        final customBuilder = findCustomBuilder(context, widgetBuilders);

        if (customBuilder != null) {
          final customWidget = buildPlatformWidget(context, customBuilder);

          if (customWidget != null) {
            return customWidget;
          }
        }
      }
    }

    if (isMaterialFallback(context)) {
      return createMaterialWidget(context);
    }

    if (isCupertinoFallback(context)) {
      return createCupertinoWidget(context);
    }

    throw new UnsupportedError(
        'This platform is not supported: $defaultTargetPlatform');
  }
}

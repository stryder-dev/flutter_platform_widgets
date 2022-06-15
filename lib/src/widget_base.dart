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

    throw UnsupportedError(
        'This platform is not supported: $defaultTargetPlatform');
  }

  I createCupertinoWidget(BuildContext context);

  A createMaterialWidget(BuildContext context);

  I createCupertinoFallbackWidget(BuildContext context) =>
      createCupertinoWidget(context);

  A createMaterialFallbackWidget(BuildContext context) =>
      createMaterialWidget(context);

  @protected
  Widget? buildPlatformWidget(
    BuildContext context,
    CustomWidgetBuilder builder,
  ) {
    return null;
  }

  Widget createCustomWidget(BuildContext context) {
    final provider = PlatformProvider.of(context);
    final currentPlatform = platform(context);
    final platformBuilder = provider?.customWidgetBuilders?[currentPlatform];

    if (platformBuilder != null) {
      final customWidget = buildPlatformWidget(context, platformBuilder);

      if (customWidget != null) {
        return customWidget;
      }
    }

    if (isMaterialFallback(context)) {
      return createMaterialFallbackWidget(context);
    }

    if (isCupertinoFallback(context)) {
      return createCupertinoFallbackWidget(context);
    }

    throw UnsupportedError(
        'This platform is not supported: $defaultTargetPlatform');
  }
}

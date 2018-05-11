/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:io' show Platform;

bool _forceMaterial = false;
void changeToMaterialPlatform() {
  _forceMaterial = true;
  _forceCupertino = false;
}

bool _forceCupertino = false;
void changeToCupertinoPlatform() {
  _forceCupertino = true;
  _forceMaterial = false;
}

void changeToAutoDetectPlatform() {
  _forceMaterial = false;
  _forceCupertino = false;
}

bool get isMaterial => _forceMaterial || Platform.isAndroid;

bool get isCupertino => _forceCupertino || Platform.isIOS;

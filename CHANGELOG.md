## [0.9.6] - Feb 07, 2019

#### (Flutter version support: v1.1.8)

- Added other checks for platforms. 
    - Material = Android, Fuchsia, Windows, Linux
    - Cupertino = iOS, MacOS

## [0.9.5] - Feb 07, 2019

#### (Flutter version support: v1.1.8)

- Updated all widgets compatible with Flutter v 1.1.8
- Added CupertnoThemeData to PlatformApp to style iOS apps.
- If using PlatformScaffold on each page, no need to define Material widget when using Material widgets on the page

## [0.9.0] - Jan 30, 2019

#### (Flutter version support: v1.0.0)

- Added PlatformSlider

## [0.8.3] - Jan 30, 2019

#### (Flutter version support: v1.0.0)

- Fix for PlatformTextField keyboardType. Thanks furkantektas

## [0.8.2] - Jan 29, 2019

#### (Flutter version support: v1.0.0)

- Added iosContentBottomPadding on PlatformScaffold to prevent the content going behind the navBar
- Optional android / ios builder for PlatformWidget. No need to specify both if only one if required.

## [0.8.1] - Jan 20, 2019

#### (Flutter version support: v1.0.0)

- Updated README

## [0.8.0] - Jan 19, 2019

#### (Flutter version support: v1.0.0)

- Added PlatformTextField

## [0.7.1] - Jan 18, 2019

#### (Flutter version support: v1.0.0)

- Updated the minSDK version
- Moved example.dart up a level to appear on pubspec example page

## [0.7.0] - Jan 18, 2019

#### (Flutter version support: v1.0.0)

- Added PlatformSwitch

## [0.6.0] - Jan 17, 2019

#### (Flutter version support: v1.0.0)

- Added PlatformApp. Thanks cmengler
- Added showPlatformDialog which is required to be used if PlatformApp is used and you need to show dialogs
- Added platformPageRoute function to pick the right default route for the platform

## [0.5.0] - Nov 30, 2018

#### (Flutter version support: v1.0.0)

- Redone the way PlaformScaffold renders Cupertino. Requires fluttter version 0.11+
- Added iosContentPadding to PlatformScaffold for iOS to push content bown past the navigation (app) bar

## [0.4.0] - Oct 27, 2018

#### (Flutter version support: v0.9.4)

- Caught up with latest flutter verison (0.9.4) adding extra widget properties.

## [0.3.4] - Oct 11, 2018

- Fixed herotag issue when setting transitionBetweenRoutes to true

## [0.3.3] - Oct 11, 2018

- Added transitionBetweenRoutes and heroTag as attributes to CupertinoNavigationBarData

## [0.3.2] - Oct 09, 2018

- Fixed issue with AppBar padding

## [0.3.1] - Aug 24, 2018

- Updated environment to support Dart 2

## [0.3.0] - Aug 13, 2018

- Removed hasNotch to be compatible with the flutter develop branch

## [0.2.0] - May 16, 2018

- Added PlatformCircularProgressIndicator

## [0.1.1 - 0.1.4]

- Bug fixes

## [0.1.0] - May 11, 2018

- Inital Release of Platform widgets

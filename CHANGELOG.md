## [0.70.2] - October 08, 2020

#### (Flutter version support: v1.22.0)

- fix export of MaterialModalSheetData and CupertinoModalSheetData (thanks in74mz)

## [0.70.1] - October 03, 2020

#### (Flutter version support: v1.22.0)

- Used label instead of text for BottomNavigationBarItem in examples
- Removed deprecated android and ios parameters. Use material or cupertino instead
- Added widget parameters introduced in flutter version 1.22.0

## [0.60.2] - August 22, 2020

#### (Flutter version support: v1.20.0 - v1.20.2)

- Added const to icons for treeshaking (thanks sck-v)
- Added contributers to ReadMe

## [0.60.1] - August 05, 2020

#### (Flutter version support: v1.20)

- Upgrade to flutter version v1.20

## [0.51.0] - June 25, 2020

#### (Flutter version support: v1.17.0-v1.17.4)

- added `PlatformWidgetBuilder` which allows to use a platform specific as a parent widget for a child that is the same for both platforms.
- Forced deprecation on widget arguments to make them more obvious
- Added more PlatformIcons (thanks mlava)

## [0.50.1] - June 09, 2020

#### (Flutter version support: v1.17.0-v1.17.3)

- added `cupertinoTabChildBuilder` to `PlartformScaffold` in order to build cupertino tabs when they are viewed. (thanks AlexIver)

## [0.50.0] - May 20, 2020

#### (Flutter version support: v1.17.0-v1.17.1)

- Changed the enhancement of widgets to use an argument matching the style rather than platform. `android: (_){}` becomes `material: (_, __){}` and `ios: (_){}` becomes `cupertino: (_, __){}`. The second argument of the callback is now `PlatformTarget` which will allow a decision (if required) to return a different data object based on the platform.
- `PlatformTarget` is similar to the flutter `TargetPlatform` with the addition of `web`.
- The use of `android: (_){}` and `ios: (_){}` is now deprecated and will be removed in a future release.
- `showPlatformModalSheet` and `showPlatformDialog` has deprecated arguments

## [0.41.0] - May 18, 2020

#### (Flutter version support: v1.17.0-v1.17.1)

- Added configurable platform style which allows each target platform to be either Material or Cupertino
- Added more platform icons (thanks mlava)

## [0.40.0] - May 07, 2020

#### (Flutter version support: v1.17.0)

- Update widget arguments to match latest flutter widgets.
- Fixed issue with CupertinoPageScaffoldData (thanks josxha)
- Removed deprecated fields (thanks fredgrott)
- Added setIndex to PlatformTabScaffold (thanks GillesMontyne)
- Added more PlatformIcons (thanks mhaid)
- Added CupertinoFilledButton (thanks eyecreate)

## [0.32.5] - March 24, 2020

#### (Flutter version support: v1.12.13+hotfix.5)

- Fixed `PlatformButton` for android `FlatButton` to directly use color, disabledColor and padding properties that were missing

## [0.32.4] - January 21, 2020

#### (Flutter version support: v1.12.13+hotfix.5)

- Fix for `PlatformTextField` not allowing for `maxLines` to be null which is required when `expands` is true to enable multiline. (Thanks bangfalse)

## [0.32.3] - January 19, 2020

#### (Flutter version support: v1.12.13+hotfix.5)

- Fix for `PlatformTabScaffold` to use androidTabs properly. (Thanks abahnj)

## [0.32.2] - January 16, 2020

#### (Flutter version support: v1.12.13+hotfix.5)

- Update widget arguments to match latest flutter widgets.

## [0.32.1] - January 15, 2020

#### (Flutter version support: v1.12.13+hotfix.5)

- Fix for PlatformTabScaffold that would not pickup the right index or set a default value.

## [0.32.0] - January 14, 2020

#### (Flutter version support: v1.12.13+hotfix.5)

- Increased SDK verson to be ">=2.6.0 <3.0.0"
- Added PlatformIcons where Material and Cupertino icons are picked based on the platform
- Added PlatformTabScaffold to offer a simplier and more flexible platform tabbed page

## [0.31.0] - January 09, 2020

#### (Flutter version support: v1.12.13+hotfix.5)

- Updated PlatformTextField for Cupertino to support dark mode
- Removed Material from Cupertino Scaffold as it interfers with ios dark mode. If Material widgets are used on ios then this can be turned back on or add the Material widget to places that have it. Set iosUsesMaterialWidgets = true to retain behvour on the settings object passed in as an argument to `PlatformProvider`.
- PlaformSlider for Cupertino uses Colors instead of CupertinoColors to match the underlying flutter widget

## [0.30.1] - December 11, 2019

#### (Flutter version support: v1.12.13+hotfix.5)

- Fixes the breaking change from flutter which causes the error: `The getter 'fullObstruction' isn't defined for the class 'ObstructingPreferredSizeWidget'.`
- Updated all widgets compatible with Flutter v1.12.13+hotfix.5

## [0.20.2] - October 12, 2019

#### (Flutter version support: v1.9.1+hotfix.2)

- Fixed unselectedFontSize to be a double and not a bool

## [0.20.1] - September 23, 2019

#### (Flutter version support: v1.9.1+hotfix.2)

- Added a `Builder` to allow for children of `PlatformProvider` to get the Theme change on the builder argument.

## [0.20.0] - September 16, 2019

#### (Flutter version support: v1.9.1+hotfix.2)

- Switching of Platform based off theme. (thanks stefanrusek)
- From now on the only way to dynamically change the target platform is to use `PlatformProvider`
- `PlatformIconButton` can now take a Widget instead of it having to be an Icon (thanks GillesMontyne)

## [0.13.0] - September 13, 2019

#### (Flutter version support: v1.9.1+hotfix.2)

- Updated all widgets compatible with Flutter v 1.9.1
- Added showPlatformModalSheet
- Added check for web to allow web to compile (thanks cbenhagen)

## [0.12.0] - June 24, 2019

#### (Flutter version support: v1.5.4-hotfix.2)

- Added PlatformProvider so that swicthing platforms can rebuild the tree
- Added Material Flat button option for PlatformButton (see Readme)
- Fixed example issue

## [0.11.5] - June 23, 2019 (Do not use)

#### (Flutter version support: v1.6.3)

- Added PlatformProvider so that swicthing platforms can rebuild the tree
- Due to pub.dev supporting only Stable channel, version 0.11.5 is not supported.

## [0.11.0] - June 22, 2019 (Do not use)

#### (Flutter version support: v1.6.3)

- Updated all widgets compatible with Flutter v 1.6.3
- Added Material Flat button option for PlatformButton (see Readme)
- Fixed example issue
- Due to pub.dev supporting only Stable channel, version 0.11.0 is not supported.

## [0.10.0] - May 12, 2019

#### (Flutter version support: v1.5.4-hotfix.2)

- Fix for PlatformIconButton and added field. Thanks ericmartineau
- Updated all widgets compatible with Flutter v1.5.4-hotfix.2

## [0.9.6] - May 03, 2019

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
- Added iosContentPadding to PlatformScaffold for iOS to push content down past the navigation (app) bar

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

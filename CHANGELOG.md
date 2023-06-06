## [4.0.0-beta.1]

#### (Flutter version support: v3.10.0)

- Upgrade to flutter version 3.10.0 and sets the Dart min value to 3.0
- Adds all the flutter 3.10 additional properties for platform widgets
- Remove deprecated properties.
- PlatformSearchBar added (thanks bookshiyi) !! Note the material version of the SearchBar is only a material3 widget !!
- Added to `PlatformTheme` the ability to switch between material2 and material3
- Fixed the `PlatformApp.router` properties as they were not setting the super props correctly (thanks nikeorever)

## [3.3.5]

#### (Flutter version support: v3.7.0 - 3.7.12)

- Fix material dialog action button padding. Will use default padding

## [3.3.4]

#### (Flutter version support: v3.7.0 - 3.7.12)

- Fix for PlatformApp not using the correct theme data in dark mode

## [3.3.3]

#### (Flutter version support: v3.7.0 - 3.7.12)

- Added missing parameters (thanks nikeorever)

## [3.3.2]

#### (Flutter version support: v3.7.0 - 3.7.12)

- Removed debug print statement

## [3.3.1]

#### (Flutter version support: v3.7.0 - 3.7.7)

- Added `WidgetsBindingObserver` to `PlatformTheme` so the brightness changes can be reflected in the app whn brought from the background.

## [3.3.0]

#### (Flutter version support: v3.7.0 - 3.7.7)

- Added PlatformTheme which allows to set the cupertino and material dark and light themes in one place. The PlatformApp will automatically get the right Theme or CupertinoTheme based on the ThemeMode.
- PlatformTheme can be set the ThemeMode, darl, light or system and will rerender the PlatformApp with the correct mode.
- PlatformTheme provides a callback to when the themeMode changes in order the application to save the state. This library will not store the current state of the themeMode

## [3.2.1] 

#### (Flutter version support: v3.7.0 - 3.7.7)

- Fixed incorrectly removed code on `PlatformText` from v3.1.0. for material it will uppercase the text while leaving the cupertino version of the text the same. If you want the same casing between both material and cupertino then simply use `Text`

## [3.2.0] 

#### (Flutter version support: v3.7.0 - 3.7.7)

- Added MediaQuery wrap for CupertinoNavigationBar title as it is mentioned in this flutter issue: https://github.com/flutter/flutter/issues/42759#issuecomment-591087271. Not added for the CupertinoNavigationBarBackButton due to this issue: https://github.com/flutter/flutter/issues/89888
- Control the MediaQuery wrap via PlatformProvider settings wrapCupertinoAppBarMiddleWithMediaQuery which is set to true by default

## [3.1.0] 

#### (Flutter version support: v3.7.0 - 3.7.7)

- Added PlatformListTile (thanks patricknicolosi)

## [3.0.0] 

#### (Flutter version support: v3.7.0)

- Added extra properties to the widgets that have been added to flutter 3.7
- `toolbarOptions` on `PlatformTextFormField` and `PlatformTextField` is deprecated by flutter. Switch to contextMenuBuilder. `toolbarOptions` property will be removed from this library in a future release.
- Min dart version set to v2.19

## [2.2.6] 

- Fixed issue with `PlatformAlertDialog` where it would not work if the dialog has a material widget. (thanks josxha)

## [2.2.5] 

- Fixed issue with `showPlatformDialog`. (thanks tmaihoff)

## [2.2.4] 

Version update

## [2.2.0] 

#### (Flutter version support: v3.3.10)

- Added extra properties to the widgets that have been added to flutter
- Added material and cupertino options to the `showPlatformDialog` function.
- `materialUseSafeArea` and `materialBarrierColor` are now deprecated on `showPlatformDialog`.

## [2.1.1] 

#### (Flutter version support: v3.3.0)

- Added missing padding on the `PlatformIconButton`

## [2.1.0] 

#### (Flutter version support: v3.3.0)

- Added routerConfig into `PlatformApp`. (thanks Yoann-TYT)
- Added config iosUseZeroPaddingForAppbarPlatformIcon setting so it is no longer needed to set EdgeInserts.zero on the PlatformIcon when added to the PlatformAppBar for ios
- Added PopupMenuDivider as an option for Material popup menus. Simply add `withDivider: true,` to the `MaterialPopupMenuOptionData` and it will add a divider above the menu option specified
- Material ElevatedButton and TextButton stylilng uses now `background` color instead ofthe deprecated `primary` color property.
- Updated Readme so that most of the information can be viewed from the wiki. https://github.com/stryder-dev/flutter_platform_widgets/wiki

## [2.0.0] 

#### (Flutter version support: v3.0.0)

- Compatible with Flutter 3.0 and above. 
- Added new fields to platform widgets. 
- Removed deprecated `PlatformButton` since the underlying material `FlatButton` and `RaisedButton` are being removed in flutter ^3.1.0
- Removed required constraint from the `label` field on the `PopupMenuOption` class. (thanks AkshatBaranwal)
- Removed deprecated `brightness` field from `MaterialAppBarData` as it is deprecated in the framework. Use systemOverlayStyle instead
- Removed deprecated `textTheme` field from `MaterialAppBarData` as it is deprecated in the framework. Use toolbarTextStyle and titleTextStyle instead
- Removed deprecated `backwardsCompatibility` field from `MaterialAppBarData` as it is deprecated in the framework. 

## [1.20.0] 

#### (Flutter version support: v2.10.0)

- Added extra fields from Flutter 2.10.0

## [1.12.1] 

#### (Flutter version support: v2.5.3)

- Fixed use of context for `PlatformPopupMenu`
- Added `doneLabel` and `cancelLabel` to `CupertinoDatePickerData`

## [1.12.0] 

#### (Flutter version support: v2.5.3)

- Added `color` property to `PlatformTextButton` and `PlatformElevatedButton`
- Added cloud download and upload platform icons. (thanks rledisez)

## [1.11.1] 

#### (Flutter version support: v2.5.3)

- Added a bit more of an example of how to implement a custom cupertino date picker.

## [1.11.0] 

#### (Flutter version support: v2.5.3)

- Added `PlatformPopupMenu` to display a material `PopupMenuButton` or cupertino `CupertinoActionSheet`
- Added `showPlatformDatePicker` to display a material date picker via `showDatePicker` or a custom cupertino date tumbler via `showCupertinoModalPopup`. For cupertino you can replace the default panel to render your own by implementing the widget builder argument `cupertinoContentBuilder`.

## [1.10.0] 

#### (Flutter version support: v2.5.3)

- Added extra fields from Flutter 2.5
- Added deprecation for `PlatformButton`. Please use `PlatformElevatedButton` or `PlatformTextButton`
- Added deprecation on fields that are deprecated in Flutter widgets
- Removed deprecated platform icons

## [1.9.5] 

#### (Flutter version support: v2.2)

- Fixes issue where `PlatformTextFormField` could not set expands to true and maxLines to null. 
- Add new icons (thanks hanskokx)

## [1.9.0] 

#### (Flutter version support: v2.2)

- `PlatformDialogAction` by default uses `TextButton` rather than `FlatButton`. If you wish to still use `FlatButton` set `legacyMaterialDialogActionButtons` on `PlatformSettingsData` which is set on `PlatformProvider`.  

## [1.8.1] 

#### (Flutter version support: v2.2)

- Added extra fields from Flutter 2.2
- Removed deprecated field maxLengthEnforced from PlatformTextField. use maxLengthEnforcement instead

## [1.8.0] 

#### (Flutter version support: v2.2)

- Add `platformPage` to use as part of Navigator's 2.0 implementation
- Add `makeCupertinoDecorationNull` to `PlatformtextField` so cupertino's decoration field can be set to null rather than any default style. the default kDefaultRoundedBorderDecoration is now not private
- Fix issue where `PlatformTabController` was not notifying when index changed.

## [1.7.0, 1.7.1] 

#### (Flutter version support: v2.0+)

- Moved Material wrapper for cupertino under CupertinoScaffold and CuertinoTabScaffold so Material widgets can render for iOS when using PlatformApp. Need to have `settings: PlatformSettingsData(iosUsesMaterialWidgets: true)` on the `PlatformProvider` to enable. This may now render splash effect for Material widgets which would not occurred before. If this change is not needed then use `settings: PlatformSettingsData(legacyIosUsesMaterialWidgets: true)` 
- This setting can be disabled on a per PlatformScaffold basis for Cupertino. See noMaterialParent on `PlatformAppBar` cupertino data property
- Added more PlatformIcons, dehaze, error, help and helpOutline (thanks mlava)
  

## [1.6.0] 

#### (Flutter version support: v2.0+)

- Added `platformThemeData` to get access to the platform specific `ThemeData` more easily

## [1.5.0] 

#### (Flutter version support: v2.0+)

- Added context.platformIcon and additional remove platform icons (thanks vincevargadev)

## [1.4.1] 

#### (Flutter version support: v2.0+)

- Removed unmapped cupertino icons that show up as a 'question mark'
  
## [1.4.0] 

#### (Flutter version support: v2.0+)

- Added `PlatformTextFormField`

## [1.3.0] 

#### (Flutter version support: v2.0+)

- Added PlatformElevatedButton and PlatformTextButton which change to Flutter 2.0 Material elevated and text buttons. Cupertino buttons are unchanged, although now by default match Text > Text and Elevated > Filled
- Updated the Example project
- Start of documentation (github pages)

## [1.2.0] 

#### (Flutter version support: v2.0+)

- Added hintText to PlatformTextField to easier set the hint of the field. Thanks slimyjimmy for the suggestion
- Fixed issue with showPlatformDialog that did not show the `BarrierColor` for the material dialog.

## [1.1.0] 

#### (Flutter version support: v2.0)

- Full null safety support.

## [0.80.1] 

#### (Flutter version support: v2.0)

- fix for `showPlatformDialog` barrierDismissible
- export `PlatformTarget`

## [0.80.0] 

#### (Flutter version support: v2.0)

- Update to include additional params
- Remove a deprecated field

## [0.72.0] 

#### (Flutter version support: v1.22.0 - v1.22.4)

- Adds `materialBuilder` and `cupertinoBuilder` as alternatives to `material` and `cupertino` on `PlatformTabScaffold` so that the widgets can change properties on tab index change. see example/lib/tabbed/dynamicTabbedPage.dart.
- Adds new platform icons, thumb up and down and fix the star icon (thanks DFelten)

## [0.71.0] 

#### (Flutter version support: v1.22.0 - v1.22.3)

- Added `PlatformApp.router` to support Router 2.0

## [0.70.2] 

#### (Flutter version support: v1.22.0)

- fix export of MaterialModalSheetData and CupertinoModalSheetData (thanks in74mz)

## [0.70.1] 

#### (Flutter version support: v1.22.0)

- Used label instead of text for BottomNavigationBarItem in examples
- Removed deprecated android and ios parameters. Use material or cupertino instead
- Added widget parameters introduced in flutter version 1.22.0

## [0.60.2] 

#### (Flutter version support: v1.20.0 - v1.20.2)

- Added const to icons for treeshaking (thanks sck-v)
- Added contributors to ReadMe

## [0.60.1] 

#### (Flutter version support: v1.20)

- Upgrade to flutter version v1.20

## [0.51.0] 

#### (Flutter version support: v1.17.0-v1.17.4)

- added `PlatformWidgetBuilder` which allows to use a platform specific as a parent widget for a child that is the same for both platforms.
- Forced deprecation on widget arguments to make them more obvious
- Added more PlatformIcons (thanks mlava)

## [0.50.1]

#### (Flutter version support: v1.17.0-v1.17.3)

- added `cupertinoTabChildBuilder` to `PlartformScaffold` in order to build cupertino tabs when they are viewed. (thanks AlexIver)

## [0.50.0] 

#### (Flutter version support: v1.17.0-v1.17.1)

- Changed the enhancement of widgets to use an argument matching the style rather than platform. `android: (_){}` becomes `material: (_, __){}` and `ios: (_){}` becomes `cupertino: (_, __){}`. The second argument of the callback is now `PlatformTarget` which will allow a decision (if required) to return a different data object based on the platform.
- `PlatformTarget` is similar to the flutter `TargetPlatform` with the addition of `web`.
- The use of `android: (_){}` and `ios: (_){}` is now deprecated and will be removed in a future release.
- `showPlatformModalSheet` and `showPlatformDialog` has deprecated arguments

## [0.41.0] 

#### (Flutter version support: v1.17.0-v1.17.1)

- Added configurable platform style which allows each target platform to be either Material or Cupertino
- Added more platform icons (thanks mlava)

## [0.40.0] 

#### (Flutter version support: v1.17.0)

- Update widget arguments to match latest flutter widgets.
- Fixed issue with CupertinoPageScaffoldData (thanks josxha)
- Removed deprecated fields (thanks fredgrott)
- Added setIndex to PlatformTabScaffold (thanks GillesMontyne)
- Added more PlatformIcons (thanks mhaid)
- Added CupertinoFilledButton (thanks eyecreate)

## [0.32.5] 

#### (Flutter version support: v1.12.13+hotfix.5)

- Fixed `PlatformButton` for android `FlatButton` to directly use color, disabledColor and padding properties that were missing

## [0.32.4] 

#### (Flutter version support: v1.12.13+hotfix.5)

- Fix for `PlatformTextField` not allowing for `maxLines` to be null which is required when `expands` is true to enable multiline. (Thanks bangfalse)

## [0.32.3] 

#### (Flutter version support: v1.12.13+hotfix.5)

- Fix for `PlatformTabScaffold` to use androidTabs properly. (Thanks abahnj)

## [0.32.2] 

#### (Flutter version support: v1.12.13+hotfix.5)

- Update widget arguments to match latest flutter widgets.

## [0.32.1] 

#### (Flutter version support: v1.12.13+hotfix.5)

- Fix for PlatformTabScaffold that would not pickup the right index or set a default value.

## [0.32.0] 

#### (Flutter version support: v1.12.13+hotfix.5)

- Increased SDK verson to be ">=2.6.0 <3.0.0"
- Added PlatformIcons where Material and Cupertino icons are picked based on the platform
- Added PlatformTabScaffold to offer a simplier and more flexible platform tabbed page

## [0.31.0] 

#### (Flutter version support: v1.12.13+hotfix.5)

- Updated PlatformTextField for Cupertino to support dark mode
- Removed Material from Cupertino Scaffold as it interfers with ios dark mode. If Material widgets are used on ios then this can be turned back on or add the Material widget to places that have it. Set iosUsesMaterialWidgets = true to retain behvour on the settings object passed in as an argument to `PlatformProvider`.
- PlaformSlider for Cupertino uses Colors instead of CupertinoColors to match the underlying flutter widget

## [0.30.1] 

#### (Flutter version support: v1.12.13+hotfix.5)

- Fixes the breaking change from flutter which causes the error: `The getter 'fullObstruction' isn't defined for the class 'ObstructingPreferredSizeWidget'.`
- Updated all widgets compatible with Flutter v1.12.13+hotfix.5

## [0.20.2] 

#### (Flutter version support: v1.9.1+hotfix.2)

- Fixed unselectedFontSize to be a double and not a bool

## [0.20.1] 

#### (Flutter version support: v1.9.1+hotfix.2)

- Added a `Builder` to allow for children of `PlatformProvider` to get the Theme change on the builder argument.

## [0.20.0] 

#### (Flutter version support: v1.9.1+hotfix.2)

- Switching of Platform based off theme. (thanks stefanrusek)
- From now on the only way to dynamically change the target platform is to use `PlatformProvider`
- `PlatformIconButton` can now take a Widget instead of it having to be an Icon (thanks GillesMontyne)

## [0.13.0] 

#### (Flutter version support: v1.9.1+hotfix.2)

- Updated all widgets compatible with Flutter v 1.9.1
- Added showPlatformModalSheet
- Added check for web to allow web to compile (thanks cbenhagen)

## [0.12.0] 

#### (Flutter version support: v1.5.4-hotfix.2)

- Added PlatformProvider so that swicthing platforms can rebuild the tree
- Added Material Flat button option for PlatformButton (see Readme)
- Fixed example issue

## [0.11.5]  (Do not use)

#### (Flutter version support: v1.6.3)

- Added PlatformProvider so that swicthing platforms can rebuild the tree
- Due to pub.dev supporting only Stable channel, version 0.11.5 is not supported.

## [0.11.0]  (Do not use)

#### (Flutter version support: v1.6.3)

- Updated all widgets compatible with Flutter v 1.6.3
- Added Material Flat button option for PlatformButton (see Readme)
- Fixed example issue
- Due to pub.dev supporting only Stable channel, version 0.11.0 is not supported.

## [0.10.0] 

#### (Flutter version support: v1.5.4-hotfix.2)

- Fix for PlatformIconButton and added field. Thanks ericmartineau
- Updated all widgets compatible with Flutter v1.5.4-hotfix.2

## [0.9.6] 

#### (Flutter version support: v1.1.8)

- Added other checks for platforms.
  - Material = Android, Fuchsia, Windows, Linux
  - Cupertino = iOS, MacOS

## [0.9.5]

#### (Flutter version support: v1.1.8)

- Updated all widgets compatible with Flutter v 1.1.8
- Added CupertnoThemeData to PlatformApp to style iOS apps.
- If using PlatformScaffold on each page, no need to define Material widget when using Material widgets on the page

## [0.9.0]

#### (Flutter version support: v1.0.0)

- Added PlatformSlider

## [0.8.3] 

#### (Flutter version support: v1.0.0)

- Fix for PlatformTextField keyboardType. Thanks furkantektas

## [0.8.2]

#### (Flutter version support: v1.0.0)

- Added iosContentBottomPadding on PlatformScaffold to prevent the content going behind the navBar
- Optional android / ios builder for PlatformWidget. No need to specify both if only one if required.

## [0.8.1] 

#### (Flutter version support: v1.0.0)

- Updated README

## [0.8.0] 

#### (Flutter version support: v1.0.0)

- Added PlatformTextField

## [0.7.1]

#### (Flutter version support: v1.0.0)

- Updated the minSDK version
- Moved example.dart up a level to appear on pubspec example page

## [0.7.0]

#### (Flutter version support: v1.0.0)

- Added PlatformSwitch

## [0.6.0] 

#### (Flutter version support: v1.0.0)

- Added PlatformApp. Thanks cmengler
- Added showPlatformDialog which is required to be used if PlatformApp is used and you need to show dialogs
- Added platformPageRoute function to pick the right default route for the platform

## [0.5.0] 

#### (Flutter version support: v1.0.0)

- Redone the way PlaformScaffold renders Cupertino. Requires fluttter version 0.11+
- Added iosContentPadding to PlatformScaffold for iOS to push content down past the navigation (app) bar

## [0.4.0] 

#### (Flutter version support: v0.9.4)

- Caught up with latest flutter verison (0.9.4) adding extra widget properties.

## [0.3.4] 

- Fixed herotag issue when setting transitionBetweenRoutes to true

## [0.3.3] 

- Added transitionBetweenRoutes and heroTag as attributes to CupertinoNavigationBarData

## [0.3.2] 

- Fixed issue with AppBar padding

## [0.3.1] 

- Updated environment to support Dart 2

## [0.3.0]

- Removed hasNotch to be compatible with the flutter develop branch

## [0.2.0]

- Added PlatformCircularProgressIndicator

## [0.1.1 - 0.1.4]

- Bug fixes

## [0.1.0] 

- Inital Release of Platform widgets

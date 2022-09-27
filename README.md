<p align="center">
<img src="https://raw.githubusercontent.com/stryder-dev/flutter_platform_widgets/master/images/logo.png" width="250px" alt="Flutter Platform Widgets" />
</p>

<!-- omit in toc -->
# Flutter Platform Widgets

![Pub](https://img.shields.io/pub/v/flutter_platform_widgets) ![GitHub](https://img.shields.io/github/license/stryder-dev/flutter_platform_widgets)

<!-- omit in toc -->
### TL;DR;
A wrapper library that makes it easier to target the design language of your chosen platform using a single widget.

<!-- omit in toc -->
### Bit more
For anyone that starts with building apps with Flutter it becomes clear that picking the right widget is important. This typically starts with using the Material set of widgets which is the default look and feel for Android. However when designing screens for iOS and the Cupertino design language a double up of effort is required to cater for a new set of widgets.

This project was initially an experiment which grew into a fully fledged package to support the look using the Material and Cupertino designed widgets with a single platform widget.

If you want to build a Material and Cupertino looking app with very similar functionality then this package could save you time and effort.

---

This package supports the **Stable** release as a full released version.

Beta channels might be supported when there is a pre-release version. Please check the CHANGELOG for version compatibility.

Due to Master being in rapid development this package is unable to support the Master channel. If this support is required then it is best to fork the repo and locally reference the forked version where you can make changes appropriately.

---

# Installation

> pub.dev: https://pub.dev/packages/flutter_platform_widgets/install

# How it works <a name="how-it-works"></a>

Instead of having to write conditional code like this...

```dart
if (Platform.isAndroid) {
  return ElevatedButton(onPressed: onPressed, child: child);
} else if (Platform.isIOS) {
  return CupertinoButton.filled(onPressed: onPressed, child: child);
}
```

you can use a single `platform` widget which will render the correct underlying widget based on the `ThemeData.platform` property...

```dart
return PlatformElevatedButton(onPressed: onPressed, child: child);
```
The heavy lifting of choosing the right widget is done for you.

You can also specify what design language you want for any supported platforms within flutter. These include:
* Android
* iOS
* Web
* Macos
* Windows
* Linux

# Docs

View the [package wiki](https://github.com/stryder-dev/flutter_platform_widgets/wiki) for details of how to use and the list of available widgets


# Issues and Feedback

Please [create](https://github.com/stryder-dev/flutter_platform_widgets/issues/new) an issue to provide feedback or an issue.

# License

MIT

# Contributors

Special thanks for everyone that have contributed to this project...

<a href="https://github.com/stryder-dev/flutter_platform_widgets/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=stryder-dev/flutter_platform_widgets" />
</a>

Made with [contrib.rocks](https://contrib.rocks).

Inspired by the example given by Swav Kulinski (https://github.com/swavkulinski/flutter-platform-specific-widgets)

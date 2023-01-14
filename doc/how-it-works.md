
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

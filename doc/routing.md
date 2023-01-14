## Platform Page route

`Material` and `Cupertino` routing animates differently so in order to use flutter's `Navigator` in order to push new routes onto the stack the correct page route needs to be used. This is typically used with the original `Navigator` method.

```dart
 Navigator.push(
    context,
    platformPageRoute(
      context: context,
      builder: pageToDisplayBuilder,
    ),
  );
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | MaterialPageRoute | material: (_, __)  => MaterialPageRouteData(...) |
| Cupertino | CupertinoPageRoute | cupertino: (_, __) => CupertinoPageRouteData(...) |


## Platform page

When using the declarative style of navigation routing, specficially when using `PlatformApp.router` you can wrap you page level widgets with `PlatformPage` so they can be added to the list of pages for the router.

```dart
platformPage(
    context: context,
    child: child,
  ),
);
```

Uses:
| Platform  | Widget  | Extended props add...
|---|---|---|
| Material | MaterialPage | material: (_, __)  => MaterialPageData(...) |
| Cupertino | CupertinoPage | cupertino: (_, __) => CupertinoPageData(...) |
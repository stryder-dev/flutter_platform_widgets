import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart';
import 'platform.dart';

class PlatformNavigator {
  // TODO other push/pop types.

  @optionalTypeArgs
  static Future<T> push<T extends Object>(
    BuildContext context, {
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String iosTitle,
  }) {
    if (isMaterial) {
      return Navigator.push<T>(
        context,
        MaterialPageRoute(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
      );
    } else {
      return Navigator.push<T>(
        context,
        CupertinoPageRoute(
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            title: iosTitle),
      );
    }
  }
}

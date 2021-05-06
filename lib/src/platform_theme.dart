import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Common theme control for Material and Cupertino styled apps
///
/// If [primaryColor], [accentColor], [bottomAppBarColor], [scaffoldBackgroundColor]
/// are passed in then they will override the equivalent value within [ThemeData] and
/// [CupertinoThemeData]. Ideally setting these mean that both platforms will have the
/// same color. If requried to be differemnt instead set the [materialTheme] or [cupertinoTheme]
/// parameters
class PlatformTheme extends StatelessWidget {
  final Widget child;

  final ThemeData? materialTheme;
  final CupertinoThemeData? cupertinoTheme;

  /// Material [ThemeData.primaryColor] and Cupertino [CupertinoThemeData.primaryColor]
  final Color? primaryColor;

  /// Material [ThemeData.accentColor] and Cupertino [CupertinoThemeData.primaryContrastingColor]
  final Color? accentColor;

  /// Material [ThemeData.bottomAppBarColor] and Cupertino [CupertinoThemeData.barBackgroundColor]
  final Color? bottomAppBarColor;

  /// Material [ThemeData.scaffoldBackgroundColor] and Cupertino [CupertinoThemeData.scaffoldBackgroundColor]
  final Color? scaffoldBackgroundColor;

  const PlatformTheme({
    Key? key,
    required this.child,
    this.primaryColor,
    this.accentColor,
    this.bottomAppBarColor,
    this.scaffoldBackgroundColor,
    this.materialTheme,
    this.cupertinoTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _materialTheme(),
      child: CupertinoTheme(
        data: _cupertinoTheme(),
        child: child,
      ),
    );
  }

  ThemeData _materialTheme() {
    final theme = materialTheme ?? ThemeData.fallback();

    return theme.copyWith(
      cupertinoOverrideTheme: _cupertinoTheme(),
      primaryColor: primaryColor ?? theme.primaryColor,
      accentColor: accentColor ?? theme.accentColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? theme.scaffoldBackgroundColor,
      bottomAppBarColor: bottomAppBarColor ?? theme.bottomAppBarColor,
    );
  }

  CupertinoThemeData _cupertinoTheme() {
    final theme = cupertinoTheme ?? const CupertinoThemeData();

    return theme.copyWith(
      primaryColor: primaryColor ?? theme.primaryColor,
      primaryContrastingColor: accentColor ?? theme.primaryContrastingColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? theme.scaffoldBackgroundColor,
      barBackgroundColor: bottomAppBarColor ?? theme.barBackgroundColor,
    );
  }
}

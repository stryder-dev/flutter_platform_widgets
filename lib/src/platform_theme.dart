import 'package:flutter/cupertino.dart' show CupertinoThemeData;
import 'package:flutter/material.dart' show Theme, ThemeData, ThemeMode;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_provider.dart';

class PlatformTheme extends StatefulWidget {
  final WidgetBuilder builder;
  final ThemeData? materialLightTheme;
  final ThemeData? materialDarkTheme;
  final CupertinoThemeData? cupertinoLightTheme;
  final CupertinoThemeData? cupertinoDarkTheme;
  final ThemeMode? themeMode;
  final bool matchCupertinoSystemChromeBrightness;
  final void Function(ThemeMode? mode)? onThemeModeChanged;

  const PlatformTheme({
    required this.builder,
    this.themeMode,
    this.materialLightTheme,
    this.materialDarkTheme,
    this.cupertinoLightTheme,
    this.cupertinoDarkTheme,
    this.matchCupertinoSystemChromeBrightness = true,
    this.onThemeModeChanged,
    super.key,
  });

  static PlatformThemeState? of(BuildContext context) {
    _PlatformThemeState? state =
        context.findAncestorStateOfType<_PlatformThemeState>();

    return state?.state;
  }

  @override
  State<PlatformTheme> createState() => _PlatformThemeState();
}

class _PlatformThemeState extends State<PlatformTheme>
    with WidgetsBindingObserver {
  PlatformThemeState get state => PlatformThemeState._(this);

  void _init() {
    _themeMode = widget.themeMode;
    _materialLightTheme = _useMaterial3Light == null
        ? widget.materialLightTheme
        : widget.materialLightTheme?.copyWith(useMaterial3: _useMaterial3Light);
    _materialDarkTheme = _useMaterial3Dark == null
        ? widget.materialDarkTheme
        : widget.materialDarkTheme?.copyWith(useMaterial3: _useMaterial3Dark);
    _cupertinoLightTheme = widget.cupertinoLightTheme;
    _cupertinoDarkTheme = widget.cupertinoDarkTheme;
    _matchCupertinoSystemChromeBrightness =
        widget.matchCupertinoSystemChromeBrightness;

    _useMaterial3Light =
        _useMaterial3Light ?? widget.materialLightTheme?.useMaterial3;
    _useMaterial3Dark =
        _useMaterial3Dark ?? widget.materialDarkTheme?.useMaterial3;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    // Force rebuild which will get the correct system brightness
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant PlatformTheme oldWidget) {
    super.didUpdateWidget(oldWidget);

    _init();
  }

  bool _matchCupertinoSystemChromeBrightness = true;

  ThemeData? _materialLightTheme;
  ThemeData? _materialDarkTheme;
  CupertinoThemeData? _cupertinoLightTheme;
  CupertinoThemeData? _cupertinoDarkTheme;

  ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;
  set themeMode(ThemeMode? mode) => setState(() {
        _themeMode = mode;
        widget.onThemeModeChanged?.call(mode);
      });

  bool get isDark {
    final platformBrightness =
        View.of(context).platformDispatcher.platformBrightness;
    return themeMode == ThemeMode.system
        ? platformBrightness == Brightness.dark
        : themeMode == ThemeMode.dark;
  }

  bool? _useMaterial3Light;
  bool? _useMaterial3Dark;
  void changeToMaterial3({bool applyToBothDarkAndLightTheme = false}) =>
      _setMaterialThemeType(
          useMaterial3: true,
          applyToBothDarkAndLightTheme: applyToBothDarkAndLightTheme);

  void changeToMaterial2({bool applyToBothDarkAndLightTheme = false}) =>
      _setMaterialThemeType(
          useMaterial3: false,
          applyToBothDarkAndLightTheme: applyToBothDarkAndLightTheme);

  void resetMaterial({bool applyToBothDarkAndLightTheme = false}) {
    _setMaterialThemeType(
        useMaterial3: null,
        applyToBothDarkAndLightTheme: applyToBothDarkAndLightTheme);
  }

  void _setMaterialThemeType({
    required bool? useMaterial3,
    bool applyToBothDarkAndLightTheme = false,
  }) {
    setState(() {
      if (applyToBothDarkAndLightTheme) {
        _useMaterial3Dark = _useMaterial3Light = useMaterial3;
        _materialDarkTheme =
            _materialDarkTheme?.copyWith(useMaterial3: useMaterial3);
        _materialLightTheme =
            _materialLightTheme?.copyWith(useMaterial3: useMaterial3);
      } else {
        isDark
            ? _useMaterial3Dark = useMaterial3
            : _useMaterial3Light = useMaterial3;
        isDark
            ? _materialDarkTheme =
                _materialDarkTheme?.copyWith(useMaterial3: useMaterial3)
            : _materialLightTheme =
                _materialLightTheme?.copyWith(useMaterial3: useMaterial3);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_matchCupertinoSystemChromeBrightness) {
      if (isCupertino(context)) {
        SystemChrome.setSystemUIOverlayStyle(
          isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        );
      }
    }

    final platform = PlatformProvider.of(context)?.platform;
    final mDarkTheme = _materialDarkTheme ?? _materialLightTheme;
    return Theme(
      data: (isDark
              ? mDarkTheme?.copyWith(platform: platform)
              : _materialLightTheme?.copyWith(platform: platform)) ??
          Theme.of(context),
      child: Builder(
        builder: (context) => widget.builder(context),
      ),
    );
  }
}

class PlatformThemeState {
  PlatformThemeState._(this._parent);

  final _PlatformThemeState _parent;

  ThemeMode? get themeMode => _parent.themeMode;
  set themeMode(ThemeMode? themeMode) => _parent.themeMode = themeMode;

  bool get isDark => _parent.isDark;

  CupertinoThemeData? get cupertinoLightTheme => _parent._cupertinoLightTheme;
  CupertinoThemeData? get cupertinoDarkTheme => _parent._cupertinoDarkTheme;

  ThemeData? get materialLightTheme => _parent._materialLightTheme;
  ThemeData? get materialDarkTheme => _parent._materialDarkTheme;

  void changeToMaterial3({bool applyToBothDarkAndLightTheme = false}) =>
      _parent.changeToMaterial3(
          applyToBothDarkAndLightTheme: applyToBothDarkAndLightTheme);

  void changeToMaterial2({bool applyToBothDarkAndLightTheme = false}) =>
      _parent.changeToMaterial2(
          applyToBothDarkAndLightTheme: applyToBothDarkAndLightTheme);

  void resetToMaterialDefaultVersion(
          {bool applyToBothDarkAndLightTheme = false}) =>
      _parent.resetMaterial(
          applyToBothDarkAndLightTheme: applyToBothDarkAndLightTheme);
}

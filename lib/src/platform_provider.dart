import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A Provider that provides access to the functions of swicthing platforms.
///
/// When placed at the root, it will rebuild the application with the new platform
/// and therefore when [PlatformWidgets] are used within the application
/// will render based on those widgets
///
/// Usage:
/// ```dart
/// return PlatformProvider(
///    builder: (BuildContext context) MaterialApp(...)
/// );
/// ```
///
/// Gain access through the InheritedWidget:
/// ```dart
/// PlatformProvider.of(context).changeToMaterialPlatform();
///
/// or
///
/// PlatformProvider.of(context).changeToCupertinoPlatform();
/// ```
class PlatformProvider extends StatefulWidget {
  const PlatformProvider({
    required this.builder,
    this.initialPlatform,
    this.settings,
  });

  final WidgetBuilder builder;
  final TargetPlatform? initialPlatform;
  final PlatformSettingsData? settings;

  static PlatformProviderState? of(BuildContext context) {
    _PlatformProviderState? state =
        context.findAncestorStateOfType<_PlatformProviderState>();

    return state?.state;
  }

  @override
  _PlatformProviderState createState() => _PlatformProviderState();
}

class _PlatformProviderState extends State<PlatformProvider> {
  late TargetPlatform? platform;

  PlatformProviderState get state => PlatformProviderState._(this);

  @override
  void initState() {
    super.initState();
    platform = widget.initialPlatform;
  }

  void changeToPlatform(TargetPlatform platform) {
    setState(() {
      this.platform = platform;
    });
  }

  /// Sets the platform to be [TargetPlatform.android]
  void changeToMaterialPlatform() {
    setState(() {
      platform = TargetPlatform.android;
    });
  }

  /// Sets the platform to be [TargetPlatform.iOS]
  void changeToCupertinoPlatform() {
    setState(() {
      platform = TargetPlatform.iOS;
    });
  }

  void changeToAutoDetectPlatform() {
    setState(() {
      platform = null;
    });
  }

  PlatformSettingsData? get settings => widget.settings;

  @override
  Widget build(BuildContext context) {
    if (platform == null) return widget.builder(context);

    return Theme(
      data: Theme.of(context).copyWith(platform: platform),
      child: Builder(
        builder: (context) => widget.builder(context),
      ),
    );
  }
}

class PlatformProviderState {
  PlatformProviderState._(this._parent);

  final _PlatformProviderState _parent;

  TargetPlatform? get platform => _parent.platform;

  PlatformSettingsData get settings =>
      _parent.settings ?? PlatformSettingsData();

  void changeToMaterialPlatform() {
    _parent.changeToMaterialPlatform();
  }

  void changeToCupertinoPlatform() {
    _parent.changeToCupertinoPlatform();
  }

  void changeToAutoDetectPlatform() {
    _parent.changeToAutoDetectPlatform();
  }
}

class PlatformSettingsData {
  /// Adds a [Material] widget to [CupertinoScaffold] and [CupertinoTabScaffold] to
  /// allow for Material widgets to be used. This is required when using a PlatformApp
  /// since some Material widgets will expect a Material parent, otherwise an exception is thrown.
  /// Note: This may affect fonts and colors and dark mode may not work in all cases.
  ///
  /// Note: This may cause widgtes to show a ripple effect where as before 1.6.0 it did not
  final bool iosUsesMaterialWidgets;

  /// Adds a [Material] widget to [CupertinoScaffold] and [CupertinoTabScaffold] to
  /// allow for Material widgets to be used. This is required when using a PlatformApp
  /// since some Material widgets will expect a Material parent, otherwise an exception is thrown.
  ///  Note: This may affect fonts and colors and dark mode may not work in all cases.
  ///
  /// Note: legacyIosUsesMaterialWidgets places the Material widget above the CupertinoScaffold and
  /// CupertinoTabScaffold widgets matching the behavour before v1.6.0
  final bool legacyIosUsesMaterialWidgets;

  // ignore: deprecated_member_use
  /// When true it uses [FlatButton] for [PlatformDialogActon] which is used before v1.9.0
  /// Otherwise the Materiasl dialog actions use [TextButton]
  final bool legacyMaterialDialogActionButtons;

  /// The style each platform will use. Either [PlatformStyle.Material] or
  /// [PlatformStyle.Cupertino].
  final PlatformStyleData platformStyle;

  PlatformSettingsData({
    this.iosUsesMaterialWidgets = false,
    this.legacyIosUsesMaterialWidgets = false,
    @Deprecated('legacyMaterialDialogActionButtons will be removed from future versions and will be always false. Will use new Material TextButton as Dialog action buttons')
        this.legacyMaterialDialogActionButtons = false,
    this.platformStyle = const PlatformStyleData(),
  });
}

enum PlatformStyle {
  Material,
  Cupertino,
}

class PlatformStyleData {
  final PlatformStyle android;
  final PlatformStyle ios;
  final PlatformStyle macos;
  final PlatformStyle windows;
  final PlatformStyle web;
  final PlatformStyle fuchsia;
  final PlatformStyle linux;

  const PlatformStyleData({
    this.android = PlatformStyle.Material,
    this.ios = PlatformStyle.Cupertino,
    this.macos = PlatformStyle.Cupertino,
    this.windows = PlatformStyle.Material,
    this.web = PlatformStyle.Material,
    this.fuchsia = PlatformStyle.Material,
    this.linux = PlatformStyle.Material,
  });
}

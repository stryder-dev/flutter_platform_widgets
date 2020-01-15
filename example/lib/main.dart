import 'package:flutter/cupertino.dart'
    show
        CupertinoActionSheet,
        CupertinoActionSheetAction,
        CupertinoIcons,
        CupertinoThemeData;
import 'package:flutter/material.dart' show Colors, Icons, ThemeData, ThemeMode;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'iconPage.dart';
import 'listViewHeaderPage.dart';
import 'listViewPage.dart';
import 'tabbed/basicTabbedPage.dart';
import 'tabbed/originalTabbedPage.dart';
import 'tabbed/sliverTabbedPage.dart';
import 'tabbedPage.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => App();
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Brightness brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    final themeData = new ThemeData(
      primarySwatch: Colors.purple,
    );

    final cupertinoTheme = new CupertinoThemeData(
      primaryColor: Colors.purple,
    );
    final cupertinoDarkTheme = new CupertinoThemeData(
      primaryColor: Colors.cyan,
      brightness: Brightness.dark,
    );

    // Example of optionally setting the platform upfront.
    //final initialPlatform = TargetPlatform.iOS;

    // If you mix material and cupertino widgets together then you cam
    // set this setting. Will mean ios darmk mode to not to work properly
    //final settings = PlatformSettingsData(iosUsesMaterialWidgets: true);

    return PlatformProvider(
      builder: (context) => PlatformApp(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        title: 'Flutter Platform Widgets',
        android: (_) {
          return new MaterialAppData(
            theme: themeData,
            darkTheme: themeData.copyWith(
              brightness: Brightness.dark,
            ),
            themeMode: brightness == Brightness.light
                ? ThemeMode.light
                : ThemeMode.dark,
          );
        },
        ios: (_) => new CupertinoAppData(
          theme: brightness == Brightness.light
              ? cupertinoTheme
              : cupertinoDarkTheme,
        ),
        home: LandingPage(() {
          setState(() {
            brightness = brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light;
          });
        }),
      ),
      // ),
    );
  }
}

class LandingPage extends StatefulWidget {
  LandingPage(this.toggleBrightness);

  final void Function() toggleBrightness;

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  initState() {
    super.initState();

    textControlller = TextEditingController(text: 'text');
  }

  bool switchValue = false;
  double sliderValue = 0.5;

  TextEditingController textControlller;

  _switchPlatform(BuildContext context) {
    if (isMaterial(context)) {
      PlatformProvider.of(context).changeToCupertinoPlatform();
    } else {
      PlatformProvider.of(context).changeToMaterialPlatform();
    }
  }

  _toggleBrightness() {
    widget.toggleBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      appBar: PlatformAppBar(
        title: Text('Flutter Platform Widgets'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Primary concept of this package is to use the same widgets to create iOS (Cupertino) or Android (Material) looking apps rather than needing to discover what widgets to use.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'This approach is best when both iOS and Android apps follow the same design in layout and navigation, but need to look as close to native styling as possible.'),
            ),
            Divider(),
            PlatformButton(
              child: PlatformText('Toggle Dark / Light mode'),
              onPressed: _toggleBrightness,
            ),
            Divider(),
            SectionHeader(title: '1. Change Platform'),
            PlatformButton(
              child: PlatformText('Switch Platform'),
              onPressed: () => _switchPlatform(context),
            ),
            PlatformWidget(
              android: (_) => Text('Currently showing Material'),
              ios: (_) => Text('Currently showing Cupertino'),
            ),
            Text('Scaffold: PlatformScaffold'),
            Text('AppBar: PlatformAppBar'),
            Divider(),
            SectionHeader(title: '2. Basic Widgets'),
            PlatformText(
              'PlatformText will uppercase for Material only',
              textAlign: TextAlign.center,
            ),
            PlatformButton(
              child: PlatformText('PlatformButton'),
              onPressed: () {},
            ),
            PlatformButton(
              child: PlatformText('Platform Flat Button'),
              onPressed: () {},
              androidFlat: (_) => MaterialFlatButtonData(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformIconButton(
                androidIcon: Icon(Icons.home),
                iosIcon: Icon(CupertinoIcons.home),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformSwitch(
                value: switchValue,
                onChanged: (bool value) => setState(() => switchValue = value),
              ),
            ),
            PlatformSlider(
              value: sliderValue,
              onChanged: (double newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformTextField(
                controller: textControlller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformCircularProgressIndicator(),
            ),
            Divider(),
            SectionHeader(title: '3. Dialogs'),
            PlatformButton(
              child: PlatformText('Show Dialog'),
              onPressed: () => _showExampleDialog(),
            ),
            Divider(),
            SectionHeader(title: '4. Popup/Sheet'),
            PlatformButton(
              child: PlatformText('Show Popup/Sheet'),
              onPressed: () => _showPopupSheet(),
            ),
            Divider(),
            SectionHeader(title: '5. Navigation'),
            PlatformButton(
              child: PlatformText('Open Tabbed Page'),
              onPressed: () => _openPage((_) => TabbedPage()),
            ),
            PlatformButton(
              child: PlatformText('Open Basic Tabbed Page'),
              onPressed: () => _openPage((_) => BasicTabbedPage()),
            ),
            PlatformButton(
              child: PlatformText('Open Sliver Tabbed Page'),
              onPressed: () => _openPage((_) => SliverTabbedPage()),
            ),
            PlatformButton(
              child: PlatformText('Open Original Tabbed Page'),
              onPressed: () => _openPage((_) => OriginalTabbedPage()),
            ),
            Divider(),
            SectionHeader(title: '6. Icons'),
            PlatformButton(
              child: PlatformText('Open Icons Page'),
              onPressed: () => _openPage((_) => IconsPage()),
            ),
            Divider(),
            SectionHeader(title: '7. Advanced'),
            PlatformButton(
              child: PlatformText('Page with ListView'),
              onPressed: () => _openPage((_) => ListViewPage()),
            ),
            PlatformWidget(
              android: (_) => Container(), //this is for iOS only
              ios: (_) => PlatformButton(
                child: PlatformText('iOS Page with Colored Header'),
                onPressed: () => _openPage((_) => ListViewHeaderPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openPage(WidgetBuilder pageToDisplayBuilder) {
    Navigator.push(
      context,
      platformPageRoute(
        context: context,
        builder: pageToDisplayBuilder,
      ),
    );
  }

  _showPopupSheet() {
    showPlatformModalSheet(
      context: context,
      builder: (_) => PlatformWidget(
        android: (_) => _androidPopupContent(),
        ios: (_) => _cupertinoSheetContent(),
      ),
    );
  }

  Widget _androidPopupContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: PlatformText('Option 1'),
            ),
            onTap: () => Navigator.pop(context),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: PlatformText('Option 2'),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _cupertinoSheetContent() {
    return CupertinoActionSheet(
      title: const Text('Favorite Dessert'),
      message:
          const Text('Please select the best dessert from the options below.'),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Profiteroles'),
          onPressed: () {
            Navigator.pop(context, 'Profiteroles');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Cannolis'),
          onPressed: () {
            Navigator.pop(context, 'Cannolis');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Trifle'),
          onPressed: () {
            Navigator.pop(context, 'Trifle');
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
      ),
    );
  }

  _showExampleDialog() {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: Text('Alert'),
        content: Text('Some content'),
        actions: <Widget>[
          PlatformDialogAction(
            android: (_) => MaterialDialogActionData(),
            ios: (_) => CupertinoDialogActionData(),
            child: PlatformText('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          PlatformDialogAction(
            child: PlatformText('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      color: new Color(0xff999999),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
    );
  }
}

import 'package:flutter/cupertino.dart'
    show
        CupertinoActionSheet,
        CupertinoActionSheetAction,
        CupertinoDynamicColor,
        CupertinoIcons,
        CupertinoThemeData,
        DefaultCupertinoLocalizations;
import 'package:flutter/material.dart'
    show
        Colors,
        DefaultMaterialLocalizations,
        Icons,
        Theme,
        ThemeData,
        ThemeMode;
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
    final materialTheme = new ThemeData(
      primarySwatch: Colors.purple,
    );
    final materialDarkTheme = new ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.teal,
    );

    final cupertinoTheme = new CupertinoThemeData(
      brightness: brightness, // if null will use the system theme
      primaryColor: CupertinoDynamicColor.withBrightness(
        color: Colors.purple,
        darkColor: Colors.cyan,
      ),
    );

    // Example of optionally setting the platform upfront.
    //final initialPlatform = TargetPlatform.iOS;

    // If you mix material and cupertino widgets together then you cam
    // set this setting. Will mean ios darmk mode to not to work properly
    //final settings = PlatformSettingsData(iosUsesMaterialWidgets: true);

    // This theme is required since icons light/dark mode will look for it
    return Theme(
      data: brightness == Brightness.light ? materialTheme : materialDarkTheme,
      child: PlatformProvider(
        //initialPlatform: initialPlatform,
        // settings: PlatformSettingsData(
        //   platformStyle: PlatformStyleData(
        //     web: PlatformStyle.Cupertino,
        //   ),
        // ),
        builder: (context) => PlatformApp(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Platform Widgets',
          material: (_, __) {
            return new MaterialAppData(
              theme: materialTheme,
              darkTheme: materialDarkTheme,
              themeMode: brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          cupertino: (_, __) => new CupertinoAppData(
            theme: cupertinoTheme,
          ),
          home: LandingPage(() {
            setState(() {
              brightness = brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light;
            });
          }),
        ),
      ),
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
    textMultiLineControlller = TextEditingController(text: 'text multi line');
  }

  bool switchValue = false;
  double sliderValue = 0.5;

  TextEditingController textControlller;

  TextEditingController textMultiLineControlller;

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
        trailingActions: <Widget>[
          PlatformIconButton(
            padding: EdgeInsets.zero,
            icon: Icon(context.platformIcons.share),
            onPressed: () {},
          ),
        ],
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
              material: (_, __) => Text('Currently showing Material'),
              cupertino: (_, __) => Text('Currently showing Cupertino'),
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
              child: PlatformText('Platform Flat/Filled Button'),
              onPressed: () {},
              materialFlat: (_, __) => MaterialFlatButtonData(),
              cupertinoFilled: (_, __) => CupertinoFilledButtonData(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformIconButton(
                materialIcon: Icon(Icons.home),
                cupertinoIcon: Icon(CupertinoIcons.home),
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
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 100,
              child: PlatformTextField(
                expands: true,
                maxLines: null,
                controller: textMultiLineControlller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformCircularProgressIndicator(
                cupertino: (_, __) => CupertinoProgressIndicatorData(),
                material: (_, __) => MaterialProgressIndicatorData(),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformWidgetBuilder(
                cupertino: (_, child, __) => GestureDetector(
                  child: child,
                  onTap: () => print('Cupertino PlatformWidgetBuilder'),
                ),
                material: (_, child, __) => GestureDetector(
                  child: child,
                  onTap: () => print('Material PlatformWidgetBuilder'),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: PlatformText('Platform Widget Builder'),
                ),
              ),
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
              cupertino: (_, __) => PlatformButton(
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
        material: (_, __) => _androidPopupContent(),
        cupertino: (_, __) => _cupertinoSheetContent(),
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
            material: (_, __) => MaterialDialogActionData(),
            cupertino: (_, __) => CupertinoDialogActionData(),
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

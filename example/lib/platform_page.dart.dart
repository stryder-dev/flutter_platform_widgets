import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'cupertino_date_picker.dart';
import 'extensions.dart';
import 'icons_page.dart';
import 'logo.dart';
import 'material_ios_page.dart';
import 'platform_widget_example.dart';
import 'sliver_app_bar_page.dart';
import 'tab_impl_page.dart';

class PlatformPage extends StatelessWidget {
  const PlatformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: const PlatformAppBar(
        title: Text('Flutter Platform Widgets'),
      ),
      body: PlatformScrollbar(
        thumbVisibility: true,
        child: ListView(
          children: [
            const FlutterPlatformWidgetsLogo(size: 60),
            const Divider(thickness: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformElevatedButton(
                  child: PlatformText('Change Platform'),
                  onPressed: () {
                    final p = PlatformProvider.of(context)!;

                    isMaterial(context)
                        ? p.changeToCupertinoPlatform()
                        : p.changeToMaterialPlatform();
                  }),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformElevatedButton(
                  child: PlatformText(
                      'Theme mode${_getThemeMode(PlatformTheme.of(context)?.themeMode)}'),
                  onPressed: () {
                    final mode = PlatformTheme.of(context)?.themeMode;
                    final newMode = _cycleThemeMode(mode);

                    PlatformTheme.of(context)?.themeMode = newMode;
                  }),
            ),
            const Divider(thickness: 10),
            // ! PlatformSearchBar
            PlatformWidgetExample(
              title:
                  'PlatformSearchBar ${isMaterial(context) ? " (Material 3 only)" : ""}',
              builder: (context, platform) => PlatformSearchBar(
                onChanged: (value) =>
                    debugPrint('${platform.text} SearchBar changed: $value'),
                onTap: () => debugPrint('${platform.text} SearchBar tapped'),
                hintText: '${platform.text} SearchBar',
              ),
            ),
            // ! PlatformListTile
            PlatformWidgetExample(
              title: 'PlatformListTile',
              builder: (_, platform) => PlatformListTile(
                leading: Icon(context.platformIcons.book),
                title: PlatformText('title'),
                subtitle: PlatformText('subtitle'),
                trailing: Icon(context.platformIcons.rightChevron),
                onTap: () => debugPrint('${platform.text} PlatformListTile'),
              ),
            ),
            // ! PlatformText
            PlatformWidgetExample(
              title: 'PlatformText',
              builder: (_, platform) => PlatformText(
                '${platform.text} Text',
                textAlign: TextAlign.center,
              ),
            ),
            // ! PlatformWidget
            PlatformWidgetExample(
              title: 'PlatformWidget',
              builder: (_, platform) => PlatformWidget(
                material: (_, __) => Text(
                  'Showing ${platform.text}',
                  textAlign: TextAlign.center,
                ),
                cupertino: (_, __) => Text(
                  'Showing ${platform.text}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // ! PlatformCheckbox
            PlatformWidgetExample(
              title: 'PlatformCheckbox',
              builder: (_, __) => StateProvider<bool>(
                initialValue: false,
                builder: (_, value, setValue) => PlatformCheckbox(
                  value: value,
                  onChanged: (newValue) {
                    setValue(newValue!);
                  },
                ),
              ),
            ),
            // ! PlatformRadio
            PlatformWidgetExample(
              title: 'PlatformRadio',
              builder: (_, platform) => StateProvider<String?>(
                initialValue: 'One',
                builder: (_, value, setValue) => RadioGroup<String>(
                  groupValue: value,
                  onChanged: (value) => setValue(value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlatformRadio<String>(
                        value: 'One',
                      ),
                      PlatformRadio<String>(
                        value: 'Two',
                      ),
                      PlatformRadio<String>(
                        value: 'Three',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ! PlatformElevatedButton
            PlatformWidgetExample(
              title: 'PlatformElevatedButton',
              builder: (_, platform) => PlatformElevatedButton(
                child: Text(platform.text),
                onPressed: () => debugPrint('${platform.text} PlatformButton'),
                padding: const EdgeInsets.all(8),
                color: Colors.orange,
              ),
            ),
            PlatformWidgetExample(
              title: 'PlatformElevatedButton Icon',
              builder: (_, platform) => PlatformElevatedButton(
                child: Text(platform.text),
                onPressed: () => debugPrint('${platform.text} PlatformButton'),
                padding: const EdgeInsets.all(8),
                material: (_, __) => MaterialElevatedButtonData(
                  icon: const Icon(Icons.home),
                ),
                cupertino: (_, __) => CupertinoElevatedButtonData(
                  originalStyle: true,
                ),
              ),
            ),
            // ! PlatformTextButton
            PlatformWidgetExample(
              title: 'PlatformTextButton',
              builder: (_, platform) => PlatformTextButton(
                child: Text(platform.text),
                onPressed: () => debugPrint('${platform.text} PlatformButton'),
                padding: const EdgeInsets.all(8),
              ),
            ),
            PlatformWidgetExample(
              title: 'PlatformTextButton Icon',
              builder: (_, platform) => PlatformTextButton(
                child: Text(platform.text),
                onPressed: () => debugPrint('${platform.text} PlatformButton'),
                padding: const EdgeInsets.all(8),
                material: (_, __) => MaterialTextButtonData(
                  icon: const Icon(Icons.home),
                ),
                cupertino: (_, __) => CupertinoTextButtonData(
                  originalStyle: true,
                ),
              ),
            ),
            // ! PlatformSwitch
            PlatformWidgetExample(
              title: 'PlatformSwitch',
              builder: (_, __) => StateProvider<bool>(
                initialValue: false,
                builder: (_, value, setValue) => PlatformSwitch(
                  onChanged: setValue,
                  value: value,
                ).center,
              ),
            ),
            // ! PlatformSlider
            PlatformWidgetExample(
              title: 'PlatformSlider',
              builder: (_, __) => StateProvider<double>(
                initialValue: 0.5,
                builder: (_, value, setValue) => PlatformSlider(
                  onChanged: setValue,
                  value: value,
                ),
              ),
            ),
            // ! PlatformIconButton
            PlatformWidgetExample(
              title: 'PlatformIconButton',
              builder: (context, __) => PlatformIconButton(
                icon: Icon(context.platformIcons.folder),
                onPressed: () {},
              ),
            ),
            // ! PlatformTextField
            PlatformWidgetExample(
              title: 'PlatformTextField',
              builder: (_, platform) =>
                  PlatformTextField(hintText: platform.text),
            ),
            PlatformWidgetExample(
              title: 'PlatformTextField multiline',
              builder: (_, platform) => SizedBox(
                height: 100,
                child: PlatformTextField(
                  hintText: platform.text,
                  expands: true,
                  maxLines: null,
                ),
              ),
            ),
            // ! PlatformTextFormField
            PlatformWidgetExample(
              title: 'PlatformTextFormField',
              builder: (_, platform) => PlatformTextFormField(
                hintText: 'hint',
                validator: (value) =>
                    (value?.length ?? 0) < 3 ? 'Not enough' : null,
                autovalidateMode: AutovalidateMode.always,
              ),
            ),

            // ! PlatformCircularProgressIndicator
            // _PlatformWidgetExample(
            //   title: 'PlatformCircularProgressIndicator',
            //   builder: (_) => PlatformCircularProgressIndicator().center,
            // ),
            // ! PlatformWidgetBuilder
            PlatformWidgetExample(
              title: 'PlatformWidgetBuilder',
              builder: (_, platform) => PlatformWidgetBuilder(
                cupertino: (_, child, __) => GestureDetector(
                  child: child,
                  onTap: () => debugPrint('Cupertino PlatformWidgetBuilder'),
                ),
                material: (_, child, __) => InkWell(
                  child: child,
                  onTap: () => debugPrint('Material PlatformWidgetBuilder'),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: PlatformText('Tap me (${platform.text})').center,
                ),
              ),
            ),
            // ! platformThemeData
            PlatformWidgetExample(
              title: 'platformThemeData',
              builder: (context, platform) => Text(
                platform.text,
                textAlign: TextAlign.center,
                style: platformThemeData(
                  context,
                  material: (data) => data.textTheme.headlineSmall,
                  cupertino: (data) => data.textTheme.navTitleTextStyle,
                ),
              ),
            ),
            // ! Popup Menu
            PlatformWidgetExample(
              title: 'Popup Menu',
              builder: (_, platform) => PlatformPopupMenu(
                icon: Icon(
                  context.platformIcon(
                    material: Icons.more_vert_rounded,
                    cupertino: CupertinoIcons.ellipsis,
                  ),
                ),
                options: [
                  PopupMenuOption(label: 'One'),
                  PopupMenuOption(
                    label: 'Two',
                    material: (_, __) => MaterialPopupMenuOptionData(
                      withDivider: true,
                    ),
                  ),
                  PopupMenuOption(label: 'Three'),
                ],
              ),
            ),
            // ! Date Picker
            PlatformWidgetExample(
              title: 'showPlatformDatePicker',
              builder: (_, platform) => PlatformElevatedButton(
                child: Text(platform.text),
                onPressed: () => _showDatePicker(context),
              ),
            ),
            // ! Date Picker with Custom iOS
            PlatformWidgetExample(
              title: 'showPlatformDatePicker (Custom Cupertino 1 )',
              builder: (_, platform) => PlatformElevatedButton(
                child: Text(platform.text),
                onPressed: () => showDatePickerWithCustomCupertino(context),
              ),
            ),
            PlatformWidgetExample(
              title: 'showPlatformDatePicker (Custom Cupertino 2)',
              builder: (_, platform) => PlatformElevatedButton(
                child: Text(platform.text),
                onPressed: () =>
                    showDatePickerWithCustomCupertinoStateful(context),
              ),
            ),
            // ! Dialogs
            PlatformWidgetExample(
              title: 'showPlatformDialog',
              builder: (context, platform) => PlatformElevatedButton(
                child: Text(platform.text),
                onPressed: () => _showExampleDialog(context, platform.text),
              ),
            ),
            // ! Bottomsheet
            PlatformWidgetExample(
              title: 'showPlatformModalSheet',
              builder: (context, platform) => PlatformElevatedButton(
                child: Text(platform.text),
                onPressed: () => _showPopupSheet(context, platform.text),
              ),
            ),
            // ! Tab pages
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformElevatedButton(
                child: const Text('Show Tabbed Pages'),
                onPressed: () => Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (context) => const TabImplementationPage(),
                  ),
                ),
              ),
            ),

            // ! Platform Sliver AppBar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformElevatedButton(
                child: const Text('Show  Sliver AppBar Page'),
                onPressed: () => Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (context) => const PlatformSliverAppBarPage(),
                  ),
                ),
              ),
            ),
            // ! Material on iOS
            if (isCupertino(context))
              // ! Icons
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformElevatedButton(
                  child: const Text('Show Platform Icons'),
                  onPressed: () => Navigator.of(context).push(
                    platformPageRoute(
                      context: context,
                      builder: (context) => const IconsPage(),
                    ),
                  ),
                ),
              ),
            // ! Material on iOS
            if (isCupertino(context))
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformElevatedButton(
                  child: const Text('Show Material on iOS'),
                  onPressed: () => Navigator.of(context).push(
                    platformPageRoute(
                      context: context,
                      builder: (context) => const IosMaterialPage(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

String _getThemeMode(ThemeMode? themeMode) {
  if (themeMode == null) {
    return '';
  }
  return ' : ${themeMode.name}';
}

ThemeMode _cycleThemeMode(ThemeMode? mode) {
  if (mode == null) return ThemeMode.light;
  switch (mode) {
    case ThemeMode.system:
      return ThemeMode.light;
    case ThemeMode.light:
      return ThemeMode.dark;
    case ThemeMode.dark:
      return ThemeMode.system;
  }
}

Future<void> _showDatePicker(BuildContext context) async {
  final now = DateUtils.dateOnly(DateTime.now());
  final date = await showPlatformDatePicker(
    context: context,
    firstDate: now.subtract(const Duration(days: 100)),
    lastDate: now.add(const Duration(days: 100)),
    initialDate: now,
  );

  if (date != null) {
    _showExampleDialog(context, 'Date: $date');
  }
}

void _showExampleDialog(BuildContext context, String text) {
  showPlatformDialog(
    context: context,
    builder: (_) => PlatformAlertDialog(
      title: const Text('Alert'),
      content: Text('$text content'),
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

void _showPopupSheet(BuildContext context, String text) {
  showPlatformModalSheet(
    context: context,
    builder: (_) => PlatformWidget(
      material: (_, __) => _androidPopupContent(context, text),
      cupertino: (_, __) => _cupertinoSheetContent(context, text),
    ),
  );
}

Widget _androidPopupContent(BuildContext context, String text) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: PlatformText('Option 1 $text'),
          ),
          onTap: () => Navigator.pop(context),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: PlatformText('Option 2 $text'),
          ),
          onTap: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

Widget _cupertinoSheetContent(BuildContext context, String text) {
  return CupertinoActionSheet(
    title: Text('$text Favorite Dessert'),
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

class StateProvider<T> extends StatefulWidget {
  final T initialValue;
  final Widget Function(
    BuildContext context,
    T value,
    void Function(T) setValue,
  ) builder;

  const StateProvider({
    Key? key,
    required this.builder,
    required this.initialValue,
  }) : super(key: key);

  @override
  _StateProviderState<T> createState() => _StateProviderState<T>();
}

class _StateProviderState<T> extends State<StateProvider<T>> {
  late T state;

  @override
  void initState() {
    super.initState();

    state = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      state,
      (T newValue) => setState(() => state = newValue),
    );
  }
}

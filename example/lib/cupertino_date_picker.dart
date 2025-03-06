import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Future<void> showDatePickerWithCustomCupertinoStateful(BuildContext context) async {
  final now = DateUtils.dateOnly(DateTime.now());
  final firstDate = now.subtract(const Duration(days: 100));
  final lastDate = now.add(const Duration(days: 100));
  final date = await showPlatformDatePicker(
    context: context,
    firstDate: firstDate,
    lastDate: lastDate,
    initialDate: now,
    cupertinoContentBuilder: (_, __) => _CustomCupertinoStatefulDatePicker(
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    ),
  );

  if (date != null) {
    _showResultDialog(context, 'Date: $date');
  }
}

Future<void> showDatePickerWithCustomCupertino(BuildContext context) async {
  final now = DateUtils.dateOnly(DateTime.now());
  final firstDate = now.subtract(const Duration(days: 100));
  final lastDate = now.add(const Duration(days: 100));
  var selectedDate = now;

  final date = await showPlatformDatePicker(
    context: context,
    firstDate: firstDate,
    lastDate: lastDate,
    initialDate: now,
    cupertinoContentBuilder: (
      contentData,
      _,
    ) =>
        StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        final contentData = DatePickerContentData(
          initialDate: now,
          firstDate: firstDate,
          lastDate: lastDate,
          selectedDate: selectedDate,
        );

        return _CustomCupertinoDatePicker(
          contentData: contentData,
          onDateTimeChanged: (newDate) =>
              setState(() => selectedDate = newDate),
        );
      },
    ),
  );

  if (date != null) {
    _showResultDialog(context, 'Date: $date');
  }
}

void _showResultDialog(BuildContext context, String text) {
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

class _CustomCupertinoStatefulDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const _CustomCupertinoStatefulDatePicker({
    required this.initialDate,
    this.firstDate,
    this.lastDate,
    Key? key,
  }) : super(key: key);

  @override
  _CustomCupertinoStatefulDatePickerState createState() =>
      _CustomCupertinoStatefulDatePickerState(
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
      );
}

class _CustomCupertinoStatefulDatePickerState
    extends State<_CustomCupertinoStatefulDatePicker> {
  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  _CustomCupertinoStatefulDatePickerState({
    required this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  @override
  void initState() {
    _selectedDate = initialDate;
    super.initState();
  }

  late DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    final contentData = DatePickerContentData(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      selectedDate: _selectedDate,
    );

    return _CustomCupertinoDatePicker(
      contentData: contentData,
      onDateTimeChanged: (newDate) => setState(() => _selectedDate = newDate),
    );
  }
}

class _CustomCupertinoDatePicker extends StatelessWidget {
  final double modalHeight;
  final Color? modalColor;
  final CupertinoDatePickerMode mode;
  final DatePickerContentData contentData;
  final ValueChanged<DateTime> onDateTimeChanged;
  final CupertinoDatePickerData? data;
  final String? doneLabel;
  final String? cancelLabel;

  const _CustomCupertinoDatePicker({
    required this.contentData,
    required this.onDateTimeChanged,
    // ignore: unused_element_parameter
    this.data,
    // ignore: unused_element_parameter
    this.modalColor,
    // ignore: unused_element_parameter
    this.modalHeight = 300,
    // ignore: unused_element_parameter
    this.mode = CupertinoDatePickerMode.date,
    // ignore: unused_element_parameter
    this.doneLabel,
    // ignore: unused_element_parameter
    this.cancelLabel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: modalHeight,
      color: modalColor ?? Theme.of(context).canvasColor,
      child: Stack(
        children: [
          CupertinoDatePicker(
            key: data?.key,
            mode: data?.mode ?? mode,
            onDateTimeChanged: (value) {
              data?.onDateTimeChanged?.call(value);
              onDateTimeChanged.call(value);
            },
            initialDateTime: contentData.initialDate,
            minimumDate: contentData.firstDate,
            maximumDate: contentData.lastDate,
            backgroundColor: data?.backgroundColor,
            dateOrder: data?.dateOrder,
            maximumYear: data?.maximumYear,
            minimumYear: data?.minimumYear ?? 1,
            minuteInterval: data?.minuteInterval ?? 1,
            use24hFormat: data?.use24hFormat ?? false,
          ),
          Row(
            children: [
              PlatformTextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(cancelLabel ?? 'Cancel'),
              ),
              const Spacer(),
              Text(
                '${contentData.selectedDate.toString()}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              PlatformTextButton(
                onPressed: () {
                  Navigator.pop(context, contentData.selectedDate);
                },
                child: Text(doneLabel ?? 'Done'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

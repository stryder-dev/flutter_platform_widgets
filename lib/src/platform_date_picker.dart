import 'package:flutter/cupertino.dart'
    show CupertinoDatePicker, CupertinoDatePickerMode, DatePickerDateOrder;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show
        Theme,
        showDatePicker,
        SelectableDayPredicate,
        DatePickerEntryMode,
        DatePickerMode;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_modal_sheet.dart';
import 'platform_provider.dart';
import 'platform_text_button.dart';
import 'widget_base.dart';

class DatePickerContentData {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime selectedDate;

  DatePickerContentData({
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.selectedDate,
  });
}

typedef DatePickerContentBuilder = Widget Function(
  DatePickerContentData data,
  CupertinoDatePickerData? cupertinoData,
);

class DatePickerData {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  DatePickerData({
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });
}

class MaterialDatePickerData extends DatePickerData {
  MaterialDatePickerData({
    super.initialDate,
    super.firstDate,
    super.lastDate,
    this.currentDate,
    this.initialEntryMode,
    this.selectableDayPredicate,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.locale,
    this.useRootNavigator,
    this.routeSettings,
    this.textDirection,
    this.builder,
    this.initialDatePickerMode,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.anchorPoint,
    this.keyboardType,
  });

  final DateTime? currentDate;
  final DatePickerEntryMode? initialEntryMode;
  final SelectableDayPredicate? selectableDayPredicate;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final Locale? locale;
  final bool? useRootNavigator;
  final RouteSettings? routeSettings;
  final TextDirection? textDirection;
  final TransitionBuilder? builder;
  final DatePickerMode? initialDatePickerMode;
  final String? errorFormatText;
  final String? errorInvalidText;
  final String? fieldHintText;
  final String? fieldLabelText;
  final Offset? anchorPoint;
  final TextInputType? keyboardType;
}

class CupertinoDatePickerData extends DatePickerData {
  CupertinoDatePickerData({
    super.initialDate,
    super.firstDate,
    super.lastDate,
    this.key,
    this.mode,
    this.onDateTimeChanged,
    this.minimumYear = 1,
    this.maximumYear,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.dateOrder,
    this.backgroundColor,
    this.doneLabel,
    this.cancelLabel,
  });

  final Key? key;
  final CupertinoDatePickerMode? mode;
  final int? minimumYear;
  final int? maximumYear;
  final int? minuteInterval;
  final bool? use24hFormat;
  final DatePickerDateOrder? dateOrder;
  final ValueChanged<DateTime>? onDateTimeChanged;
  final Color? backgroundColor;
  final String? doneLabel;
  final String? cancelLabel;
}

Future<DateTime?> showPlatformDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  PlatformBuilder<MaterialDatePickerData>? material,
  PlatformBuilder<CupertinoDatePickerData>? cupertino,
  DatePickerContentBuilder? cupertinoContentBuilder,
  PlatformBuilder? customData,
  Future<DateTime?> Function(
          BuildContext, PlatformTarget, DatePickerData, PlatformBuilder?)?
      customDatePicker,
}) async {
  final baseData = DatePickerData(
    firstDate: firstDate,
    lastDate: lastDate,
    initialDate: initialDate,
  );

  if (isMaterial(context)) {
    return await _showMaterialDatePicker(
      context,
      material,
      baseData,
    );
  } else if (isCupertino(context)) {
    return await _showCupertinoDatePicker(
      context,
      cupertino,
      cupertinoContentBuilder,
      baseData,
    );
  } else if (isCustom(context)) {
    final provider = PlatformProvider.of(context);
    final currentPlatform = platform(context);

    if (customDatePicker != null) {
      return customDatePicker.call(
        context,
        platform(context),
        baseData,
        customData?.call(context, currentPlatform),
      );
    }

    final platformBuilder = provider?.customWidgetBuilders?[currentPlatform];
    final showDatePicker = platformBuilder?.showDatePicker;
    if (showDatePicker != null) {
      return showDatePicker.call(
        context,
        baseData,
        customData?.call(context, currentPlatform),
      );
    }
  }

  if (isMaterialFallback(context)) {
    return await _showMaterialDatePicker(
      context,
      material,
      baseData,
    );
  } else if (isCupertinoFallback(context)) {
    return await _showCupertinoDatePicker(
      context,
      cupertino,
      cupertinoContentBuilder,
      baseData,
    );
  }

  throw UnsupportedError(
      'This platform is not supported: $defaultTargetPlatform');
}

Future<DateTime?> _showMaterialDatePicker(
  BuildContext context,
  PlatformBuilder<MaterialDatePickerData>? material,
  DatePickerData baseData,
) async {
  final data = material?.call(context, platform(context));
  return await showDatePicker(
    context: context,
    initialDate: data?.initialDate ?? baseData.initialDate!,
    firstDate: data?.firstDate ?? baseData.firstDate!,
    lastDate: data?.lastDate ?? baseData.lastDate!,
    builder: data?.builder,
    confirmText: data?.confirmText,
    currentDate: data?.currentDate,
    errorFormatText: data?.errorFormatText,
    errorInvalidText: data?.errorInvalidText,
    fieldHintText: data?.fieldHintText,
    fieldLabelText: data?.fieldLabelText,
    helpText: data?.helpText,
    initialDatePickerMode: data?.initialDatePickerMode ?? DatePickerMode.day,
    initialEntryMode: data?.initialEntryMode ?? DatePickerEntryMode.calendar,
    locale: data?.locale,
    routeSettings: data?.routeSettings,
    selectableDayPredicate: data?.selectableDayPredicate,
    textDirection: data?.textDirection,
    useRootNavigator: data?.useRootNavigator ?? true,
    cancelText: data?.cancelText,
    anchorPoint: data?.anchorPoint,
    keyboardType: data?.keyboardType,
  );
}

Future<DateTime?> _showCupertinoDatePicker(
  BuildContext context,
  PlatformBuilder<CupertinoDatePickerData>? cupertino,
  DatePickerContentBuilder? cupertinoContentBuilder,
  DatePickerData baseData,
) async {
  final data = cupertino?.call(context, platform(context));

  final contentData = DatePickerContentData(
    initialDate: data?.initialDate ?? baseData.initialDate,
    firstDate: data?.firstDate ?? baseData.firstDate,
    lastDate: data?.lastDate ?? baseData.lastDate,
    selectedDate: data?.initialDate ?? baseData.initialDate!,
  );
  return await _showDateModalBottomSheet<DateTime?>(
    context,
    cupertinoContentBuilder?.call(
          contentData,
          data,
        ) ??
        _renderManagedCupertinoDatePicker(
          data: data,
          initialDate: baseData.initialDate!,
          firstDate: baseData.firstDate!,
          lastDate: baseData.lastDate!,
        ),
  );
}

Widget _renderManagedCupertinoDatePicker({
  CupertinoDatePickerData? data,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  DateTime selectedDate = data?.initialDate ?? initialDate;

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      final contentData = DatePickerContentData(
        initialDate: data?.initialDate ?? initialDate,
        firstDate: data?.firstDate ?? firstDate,
        lastDate: data?.lastDate ?? lastDate,
        selectedDate: selectedDate,
      );
      return DefaultCupertinoDatePicker(
        contentData: contentData,
        data: data,
        onDateTimeChanged: (newDate) => setState(() => selectedDate = newDate),
      );
    },
  );
}

class DefaultCupertinoDatePicker extends StatelessWidget {
  final double modalHeight;
  final Color? modalColor;
  final CupertinoDatePickerMode mode;
  final DatePickerContentData contentData;
  final ValueChanged<DateTime> onDateTimeChanged;
  final CupertinoDatePickerData? data;
  final String? doneLabel;
  final String? cancelLabel;

  const DefaultCupertinoDatePicker({
    required this.contentData,
    required this.onDateTimeChanged,
    this.data,
    this.modalColor,
    this.modalHeight = 300,
    this.mode = CupertinoDatePickerMode.date,
    this.doneLabel,
    this.cancelLabel,
    super.key,
  });

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
                child: Text(data?.cancelLabel ?? cancelLabel ?? 'Cancel'),
              ),
              const Spacer(),
              PlatformTextButton(
                onPressed: () {
                  Navigator.pop(context, contentData.selectedDate);
                },
                child: Text(data?.doneLabel ?? doneLabel ?? 'Done'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<T?> _showDateModalBottomSheet<T>(
  BuildContext context,
  Widget content,
) async {
  return await showPlatformModalSheet<T>(
    context: context,
    builder: (builder) => content,
  );
}
